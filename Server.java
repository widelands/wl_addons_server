import java.io.*;
import java.net.*;
import java.nio.file.*;
import java.util.*;

public class Server {
	/*
	 * After the first contact, the client must send the following info:
	 *  - Protocol version
	 *  - \n
	 *  - Language name
	 *  - \n
	 *  - Username (or "" for no user)
	 *  - \n
	 *  - Password hash (or "" for no user)
	 *  - \n
	 *  - ENDOFSTREAM\n
	 * The server then replies with ENDOFSTREAM\n.
	 *
	 * The only currently supported protocol version is 4. All documentation here refers to version 4.
	 *
	 * All arguments to commands are whitespace-terminated strings.
	 * The return value is a \n-terminated string.
	 */
	public static enum CMD {
		/**
		 * CMD_LIST
		 * List all available add-on names.
		 * Returns:
		 * - Number N of add-ons
		 * - For each add-on: \n followed by the add-on's internal name.
		 * - \n
		 * - ENDOFSTREAM\n
		 */
		CMD_LIST,

		/**
		 * CMD_INFO name
		 * Returns detailed info about a specific addon.
		 * Arg 1: Add-on name
		 * Returns:
		 *  - unlocalized name, \n
		 *  - localized name, \n
		 *  - unlocalized description, \n
		 *  - localized description, \n
		 *  - unlocalized author, \n
		 *  - localized author, \n
		 *  - uploader name, \n
		 *  - add-on version string, \n
		 *  - i18n version string, \n
		 *  - category string, \n
		 *  - comma-separated list of requirements, \n
		 *  - minimum Widelands version, \n
		 *  - maximum Widelands version, \n
		 *  - sync safety state ('true' if sync-safe), \n
		 *  - number of screenshots, \n
		 *  - for each screenshot: name, \n, localized description, \n
		 *  - total filesize, \n
		 *  - upload timestamp, \n
		 *  - download count, \n
		 *  - number of '1' votes, \n
		 *  - ...
		 *  - number of '10' votes, \n
		 *  - number of comments, \n
		 *  - for each comment:
		 *      - name, \n,
		 *      - timestamp, \n,
		 *      - version, \n,
		 *      - number of \n characters in the message, \n
		 *      - message, \n
		 *  - "verified" or "unchecked", \n
		 *  - icon checksum (0 for no icon), \n
		 *  - icon filesize (0 for no icon), \n
		 *  - icon file as a byte stream
		 *  - ENDOFSTREAM\n
		 */
		CMD_INFO,

		/**
		 * CMD_DOWNLOAD name
		 * Download an add-on as a binary stream.
		 * Arg 1: Add-on name
		 * Returns:
		 *   - Integer string denoting number D of directories
		 *   - \n
		 *   - D Directory names (with full paths), each followed by \n
		 *   - For each of the D directories:
		 *     - Number F of regular files in the directory
		 *     - \n
		 *     - For each of the F files in the directory:
		 *       - filename
		 *       - \n
		 *       - checksum
		 *       - \n
		 *       - filesize in bytes
		 *       - \n
		 *       - The content of the file as a byte stream
		 *   - ENDOFSTREAM\n
		 */
		CMD_DOWNLOAD,

		/** 
		 * CMD_I18N name
		 * Download an add-on's translations as a binary stream.
		 * Arg 1: Add-on name
		 * Returns:
		 *   - Integer string denoting number T of translations
		 *   - \n
		 *   - For each of the T languages:
		 *     - <language_name>.mo
		 *     - \n
		 *     - checksum
		 *     - \n
		 *     - MO file size in bytes
		 *     - \n
		 *     - The content of the MO file as a byte stream
		 *   - \n
		 *   - ENDOFSTREAM\n
		 */
		CMD_I18N,

		/** 
		 * CMD_SCREENSHOT addon screenie
		 * Download a screenshot.
		 * Arg 1: Add-on name
		 * Arg 2: Screenshot name
		 * Returns:
		 *   - checksum
		 *   - \n
		 *   - file size in bytes
		 *   - \n
		 *   - content of the image file as a byte stream
		 *   - ENDOFSTREAM\n
		 */
		CMD_SCREENSHOT,

		/** 
		 * CMD_VOTE name vote
		 * Vote on an add-on.
		 * Arg 1: Add-on name
		 * Arg 2: Vote (as string) 1-10
		 * Returns: ENDOFSTREAM\n or an error message\n
		 */
		CMD_VOTE,

		/** 
		 * CMD_GET_VOTE name
		 * How the user voted an add-on.
		 * Arg 1: Add-on name
		 * Returns: NOT_LOGGED_IN\n, or vote as string followed by \n and ENDOFSTREAM\n
		 */
		CMD_GET_VOTE,

		/** 
		 * CMD_COMMENT name version whitespaces message
		 * Vote on an add-on.
		 * Arg 1: Add-on name
		 * Arg 2: Add-on version
		 * Arg 3: Number of whitespaces in the message
		 * Arg 4: Comment message (NOTE: use '\0' instead of \n for line breaks)
		 * Returns: ENDOFSTREAM\n or an error message\n
		 */
		CMD_COMMENT,

		/** 
		 * CMD_SUBMIT name
		 * Upload an add-on.
		 * Arg 1: Add-on name
		 * Then, on the next line, the content of the add-on like the payload for CMD_DOWNLOAD, terminated by ENDOFSTREAM\n.
		 * Returns: ENDOFSTREAM\n or an error message\n
		 */
		CMD_SUBMIT,

		/** 
		 * CMD_SUBMIT_SCREENSHOT name filesize checksum whitespaces description 
		 * Upload a screenshot.
		 * Arg 1: Add-on name
		 * Arg 2: Filesize in bytes
		 * Arg 3: The file's checksum
		 * Arg 4: Number of whitespaces in the description
		 * Arg 5: Screenshot description
		 * Then, on the next line, the content of the image file like for CMD_SCREENSHOT, terminated by ENDOFSTREAM\n.
		 * Returns: ENDOFSTREAM\n or an error message\n
		 */
		CMD_SUBMIT_SCREENSHOT,
	}

	public static class ProtocolException extends RuntimeException {
		public final String message;
		public ProtocolException(String msg) {
			super();
			message = "ProtocolException: " + msg;
		}
		@Override public String toString() { return message; }
	}

	public static String readLine(InputStream in) throws Exception { return readLine(in, true); }
	public static String readLine(InputStream in, boolean exceptionOnStreamEnd) throws Exception {
		String str = "";
		for (;;) {
			int c = in.read();
			if (c < 0) {
				if (exceptionOnStreamEnd) throw new ProtocolException("Stream ended unexpectedly during readLine");
				return null;
			}
			if (c == (char)'\n') return str;
			str += (char)c;
		}
	}

	public static void main(String[] args) throws Exception {
		System.out.println("Server starting.");
		ServerSocket serverSocket = new ServerSocket(7399);
		while (true) {
			Socket s = serverSocket.accept();
			new Thread() { public void run() {
				PrintStream out = null;
				try {
					System.out.println("[" + Thread.currentThread().getName() + "] Connection received.");
					out = new PrintStream(s.getOutputStream(), true);
					InputStream in = s.getInputStream();

					final int protocolVersion = Integer.valueOf(readLine(in));
					if (protocolVersion != 4) {
						throw new ProtocolException("Unsupported version");
					}
					final String locale = readLine(in);
					final String username = readLine(in);
					final String password = readLine(in);
					if ((!username.isEmpty() || !password.isEmpty()) && !auth(username, password)) {
						throw new ProtocolException("Wrong username or password");
					}
					if (!readLine(in).equals("ENDOFSTREAM")) {
						throw new ProtocolException("Stream continues past its end");
					}
					out.println("ENDOFSTREAM");

					String cmd;
					while ((cmd = readLine(in, false)) != null) {
						handle(cmd.split(" "), out, in, protocolVersion, username, locale);
					}
				} catch (Exception e) {
					System.out.println("[" + Thread.currentThread().getName() + "] ERROR: " + e);
					if (out != null) out.println(e);
				}
				System.out.println("[" + Thread.currentThread().getName() + "] Connection quit.");
				if (out != null) out.close();
			}}.start();
		}
	}

	public static File[] listSorted(File dir) {
		File[] files = dir.listFiles();
		Arrays.sort(files);
		return files;
	}

	private static void handle(String[] cmd, PrintStream out, InputStream in,
			int version, String username, String locale) throws Exception {
		switch (CMD.valueOf(cmd[0])) {
			case CMD_LIST: {  // Args: –
				File[] names = listSorted(new File("addons"));
				String str = "" + names.length;
				for (File s : names) str += "\n" + s.getName();
				out.println(str);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_INFO:  // Args: name
				info(version, cmd[1], locale, out);
				return;
			case CMD_DOWNLOAD: {  // Args: name
				DirInfo dir = new DirInfo(new File("addons", cmd[1]));
				Utils.registerDownload(cmd[1]);
				out.println(dir.totalDirs);
				dir.writeAllDirNames(out, "");
				dir.writeAllFileInfos(out);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_I18N: {  // Args: name
				DirInfo dir = new DirInfo(new File("i18n", cmd[1]));
				dir.writeAllFileInfos(out);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_SCREENSHOT: {  // Args: addon screenie
				writeOneFile(new File("screenshots/" + cmd[1], cmd[2]), out);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_COMMENT: {  // Args: name version whitespaces message
				if (username.isEmpty()) {
					out.println("Please log in to comment");
					return;
				}
				String msg = cmd[4];
				for (int i = 0; i < Integer.valueOf(cmd[3]); ++i) msg += " " + cmd[5 + i];
				Utils.comment(cmd[1], username, cmd[2], msg.replaceAll("\0", "\n"));
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_VOTE:  // Args: name vote
				if (username.isEmpty()) {
					throw new ProtocolException("Wrong username or password");
				} else {
					Utils.registerVote(cmd[1], username, cmd[2]);
					out.println("ENDOFSTREAM");
				}
				return;
			case CMD_GET_VOTE: {  // Args: name
				if (username.isEmpty()) {
					out.println("NOT_LOGGED_IN");  // No exception here.
					return;
				}
				Utils.Value vote = Utils.readProfile(new File("metadata", cmd[1]), cmd[1]).get("vote_" + username);
				out.println(vote == null ? "0" : vote.value);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_SUBMIT_SCREENSHOT: {  // Args: name filesize checksum whitespaces description
				if (username.isEmpty()) {
					throw new ProtocolException("Wrong username or password");
				}
				File tempDir = new File("temp/screenies", cmd[1]);
				while (tempDir.exists()) tempDir = new File("temp/screenies", tempDir.getName() + "_");
				tempDir.mkdirs();
				String filename;
				for (int i = 1;; ++i) {
					filename = "image" + i + ".png";
					if (!new File("screenshots/" + cmd[1], filename).exists()) break;
				}
				File file = new File(tempDir, filename);
				long size = Long.valueOf(cmd[2]);
				PrintStream stream = new PrintStream(file);
				for (long l = 0; l < size; ++l) {
					int b = in.read();
					if (b < 0) {
						doDelete(tempDir);
						throw new ProtocolException("Stream ended unexpectedly while reading file");
					}
					stream.write(b);
				}
				stream.close();
				String checksum = UpdateList.checksum(file);
				if (!checksum.equals(cmd[3])) {
					doDelete(tempDir);
					throw new ProtocolException("Checksum mismatch: expected " + cmd[3] + ", found " + checksum);
				}
				if (!readLine(in).equals("ENDOFSTREAM")) {
					doDelete(tempDir);
					throw new ProtocolException("Stream continues past its end");
				}
				File result = new File("screenshots", cmd[1]);
				result.mkdirs();
				result = new File(result, filename);
				file.renameTo​(result);
				doDelete(tempDir);
				TreeMap<String, Utils.Value> ch = new TreeMap<>();
				int whitespaces = Integer.valueOf(cmd[4]);
				String msg = cmd[5];
				for (int w = 0; w < whitespaces; ++w) msg += " " + cmd[6 + w];
				ch.put(filename, new Utils.Value(filename, msg, cmd[1]));
				Utils.editProfile(new File("screenshots/" + cmd[1], "descriptions"), cmd[1], ch);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_SUBMIT: {  // Args: name
				if (username.isEmpty()) {
					throw new ProtocolException("Wrong username or password");
				}
				File tempDir = new File("temp/submit", cmd[1]);
				while (tempDir.exists()) tempDir = new File("temp/submit", tempDir.getName() + "_");
				tempDir.mkdirs();
				final int nrDirs = Integer.valueOf(readLine(in));
				File[] dirnames = new File[nrDirs];
				for (int i = 0; i < nrDirs; ++i) {
					dirnames[i] = new File(tempDir, readLine(in));
					dirnames[i].mkdirs();
				}
				for (int i = 0; i < nrDirs; ++i) {
					final int nrFiles = Integer.valueOf(readLine(in));
					for (int j = 0; j < nrFiles; ++j) {
						final String filename = readLine(in);
						final String checksum = readLine(in);
						final long size = Long.valueOf(readLine(in));
						File file = new File(dirnames[i], filename);
						PrintStream stream = new PrintStream(file);
						for (long l = 0; l < size; ++l) {
							int b = in.read();
							if (b < 0) {
								doDelete(tempDir);
								throw new ProtocolException("Stream ended unexpectedly while reading file");
							}
							stream.write(b);
						}
						stream.close();
						String c = UpdateList.checksum(file);
						if (!checksum.equals(c)) {
							doDelete(tempDir);
							throw new ProtocolException("Checksum mismatch for " + dirnames[i].getPath() + "/" + filename + ": expected " + checksum + ", found " + c);
						}
					}
				}
				if (!readLine(in).equals("ENDOFSTREAM")) {
					doDelete(tempDir);
					throw new ProtocolException("Stream continues past its end");
				}
				File addOnDir = new File("addons", cmd[1]);
				File addOnMain = new File(addOnDir, "addon");
				if (addOnDir.isDirectory()) {
					TreeMap<String, Utils.Value> oldProfile = Utils.readProfile(addOnMain, cmd[1]);
					TreeMap<String, Utils.Value> newProfile = Utils.readProfile(new File(tempDir, "addon"), cmd[1]);
					if (!oldProfile.get("category").value.equals(newProfile.get("category").value)) {
						doDelete(tempDir);
						throw new ProtocolException("An add-on with the same name and a different category already exists.");
					}
					String[] oldVersion = oldProfile.get("version").value.split("\\.");
					String[] newVersion = newProfile.get("version").value.split("\\.");
					Boolean newer = null;
					for (int i = 0; i < oldVersion.length && i < newVersion.length; ++i) {
						if (!oldVersion[i].equals(newVersion[i])) {
							newer = (Integer.valueOf(oldVersion[i]) < Integer.valueOf(newVersion[i]));
							break;
						}
					}
					if (newer == null) newer = (oldVersion.length < newVersion.length);
					if (!newer) {
						doDelete(tempDir);
						throw new ProtocolException("An add-on with the same name and an equal or newer version already exists.");
					}
				}
				if (addOnDir.exists()) doDelete(addOnDir);
				else initMetadata(cmd[1], username);
				tempDir.renameTo​(addOnDir);
				// NOCOM edit metadata to remove Verified badge
				if (Utils._staticprofiles.containsKey(addOnMain)) Utils._staticprofiles.remove(addOnMain);
				out.println("ENDOFSTREAM");
				return;
			}
			default: throw new ProtocolException("Invalid command " + cmd[0]);
		}
	}

	synchronized private static void doDelete(File f) {
		if (f.isDirectory()) for (File file : f.listFiles()) doDelete(file);
		f.delete();
	}

	synchronized private static void initMetadata(String addon, String uploader) throws Exception {
		PrintWriter w = new PrintWriter(new File("metadata", addon));
		w.println("timestamp=\"" + (System.currentTimeMillis() / 1000) + "\"");
		w.println("downloads=\"0\"");
		w.println("comments=\"0\"");
		w.println("security=\"unchecked\"");
		w.println("uploader=\"" + uploader + "\"");
		for (int i = 1; i <= 10; ++i) w.println("votes_" + i + "=\"0\"");
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
			if (r != len) throw new ProtocolException("Server-side error: Read " + r + " bytes but expected " + len);
			out.write(buffer);
			l -= len;
		}
	}

	private static class DirInfo {
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
				if (f.isDirectory()) subdirs.add(new DirInfo(f));
				else regularFiles.add(f);
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

	private static class Value {
		public final String key, value, textdomain;
		public String value(String locale) {
			if (textdomain == null || textdomain.isEmpty()) return value;
			try {
				return new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec(new String[] {
						"bash", "-c",
							"TEXTDOMAINDIR=./i18n/ TEXTDOMAIN=" + textdomain + " LANGUAGE=" + locale +
								" gettext -s \"" + value.replaceAll("\"", "\\\"") + "\""
					}).getInputStream())).readLine();
			} catch (Exception e) {
				System.out.println("[" + Thread.currentThread().getName() + "] WARNING: gettext error for '" +
						key + "'='" + value + "' @ '" + textdomain + "' / '" + locale + "': " + e);
				return value;
			}
		}
		Value(String k, String v) {
			this(k, v, null);
		}
		Value(String k, String v, String t) {
			key = k;
			value = v;
			textdomain = t;
		}
	}

	synchronized private static boolean auth(String user, String passwd) throws Exception {
		// NOCOM
		Utils.Value p = Utils.readProfile(new File("metadata/users"), null).get(user);
		return p != null && p.value.equals(passwd);
	}

	synchronized public static void info(final int version, final String addon, final String locale, PrintStream out) throws Exception {
		switch (version) {
			case 4: {
				TreeMap<String, Utils.Value> profile = Utils.readProfile(new File("addons/" + addon, "addon"), addon);
				TreeMap<String, Utils.Value> metadata = Utils.readProfile(new File("metadata", addon), addon);
				TreeMap<String, Utils.Value> screenies = Utils.readProfile(new File("screenshots/" + addon, "descriptions"), addon);

				out.println(profile.get("name"         ).value        );
				out.println(profile.get("name"         ).value(locale));
				out.println(profile.get("description"  ).value        );
				out.println(profile.get("description"  ).value(locale));
				out.println(profile.get("author"       ).value        );
				out.println(profile.get("author"       ).value(locale));
				out.println(metadata.get("uploader"    ).value(locale));
				out.println(profile.get("version"      ).value);
				out.println(metadata.get("i18n_version").value);
				out.println(profile.get("category"     ).value);
				out.println(profile.get("requires"     ).value);
				out.println((profile.containsKey("min_wl_version") ? profile.get("min_wl_version").value : ""));
				out.println((profile.containsKey("max_wl_version") ? profile.get("max_wl_version").value : ""));
				out.println((profile.containsKey("sync_safe"     ) ? profile.get("sync_safe"     ).value : ""));

				out.println(screenies.size());
				for (String key : screenies.keySet()) out.println(key + "\n" + screenies.get(key).value(locale));

				out.println(Utils.filesize(new File("addons", addon)));
				out.println(metadata.get("timestamp").value);
				out.println(metadata.get("downloads").value);
				for (int i = 1; i <= 10; ++i) out.println(metadata.get("votes_" + i).value);

				int c = Integer.valueOf(metadata.get("comments").value);
				out.println(c);
				for (int i = 0; i < c; ++i) {
					out.println(metadata.get("comment_name_"      + i).value(locale));
					out.println(metadata.get("comment_timestamp_" + i).value);
					out.println(metadata.get("comment_version_"   + i).value);
					int l = Integer.valueOf(metadata.get("comment_" + i).value);
					out.println(l);
					for (int j = 0; j <= l; ++j) out.println(metadata.get("comment_" + i + "_" + j).value(locale));
				}
				out.println(metadata.get("security").value);

				File iconFile = new File("addons/" + addon, "icon.png");
				if (iconFile.isFile()) {
					writeOneFile(iconFile, out);
				} else {
					out.println("0\n0");
				}

				out.println("ENDOFSTREAM");
				return;
			}
			default: throw new ProtocolException("Wrong version " + version);
		}
	}
}
