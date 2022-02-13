/*
 * Copyright (C) 2021 by the Widelands Development Team
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

package wl.server;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.Semaphore;
import wl.utils.Utils;

/**
 * Miscellaneous utilities used by server processes.
 */
public class ServerUtils {
	private ServerUtils() {}

	/**
	 * A random number generator.
	 * <p>
	 * Use only this generator to generate random numbers.
	 */
	public static final Random RANDOM = new Random(System.currentTimeMillis());

	/**
	 * The duration in seconds how long a comment may be edited after posting.
	 */
	public static final long kCommentEditTimeout = 24 * 60 * 60;

	/**
	 * Interface to describe a simple method that takes no parameters and may throw any Exception.
	 */
	public static interface Functor {

		/**
		 * This can be any function at all.
		 * @throws Exception If anything at all goes wrong, throw an Exception.
		 */
		public void run() throws Exception;
	}

	private static final Map<String, Semaphore> _semaphores = new HashMap<>();
	private static final int SEMAPHORE_BLOCK_RW_ACCESS = 100;
	private static Semaphore getSemaphore(String addon) {
		synchronized (_semaphores) {
			if (!_semaphores.containsKey(addon))
				_semaphores.put(addon, new Semaphore(SEMAPHORE_BLOCK_RW_ACCESS, true));
			return _semaphores.get(addon);
		}
	}

	/**
	 * Execute code in a thread-safe manner.
	 * The code is required not to modify the protected resource in any way.
	 * Any number of threads may access the same resource through this function simultaneously,
	 * but no modifications will happen to the resource while any such thread is running.
	 * If the resource is currently being modified, this function will block until the other
	 * thread has releases the resource again before starting to run your code.
	 * @param addon Resource to protect.
	 * @param f Code to execute.
	 * @throws Exception Thrown by <var>f</var>.
	 */
	public static void semaphoreRO(String addon, Functor f) throws Exception {
		doSemaphore(addon, 1, f);
	}

	/**
	 * Execute code in a thread-safe manner.
	 * The code may modify the protected resource in any way.
	 * No other thread may access or modify the resource while the code is executing.
	 * If the resource is currently being accessed or modified, this function will block until
	 * all other threads have released the resource again before starting to run your code.
	 * @param addon Resource to protect.
	 * @param f Code to execute.
	 * @throws Exception Thrown by <var>f</var>.
	 */
	public static void semaphoreRW(String addon, Functor f) throws Exception {
		doSemaphore(addon, SEMAPHORE_BLOCK_RW_ACCESS, f);
	}

	private static void doSemaphore(String addon, final int i, Functor f) throws Exception {
		Semaphore s = getSemaphore(addon);
		s.acquire(i);
		try {
			f.run();
		} catch (Exception e) {
			throw e;
		} finally {
			s.release(i);
		}
	}

	/**
	 * An exception that indicates any form of invalid
	 * communication between the server and a client.
	 */
	public static class WLProtocolException extends RuntimeException {

		/**
		 * Constructor.
		 * @param msg Error message.
		 */
		public WLProtocolException(String msg) { super("WL Protocol Exception: " + msg); }

		@Override
		public String toString() {
			return getMessage();
		}
	}

	/**
	 * Read a single line of input from a stream.
	 * @param in Stream to read from.
	 * @return The text read.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static String readLine(InputStream in) throws Exception { return readLine(in, true); }

	/**
	 * Read a single line of input from a stream.
	 * @param in Stream to read from.
	 * @param exceptionOnStreamEnd If this is false, no Exception will be thrown if the stream
	 *                             is closed during reading. Instead null will be returned.
	 * @return The text read, or null if the stream was closed.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static String readLine(InputStream in, boolean exceptionOnStreamEnd) throws Exception {
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		for (long count = 0;; count++) {
			int c = in.read();
			if (c < 0) {
				if (exceptionOnStreamEnd)
					throw new WLProtocolException("Stream ended unexpectedly during readLine");
				return null;
			}
			if (c == '\n') return buffer.toString("UTF-8");
			if (count > 10000)
				throw new ServerUtils.WLProtocolException("Line length limit exceeded");
			buffer.write(c);
		}
	}

	/**
	 * Check that the next line of text from the given stream is the end-of-input delimiter.
	 * Throws an exception if this is not the case.
	 * @param in Stream to read from.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void checkEndOfStream(InputStream in) throws Exception {
		if (!readLine(in).equals("ENDOFSTREAM"))
			throw new WLProtocolException("Stream continues past its end");
	}

	/**
	 * Class to recursively write a directory structure.
	 */
	public static class DirInfo {

		/** The base directory represented by this object. */
		public final File file;

		/** All regular files in this directory. */
		public final ArrayList<File> regularFiles;

		/** All subdirectories of this directory. */
		public final ArrayList<DirInfo> subdirs;

		/** Total number of all subdirectories, including nested subdirectories. */
		public final int totalDirs;

		/** Total number of all files, including those in subdirectories. */
		public final int totalFiles;

		/**
		 * Constructor.
		 * @param dir The directory to represent.
		 */
		public DirInfo(File dir) {
			file = dir;
			regularFiles = new ArrayList<>();
			subdirs = new ArrayList<>();

			for (File f : Utils.listSorted(dir)) {
				if (f.isDirectory())
					subdirs.add(new DirInfo(f));
				else
					regularFiles.add(f);
			}

			int t = 0;
			for (File f : regularFiles) t++;
			totalFiles = t;
			t = 0;
			for (DirInfo d : subdirs) t += d.totalDirs + 1;
			totalDirs = t;
		}

		/**
		 * Recursively write all directory names to a stream.
		 * @param out Stream to write to.
		 * @param prefix Path to prepend to all directory paths.
		 */
		public void writeAllDirNames(PrintStream out, String prefix) {
			for (DirInfo d : subdirs) {
				out.println(prefix + d.file.getName());
				d.writeAllDirNames(out, prefix + d.file.getName() + "/");
			}
		}

		/**
		 * Recursively write all files to a stream.
		 * @param out Stream to write to.
		 * @throws Exception If anything at all goes wrong, throw an Exception.
		 */
		public void writeAllFileInfos(PrintStream out) throws Exception {
			out.println(regularFiles.size());
			for (File f : regularFiles) {
				out.println(f.getName());
				writeOneFile(f, out);
			}
			for (DirInfo d : subdirs) d.writeAllFileInfos(out);
		}
	}

	/**
	 * Check that a client has sent exactly the expected number of arguments.
	 * Throws an exception if this is not the case.
	 * @param cmd Command array (the arguments are positioned in index 1+).
	 * @param expected Number of expected arguments (not counting the command itself).
	 * @throws WLProtocolException If anything at all goes wrong, throw an Exception.
	 */
	public static void checkNrArgs(String[] cmd, int expected) throws WLProtocolException {
		if (cmd.length != expected + 1)
			throw new WLProtocolException("Expected " + expected + " argument(s), found " +
			                              (cmd.length - 1));
	}

	/**
	 * Check that a given file or directory name is valid, and replace sequences that are
	 * problematic but valid. Throws an exception if the input is not a permitted name.
	 * @param name Name to check.
	 * @param directory Is this name supposed to denote a regular file or a directory.
	 * @return Sanitized name.
	 * @throws WLProtocolException If anything at all goes wrong, throw an Exception.
	 */
	public static String sanitizeName(String name, boolean directory) throws WLProtocolException {
		if (name == null || (!directory && name.isEmpty()))
			throw new WLProtocolException("Empty name");
		if (name.length() > 80)
			throw new WLProtocolException("Name '" + name + "' is too long (" + name.length() +
			                              " chars; limit is 80)");

		if (directory) {
			name = name.replace('\\', '/');
			if (name.startsWith("/")) name = name.substring(1);
		}

		for (char c : name.toCharArray()) {
			if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '1' && c <= '9') ||
			    c == '0' || c == '.' || c == '_' || c == '-')
				continue;
			if (directory && c == '/') continue;
			throw new WLProtocolException("Name '" + name + "' may not contain the character '" +
			                              c + "'");
		}

		if (name.startsWith("/"))
			throw new WLProtocolException("Name '" + name + "' may not start with '/'");
		if (name.contains(".."))
			throw new WLProtocolException("Name '" + name + "' may not contain '..'");

		return name;
	}

	/**
	 * Check that an add-on exists.
	 * Throws an exception if this is not the case.
	 * @param name Name to check.
	 * @throws WLProtocolException If anything at all goes wrong, throw an Exception.
	 */
	public static void checkAddOnExists(String name) throws WLProtocolException {
		if (!(new File("addons/" + name, "addon").isFile())) {
			throw new WLProtocolException("Add-on '" + name + "' does not exist");
		}
	}

	/**
	 * Dump a file and some of its metadata to a stream.
	 * @param f File to send.
	 * @param out Stream to write to.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void writeOneFile(File f, PrintStream out) throws Exception {
		out.println(Utils.checksum(f));
		long l = f.length();
		out.println(l);
		FileInputStream read = new FileInputStream(f);
		while (l > 0) {
			int len = (int)Math.min(l, Integer.MAX_VALUE - 1);
			byte[] buffer = new byte[len];
			int r = read.read(buffer, 0, len);
			if (r != len)
				throw new WLProtocolException("Server-side error: Read " + r +
				                              " bytes but expected " + len);
			out.write(buffer);
			l -= len;
		}
	}

	/**
	 * Recursively delete a directory or file.
	 * @param f Directory or file to delete.
	 */
	synchronized public static void doDelete(File f) {
		if (f.isDirectory()) {
			for (File file : f.listFiles()) {
				doDelete(file);
			}
		}
		f.delete();
	}

	/**
	 * Recursively move a directory and its content.
	 * @param src File or directory to move from
	 * @param target File or directory to move to
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	synchronized public static void doMove(File src, File target) throws Exception {
		if (src.isDirectory()) {
			target.mkdir();
			for (File file : src.listFiles()) {
				doMove(file, new File(target, file.getName()));
			}
			src.delete();
		} else {
			Files.move(src.toPath(), target.toPath());
		}
	}

	/**
	 * Generate the Transifex resource name associated with an add-on.
	 * @param name Name of the add-on.
	 * @return Transifex resource name.
	 */
	public static String toTransifexResource(String name) {
		return "widelands-addons." + name.replaceAll("[._]", "-");
	}

	/**
	 * Check which users should receive notifications of a given type.
	 * @param noticetype Internal name of the notice type (config file key without prefix,
	 *                   e.g. 'comment-mention' for the key 'noticetype_comment-mention').
	 * @param limitToUsers If not null, do not send a message to users not listed in this set.
	 * @return All users who should receive a notification.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static Set<Long> getNotificationSubscribers(String noticetype, Set<Long> limitToUsers)
	    throws Exception {
		ResultSet sql =
		    Utils.sql(Utils.Databases.kWebsite,
		              "select id,send_default from wladdons_settings_addonnoticetype where slug=?",
		              Utils.config("noticetype_" + noticetype));
		if (!sql.next()) {
			Utils.log("WARNING: Notice type '" + noticetype + "' is not known");
			return new HashSet<Long>();
		}
		final long noticetypeID = sql.getLong("id");
		final boolean sendDefault = sql.getLong("send_default") > 0;

		Set<Long> usersToSendMailTo = new HashSet<>();
		if (sendDefault) {
			if (limitToUsers == null) {
				Utils.log("WARNING: Refusing to send mass e-mail to all users by default");
			} else {
				// Send the e-mail to affected users only, sending a mail by default.
				for (Long user : limitToUsers) {
					sql = Utils.sql(
					    Utils.Databases.kWebsite,
					    "select shouldsend from wladdons_settings_addonnoticeuser where notice_type_id=? and user_id=?",
					    noticetypeID, user);
					if (!sql.next() || sql.getLong("shouldsend") > 0) usersToSendMailTo.add(user);
				}
			}
		} else {
			// Send the e-mail to users who explicitly subscribed.
			sql = Utils.sql(
			    Utils.Databases.kWebsite,
			    "select user_id from wladdons_settings_addonnoticeuser where notice_type_id=? and shouldsend>0",
			    noticetypeID);
			while (sql.next()) {
				long user = sql.getLong("user_id");
				if (limitToUsers == null || limitToUsers.contains(user))
					usersToSendMailTo.add(user);
			}
		}

		return usersToSendMailTo;
	}

	/**
	 * Send notifications about a new comment to all affected and subscribed users.
	 * @param addon Add-on on which the user commented.
	 * @param commenter The user who wrote the comment.
	 * @param comment The comment message.
	 * @param oldMessage The former comment message if this is an edit
	 *                   of an existing comment, otherwise null.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void
	sendCommentNotifications(String addon, String commenter, String comment, String oldMessage)
	    throws Exception {
		Set<String> mentioned = findMentions(comment);
		mentioned.remove(commenter);
		if (oldMessage != null) mentioned.removeAll(findMentions(oldMessage));

		Set<Long> uploadersToInform = new HashSet<>();
		if (oldMessage == null) {
			ResultSet sql =
			    Utils.sql(Utils.Databases.kAddOns, "select user from uploaders where addon=?",
			              Utils.getAddOnID(addon));
			while (sql.next()) uploadersToInform.add(sql.getLong("user"));
			uploadersToInform.remove(Utils.getUserID(commenter));
		}

		for (String username : mentioned) {
			ResultSet sql = Utils.sql(Utils.Databases.kWebsite,
			                          "select id,email from auth_user where username=?", username);
			if (!sql.next()) {
				Utils.log("User '" + username + "' is not registered.");
				continue;
			}
			final long id = sql.getLong("id");
			if (getNotificationSubscribers("comment-mention", Set.of(id)).isEmpty()) continue;

			uploadersToInform.remove(id);
			Utils.sendEMail(sql.getString("email"), "Add-On Comment Mention",
			                "Dear " + username + ",\n\nyou have been mentioned in a comment by " +
			                    commenter + " on the add-on '" + addon + "':\n\n" + comment,
			                true);
		}

		uploadersToInform = getNotificationSubscribers("comment-added", uploadersToInform);

		for (Long uploader : uploadersToInform) {
			ResultSet sql = Utils.sql(Utils.Databases.kWebsite,
			                          "select username,email from auth_user where id=?", uploader);
			sql.next();
			Utils.sendEMail(sql.getString("email"), "New Add-On Comment",
			                "Dear " + sql.getString("username") + ",\n\n" + commenter +
			                    " has written a new comment on your add-on '" + addon + "':\n\n" +
			                    comment,
			                true);
		}
	}

	// Helper function for sendCommentNotifications()
	private static Set<String> findMentions(String text) {
		Set<String> mentioned = new HashSet<>();
		int len = text.length();
		for (int i = 0;;) {
			i = text.indexOf('@', i);
			if (i < 0) break;

			String name = "";
			for (; i + 1 < len;) {
				char c = text.charAt(++i);
				if (Character.isLetterOrDigit​(c) || c == '-' || c == '_' || c == '.' ||
				    c == '+' || c == '@') {
					name += c;
				} else {
					break;
				}
			}
			mentioned.add(name);
		}
		return mentioned;
	}

	/**
	 * Check that a client sends the correct password over a stream.
	 * Throws an exception if this is not the case.
	 * @param in Stream to receive further data from the client.
	 * @param out Stream to send data to the client.
	 * @param correctPassword The password required for successful authentification.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void passwordAuthentification(InputStream in,
	                                            PrintStream out,
	                                            String correctPassword) throws Exception {
		long r;
		synchronized (RANDOM) { r = RANDOM.nextLong(); }
		out.println(r);
		out.println("ENDOFSTREAM");

		Process p = Runtime.getRuntime().exec(new String[] {"md5sum"});
		PrintWriter md5 = new PrintWriter(p.getOutputStream());
		md5.println(correctPassword);
		md5.println(r);
		md5.close();
		final String expected =
		    new BufferedReader(new InputStreamReader(p.getInputStream())).readLine().split(" ")[0];

		final String password = readLine(in);
		checkEndOfStream(in);
		if (!password.equals(expected)) {
			throw new WLProtocolException("Wrong username or password");
		}
	}

	// Two helper functions for matchesWidelandsVersion()
	private static int[] string_to_version(String str) {
		String[] parts = str.split("\\.");
		int[] result = new int[parts.length];
		for (int i = 0; i < result.length; i++) result[i] = Integer.valueOf(parts[i]);
		return result;
	}
	private static boolean less(int[] a, int[] b) {
		int l = Math.min(a.length, b.length);
		for (int i = 0; i < l; i++)
			if (a[i] != b[i]) return a[i] < b[i];
		return a.length < b.length;
	}

	/**
	 * Check whether an add-on is compatible with a given version of Widelands.
	 * @param wl_version The Widelands version.
	 * @param min_wl_version The minimum version required by the add-on (may be null).
	 * @param max_wl_version The maximum version supported by the add-on (may be null).
	 * @return The add-on is compatible.
	 */
	public static boolean
	matchesWidelandsVersion(String wl_version, String min_wl_version, String max_wl_version) {
		// For the comparison logic, see AddOnInfo::matches_widelands_version
		if (min_wl_version != null && min_wl_version.isEmpty()) min_wl_version = null;
		if (max_wl_version != null && max_wl_version.isEmpty()) max_wl_version = null;
		if (min_wl_version == null && max_wl_version == null) {
			return true;
		}
		final int tilde = wl_version.indexOf('~');
		if (tilde < 0) {
			int[] wl = string_to_version(wl_version);
			if (min_wl_version != null && less(wl, string_to_version(min_wl_version))) {
				return false;
			}
			if (max_wl_version != null && less(string_to_version(max_wl_version), wl)) {
				return false;
			}
		} else {
			int[] next_wl = string_to_version(wl_version.substring(0, tilde));
			if (min_wl_version != null && !less(string_to_version(min_wl_version), next_wl)) {
				return false;
			}
			if (max_wl_version != null && less(string_to_version(max_wl_version), next_wl)) {
				return false;
			}
		}
		return true;
	}
}
