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

import java.io.*;
import java.net.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.*;
import java.util.concurrent.*;
import wl.utils.*;

abstract class ServerUtils {
	public static final ThreadActivityAndGitHubSyncManager SYNCER =
	    new ThreadActivityAndGitHubSyncManager();
	public static final Random RANDOM = new Random(System.currentTimeMillis());

	public static void log(String msg) {
		System.out.println("[" + new Date() + " @ " + Thread.currentThread().getName() + "] " +
		                   msg);
	}

	public static interface Functor { public void run() throws Exception; }

	private static final Map<String, Semaphore> _semaphores = new HashMap<>();
	private static final int SEMAPHORE_BLOCK_RW_ACCESS = 100;
	private static Semaphore getSemaphore(String addon) {
		synchronized (_semaphores) {
			if (!_semaphores.containsKey(addon))
				_semaphores.put(addon, new Semaphore(SEMAPHORE_BLOCK_RW_ACCESS, true));
			return _semaphores.get(addon);
		}
	}

	public static void semaphoreRO(String addon, Functor f) throws Exception {
		doSemaphore(addon, 1, f);
	}
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

	public static enum Databases {
		kWebsite("websitedatabase"),
		kAddOns("addonsdatabase");

		public final String configKey;
		private Databases(String k) { configKey = k; }
	}
	private static final Connection[] _databases = new Connection[Databases.values().length];

	public static void initDatabases() throws Exception {
		log("Initializing SQL...");

		Properties connectionProps = new Properties();
		connectionProps.put("user", Utils.config("databaseuser"));
		connectionProps.put("password", Utils.config("databasepassword"));

		for (Databases db : Databases.values()) {
			_databases[db.ordinal()] = DriverManager.getConnection​(
			    "jdbc:mysql://" + Utils.config("databasehost") + ":" + Utils.config("databaseport") + "/" + Utils.config(db.configKey), connectionProps);
		}
	}

	public static ResultSet sqlQuery(Databases db, String query) throws Exception {
		Connection c = _databases[db.ordinal()];
		synchronized (c) { return c.createStatement().executeQuery(query); }
	}
	public static void sqlCmd(Databases db, String cmd) throws Exception {
		Connection c = _databases[db.ordinal()];
		synchronized (c) { c.createStatement().execute(cmd); }
	}

	public static class WLProtocolException extends RuntimeException {
		public WLProtocolException(String msg) { super("WL Protocol Exception: " + msg); }
		@Override
		public String toString() {
			return getMessage();
		}
	}

	public static String readLine(InputStream in) throws Exception { return readLine(in, true); }
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

	public static void checkEndOfStream(InputStream in) throws Exception {
		if (!readLine(in).equals("ENDOFSTREAM"))
			throw new WLProtocolException("Stream continues past its end");
	}

	public static class DirInfo {
		public final File file;
		public final ArrayList<File> regularFiles;
		public final ArrayList<DirInfo> subdirs;
		public final int totalDirs;
		public final int totalFiles;

		public DirInfo(File dir) {
			file = dir;
			regularFiles = new ArrayList<>();
			subdirs = new ArrayList<>();

			for (File f : listSorted(dir)) {
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

		public void writeAllDirNames(PrintStream out, String prefix) {
			for (DirInfo d : subdirs) {
				out.println(prefix + d.file.getName());
				d.writeAllDirNames(out, prefix + d.file.getName() + "/");
			}
		}
		public void writeAllFileInfos(PrintStream out) throws Exception {
			out.println(regularFiles.size());
			for (File f : regularFiles) {
				out.println(f.getName());
				writeOneFile(f, out);
			}
			for (DirInfo d : subdirs) d.writeAllFileInfos(out);
		}
	}

	public static void checkNrArgs(String[] cmd, int expected) {
		if (cmd.length != expected + 1)
			throw new WLProtocolException("Expected " + expected + " argument(s), found " +
			                              (cmd.length - 1));
	}

	public static File[] listSorted(File dir) {
		File[] files = dir.listFiles();
		Arrays.sort(files);
		return files;
	}

	public static void checkNameValid(String name, boolean directory) {
		if (name == null || (!directory && name.isEmpty()))
			throw new WLProtocolException("Empty name");
		if (name.length() > 80)
			throw new WLProtocolException("Name '" + name + "' is too long (" + name.length() +
			                              " chars; limit is 80)");

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
	}

	public static void checkAddOnExists(String name) {
		if (!(new File("addons", name).isDirectory() &&
		      new File("metadata", name + ".maintain").isFile() &&
		      new File("metadata", name + ".server").isFile())) {
			throw new WLProtocolException("Add-on '" + name + "' does not exist");
		}
	}

	public static void writeOneFile(File f, PrintStream out) throws Exception {
		out.println(UpdateList.checksum(f));
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

	synchronized public static void doDelete(File f) {
		if (f.isDirectory()) {
			for (File file : f.listFiles()) {
				doDelete(file);
			}
		}
		f.delete();
	}

	// TODO: In the long run, get rid of the metadata files completely, move everything
	// to the database, and make the GitHub repo merely a mirror of the official server.
	public static void rebuildMetadata() throws Exception {
		log("Rebuilding metadata...");
		for (File f : listSorted(new File("addons"))) ServerUtils.updateMetadataVotes(f.getName());
	}

	public static void updateMetadataVotes(String addon) throws Exception {
		TreeMap<String, Utils.Value> edit = new TreeMap<>();
		for (int v = 1; v <= 10; v++) {
			long count = 0;
			ResultSet sql =
			    sqlQuery(Databases.kAddOns, "select user_id from uservotes where vote=" + v +
			                                    " and addon='" + addon + "'");
			while (sql.next()) count++;
			edit.put("votes_" + v, new Utils.Value("votes_" + v, Long.toString(count)));
		}
		Utils.editMetadata(true, addon, edit);
	}

	public static void registerVote(String addon, long user, int v) throws Exception {
		sqlCmd(Databases.kAddOns,
		       "delete from uservotes where user_id=" + user + " and addon='" + addon + "'");
		if (v > 0)
			sqlCmd(Databases.kAddOns, "insert into uservotes (user_id, addon, vote) value (" +
			                              user + ", '" + addon + "', " + v + ")");
		updateMetadataVotes(addon);
	}

	private static Object _enquiry_syncer = new Object();
	public static void sendEnquiry(String username, String msg) throws Exception {
		File dir = new File("enquiries");
		dir.mkdir();
		String filename =
		    username + "_" + new Date().toString().replaceAll(" ", "_").replaceAll(":", "-");
		synchronized (_enquiry_syncer) {
			while (new File(dir, filename).exists()) filename += "+";
		}
		PrintWriter w = new PrintWriter(new File(dir, filename));
		w.println(new Date());
		w.println("The user '" + username + "' sent the following message.");
		w.println("Please reply to https://www.widelands.org/messages/compose/" + username + "/");
		w.print(msg);
		w.close();
		Utils.sendNotificationToGitHubThread("A user has sent an enquiry, please help!\n\n"
		                                     + "- User: " + username + "\n"
		                                     + "- Filename: `" + filename + "`\n"
		                                     + "- Message length: " + msg.length() + " characters");
	}

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

	public static class MuninStatistics {
		private final long[] commandCounters;
		private final long initTime;
		private long currentTotalUsers, failedLogins, successfulLogins, successfulCommands;
		private final List<Long> currentRegisteredUsers, allRegisteredUsers;

		public MuninStatistics() {
			initTime = System.currentTimeMillis();
			commandCounters = new long[Command.values().length];
			for (int i = 0; i < commandCounters.length; i++) commandCounters[i] = 0;

			currentTotalUsers = 0;
			failedLogins = 0;
			successfulLogins = 0;
			successfulCommands = 0;
			currentRegisteredUsers = new ArrayList<>();
			allRegisteredUsers = new ArrayList<>();
		}

		public synchronized void printStats(int version, PrintStream out) throws Exception {
			switch (version) {
				case 1: {
					out.println(System.currentTimeMillis() - initTime);
					out.println(currentTotalUsers);
					out.println(currentRegisteredUsers.size());
					out.println(allRegisteredUsers.size());
					out.println(successfulLogins);
					out.println(failedLogins);

					long totalCmd = 0;
					for (long cmd : commandCounters) {
						totalCmd += cmd;
						out.println(cmd);
					}
					out.println(totalCmd - successfulCommands);

					break;
				}
				default:
					throw new WLProtocolException("Wrong version " + version);
			}
		}

		public synchronized void countCommand(Command cmd) { commandCounters[cmd.ordinal()]++; }
		public synchronized void registerSuccessfulCommand() { successfulCommands++; }
		public synchronized void registerLogin(long user) {
			successfulLogins++;
			currentTotalUsers++;
			if (user >= 0) {
				currentRegisteredUsers.add(user);
				if (!allRegisteredUsers.contains(user)) allRegisteredUsers.add(user);
			}
		}
		public synchronized void registerLogout(Long user) {
			currentTotalUsers--;
			currentRegisteredUsers.remove((Object)user);
		}
		public synchronized void registerFailedLogin() { failedLogins++; }
	}
	public static final MuninStatistics MUNIN = new MuninStatistics();

	public static void handleMunin(InputStream in, PrintStream out) throws Exception {
		final int version = Integer.valueOf(readLine(in));
		if (version != 1)
			throw new WLProtocolException("Unsupported munin version '" + version +
			                              "' (only supported version is '1')");
		log("Munin version: " + version);
		checkEndOfStream(in);

		passwordAuthentification(in, out, Utils.config("muninpassword"));
		MUNIN.printStats(version, out);
		out.println("ENDOFSTREAM");
	}

	public static void
	info(final int version, final String addon, final String locale, PrintStream out)
	    throws Exception {
		switch (version) {
			case 4: {
				TreeMap<String, Utils.Value> profile =
				    Utils.readProfile(new File("addons/" + addon, "addon"), addon);
				TreeMap<String, Utils.Value> metadataServer =
				    Utils.readProfile(new File("metadata", addon + ".server"), addon);
				TreeMap<String, Utils.Value> metadataMaintain =
				    Utils.readProfile(new File("metadata", addon + ".maintain"), addon);
				TreeMap<String, Utils.Value> screenies =
				    Utils.readProfile(new File("screenshots/" + addon, "descriptions"), addon);

				out.println(profile.get("name").value);
				out.println(profile.get("name").value(locale));
				out.println(profile.get("description").value);
				out.println(profile.get("description").value(locale));
				out.println(profile.get("author").value);
				out.println(profile.get("author").value(locale));
				out.println(metadataMaintain.get("uploader").value(locale));
				out.println(profile.get("version").value);
				out.println(metadataMaintain.get("i18n_version").value);
				out.println(profile.get("category").value);
				out.println(profile.get("requires").value);
				out.println((profile.containsKey("min_wl_version") ?
                                 profile.get("min_wl_version").value :
                                 ""));
				out.println((profile.containsKey("max_wl_version") ?
                                 profile.get("max_wl_version").value :
                                 ""));
				out.println(
				    (profile.containsKey("sync_safe") ? profile.get("sync_safe").value : ""));

				out.println(screenies.size());
				for (String key : screenies.keySet())
					out.println(key + "\n" + screenies.get(key).value(locale));

				out.println(Utils.filesize(new File("addons", addon)));
				out.println(metadataMaintain.get("timestamp").value);
				out.println(metadataServer.get("downloads").value);
				for (int i = 1; i <= 10; ++i) out.println(metadataServer.get("votes_" + i).value);

				int c = Integer.valueOf(metadataServer.get("comments").value);
				out.println(c);
				for (int i = 0; i < c; ++i) {
					out.println(metadataServer.get("comment_name_" + i).value);
					out.println(metadataServer.get("comment_timestamp_" + i).value);

					Utils.Value v = metadataServer.get("comment_editor_" + i);
					out.println(v == null ? "" : v.value);
					v = metadataServer.get("comment_edit_timestamp_" + i);
					out.println(v == null ? "0" : v.value);

					out.println(metadataServer.get("comment_version_" + i).value);
					int l = Integer.valueOf(metadataServer.get("comment_" + i).value);
					out.println(l);
					for (int j = 0; j <= l; ++j)
						out.println(metadataServer.get("comment_" + i + "_" + j).value(locale));
				}
				out.println(
				    metadataMaintain.get("version").value.equals(profile.get("version").value) ?
                        metadataMaintain.get("security").value :
                        "unchecked");

				File iconFile = new File("addons/" + addon, "icon.png");
				if (iconFile.isFile()) {
					ServerUtils.writeOneFile(iconFile, out);
				} else {
					out.println("0\n0");
				}

				out.println("ENDOFSTREAM");
				return;
			}
			default:
				throw new WLProtocolException("Wrong version " + version);
		}
	}
}
