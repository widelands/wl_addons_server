import java.io.*;
import java.net.*;
import java.nio.file.*;
import java.util.*;

public class Server {
	/*
	 * After the first contact, the client must send the following info:
	 *  - Protocol version
	 *  - \n'
	 *  - Language name
	 *  - \n'
	 *  - Username (or "" for no user)
	 *  - \n'
	 *  - Password hash (or "" for no user)
	 *  - '\n'
	 *  - ENDOFSTREAM\n
	 * The server then replies with ENDOFSTREAM\n.
	 *
	 * The only currently supported protocol version is 4. All documentation here refers to version 4.
	 *
	 * All arguments to commands are whitespace-terminated strings.
	 * The return value is a '\n'-terminated string.
	 */
	public static enum CMD {
		/**
		 * CMD_LIST
		 * List all available add-on names.
		 * Returns:
		 * - Number N of add-ons
		 * - For each add-on: '\n' followed by the add-on's internal name.
		 * - '\n'
		 * - ENDOFSTREAM\n
		 */
		CMD_LIST,

		/**
		 * CMD_INFO name
		 * Returns detailed info about a specific addon.
		 * Arg 1: Add-on name
		 * Returns:
		 *  - unlocalized name, '\n'
		 *  - localized name, '\n'
		 *  - unlocalized description, '\n'
		 *  - localized description, '\n'
		 *  - unlocalized author, '\n'
		 *  - localized author, '\n'
		 *  - uploader name, '\n'
		 *  - add-on version string, '\n'
		 *  - i18n version string, '\n'
		 *  - category string, '\n'
		 *  - comma-separated list of requirements, '\n'
		 *  - minimum Widelands version, '\n'
		 *  - maximum Widelands version, '\n'
		 *  - sync safety state ('true' if sync-safe), '\n'
		 *  - number of screenshots, '\n'
		 *  - for each screenshot: name, '\n', localized description, '\n'
		 *  - total filesize, '\n'
		 *  - upload timestamp, '\n'
		 *  - download count, '\n'
		 *  - number of '1' votes, '\n'
		 *  - ...
		 *  - number of '10' votes, '\n'
		 *  - number of comments, '\n'
		 *  - for each comment:
		 *      - name, '\n',
		 *      - timestamp, '\n',
		 *      - version, '\n',
		 *      - number of '\n' characters in the message, '\n'
		 *      - message, '\n'
		 *  - "verified" or "unchecked", '\n'
		 *  - ENDOFSTREAM\n
		 */
		CMD_INFO,

		/**
		 * CMD_DOWNLOAD name
		 * Download an add-on as a binary stream.
		 * Arg 1: Add-on name
		 * Returns:
		 *   - Integer string denoting number D of directories
		 *   - '\n'
		 *   - D Directory names (with full paths), each followed by '\n'
		 *   - For each of the D directories:
		 *     - Number F of regular files in the directory
		 *     - '\n'
		 *     - For each of the F files in the directory:
		 *       - filename
		 *       - '\n'
		 *       - checksum
		 *       - '\n'
		 *       - filesize in bytes
		 *       - '\n'
		 *       - The content of the file as a byte stream
		 *   - '\n'
		 *   - ENDOFSTREAM\n
		 */
		CMD_DOWNLOAD,

		/** 
		 * CMD_I18N name
		 * Download an add-on's translations as a binary stream.
		 * Arg 1: Add-on name
		 * Returns:
		 *   - Integer string denoting number T of translations
		 *   - '\n'
		 *   - For each of the T languages:
		 *     - <language_name>.mo
		 *     - '\n'
		 *     - checksum
		 *     - '\n'
		 *     - MO file size in bytes
		 *     - '\n'
		 *     - The content of the MO file as a byte stream
		 *   - '\n'
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
		 *   - '\n'
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
		 * Returns: ACCESSDENIED\n, or vote as string followed by '\n' and ENDOFSTREAM\n
		 */
		CMD_GET_VOTE,

		/** 
		 * CMD_COMMENT name version whitespaces message
		 * Vote on an add-on.
		 * Arg 1: Add-on name
		 * Arg 2: Add-on version
		 * Arg 3: Number of whitespaces in the message
		 * Arg 4: Comment message (NOTE: use '\0' instead of '\n' for line breaks)
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
					BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));

					final int protocolVersion = Integer.valueOf(in.readLine());
					if (protocolVersion != 4) {
						out.println("Unsupported version");
						return;
					}
					final String locale = in.readLine();
					final String username = in.readLine();
					final String password = in.readLine();
					if ((!username.isEmpty() || !password.isEmpty()) && !auth(username, password)) {
						out.println("Wrong username or password");
						return;
					}
					if (!in.readLine().equals("ENDOFSTREAM")) {
						out.println("Stream continues past its end");
						return;
					}
					out.println("ENDOFSTREAM");

					String cmd;
					while ((cmd = in.readLine()) != null) {
						handle(cmd.split(" "), out, in, protocolVersion, username, locale);
					}
				} catch (Exception e) {
					System.out.println("[" + Thread.currentThread().getName() + "] ERROR: " + e);
					if (out != null) out.println("e");
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

	private static void handle(String[] cmd, PrintStream out, BufferedReader in, int version, String username, String locale) throws Exception {
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
				out.println(info(version, cmd[1], locale));
				out.println("ENDOFSTREAM");
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
					out.println("Wrong username or password");
				} else {
					Utils.registerVote(cmd[1], username, cmd[2]);
					out.println("ENDOFSTREAM");
				}
				return;
			case CMD_GET_VOTE: {  // Args: name
				if (username.isEmpty()) {
					out.println("ACCESSDENIED");
					return;
				}
				Utils.Value vote = Utils.readProfile(new File("metadata", cmd[1]), cmd[1]).get("vote_" + username);
				out.println(vote == null ? "0" : vote.value);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_SUBMIT: {  // Args: name
				if (username.isEmpty()) {
					out.println("Wrong username or password");
					return;
				}
				File tempDir = new File("temp", cmd[1]);
				while (tempDir.exists()) tempDir = new File("temp", tempDir.getName() + "_");
				tempDir.mkdirs();
				final int nrDirs = Integer.valueOf(in.readLine());
				File[] dirnames = new File[nrDirs];
				for (int i = 0; i < nrDirs; ++i) {
					dirnames[i] = new File(tempDir, in.readLine());
					dirnames[i].mkdirs();
				}
				for (int i = 0; i < nrDirs; ++i) {
					final int nrFiles = Integer.valueOf(in.readLine());
					for (int j = 0; j < nrFiles; ++j) {
						final String filename = in.readLine();
						final String checksum = in.readLine();
						final long size = Long.valueOf(in.readLine());
						File file = new File(dirnames[i], filename);
						PrintStream stream = new PrintStream(file);
						for (long l = 0; l < size; ++l) stream.write(in.read());
						stream.close();
						String c = UpdateList.checksum(file);
						if (!checksum.equals(c)) {
							out.println("Checksum mismatch for " + dirnames[i].getPath() + "/" + filename + ": expected " + checksum + ", found " + c);
							doDelete(tempDir);
							return;
						}
					}
				}
				if (!in.readLine().equals("ENDOFSTREAM")) {
					out.println("Stream continues past its end");
					doDelete(tempDir);
					return;
				}
				File addOnDir = new File("addons", cmd[1]);
				if (addOnDir.isDirectory()) {
					TreeMap<String, Utils.Value> oldProfile = Utils.readProfile(new File(addOnDir, "addon"), cmd[1]);
					TreeMap<String, Utils.Value> newProfile = Utils.readProfile(new File(tempDir, "addon"), cmd[1]);
					if (!oldProfile.get("category").value.equals(newProfile.get("category").value)) {
						out.println("An add-on with the same name and a different category already exists.");
						doDelete(tempDir);
						return;
					}
					String[] oldVersion = oldProfile.get("version").value.split(".");
					String[] newVersion = oldProfile.get("version").value.split(".");
					Boolean newer = null;
					for (int i = 0; i < oldVersion.length && i < newVersion.length; ++i) {
						if (!oldVersion[i].equals(newVersion[i])) {
							newer = (Integer.valueOf(oldVersion[i]) < Integer.valueOf(newVersion[i]));
							break;
						}
					}
					if (newer == null) newer = (oldVersion.length < newVersion.length);
					if (!newer) {
						out.println("An add-on with the same name and an equal or newer version already exists.");
						doDelete(tempDir);
						return;
					}
				}
				if (addOnDir.exists()) doDelete(addOnDir);
				else initMetadata(cmd[1], username);
				tempDir.renameTo​(addOnDir);
				if (Utils._staticprofiles.containsKey(addOnDir)) Utils._staticprofiles.remove(addOnDir);
				out.println("ENDOFSTREAM");
				return;
			}
			default:
				out.println("Invalid command " + cmd[0]);
				return;
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
			if (r != len) {
				System.out.println("[" + Thread.currentThread().getName() + "] ERROR: Read " + r + " bytes but expected " + len);
				return;
			}
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

	synchronized public static String info(final int version, final String addon, final String locale) throws Exception {
		switch (version) {
			case 4: {
				TreeMap<String, Utils.Value> profile = Utils.readProfile(new File("addons/" + addon, "addon"), addon);
				TreeMap<String, Utils.Value> metadata = Utils.readProfile(new File("metadata", addon), null);
				TreeMap<String, Utils.Value> screenies = Utils.readProfile(new File("screenshots/" + addon, "descriptions"), addon);
				String str = "";

				str += profile.get("name"         ).value         + "\n";
				str += profile.get("name"         ).value(locale) + "\n";
				str += profile.get("description"  ).value         + "\n";
				str += profile.get("description"  ).value(locale) + "\n";
				str += profile.get("author"       ).value         + "\n";
				str += profile.get("author"       ).value(locale) + "\n";
				str += metadata.get("uploader"    ).value(locale) + "\n";
				str += profile.get("version"      ).value(locale) + "\n";
				str += metadata.get("i18n_version").value(locale) + "\n";
				str += profile.get("category"     ).value(locale) + "\n";
				str += profile.get("requires"     ).value(locale) + "\n";
				str += (profile.containsKey("min_wl_version") ? profile.get("min_wl_version").value : "") + "\n";
				str += (profile.containsKey("max_wl_version") ? profile.get("max_wl_version").value : "") + "\n";
				str += (profile.containsKey("sync_safe"     ) ? profile.get("sync_safe"     ).value : "") + "\n";

				str += screenies.size() + "\n";
				for (String key : screenies.keySet()) str += key + "\n" + screenies.get(key).value(locale) + "\n";

				str += Utils.filesize(new File("addons", addon)) + "\n";
				str += metadata.get("timestamp").value(locale) + "\n";
				str += metadata.get("downloads").value(locale) + "\n";
				for (int i = 1; i <= 10; ++i) str += metadata.get("votes_" + i).value(locale) + "\n";

				int c = Integer.valueOf(metadata.get("comments").value);
				str += c + "\n";
				for (int i = 0; i < c; ++i) {
					str += metadata.get("comment_name_"      + i).value(locale) + "\n";
					str += metadata.get("comment_timestamp_" + i).value(locale) + "\n";
					str += metadata.get("comment_version_"   + i).value(locale) + "\n";
					int l = Integer.valueOf(metadata.get("comment_" + i).value);
					str += l + "\n";
					for (int j = 0; j <= l; ++j) str += metadata.get("comment_" + i + "_" + j).value(locale) + "\n";
				}

				str += metadata.get("security"  ).value(locale);
				return str;
			}
			default:
				System.out.println("[" + Thread.currentThread().getName() + "] ERROR: Invalid info version '" + version + "'");
				return "";
		}
	}
}
