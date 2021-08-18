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
import java.util.*;
import java.util.concurrent.*;
import wl.utils.*;

abstract class ServerUtils {
	public static final ThreadActivityAndGitHubSyncManager SYNCER =
	    new ThreadActivityAndGitHubSyncManager();
	public static final Random RANDOM = new Random(System.currentTimeMillis());

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
		if (!(new File("addons/" + name, "addon").isFile())) {
			throw new WLProtocolException("Add-on '" + name + "' does not exist");
		}
	}

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

	synchronized public static void doDelete(File f) {
		if (f.isDirectory()) {
			for (File file : f.listFiles()) {
				doDelete(file);
			}
		}
		f.delete();
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

	// Two helper functions for matchesWidelandsVersion()
	private static int[] string_to_version(String str) {
		String[] parts = str.split(".");
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

	public static boolean
	matchesWidelandsVersion(String wl_version, String min_wl_version, String max_wl_version) {
		// For the comparison logic, see AddOnInfo::matches_widelands_version
		if (min_wl_version == null && max_wl_version == null) {
			return true;
		}
		final int tilde = wl_version.indexOf​('~');
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
