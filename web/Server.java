import java.io.*;
import java.net.*;
import java.nio.file.*;
import java.util.*;

public class Server {
	// All arguments are whitespace-terminated strings.
	// The return value is a '\n'-terminated string.
	public static enum CMD {
		/**
		 * CMD_LIST
		 * List all available add-on names.
		 * Returns:
		 * - Number N of add-ons
		 * - For each add-on: '\n' followed by the add-on's internal name.
		 * - '\n'
		 */
		CMD_LIST,

		/**
		 * CMD_INFO version name locale
		 * Returns detailed info about a specific addon.
		 * Arg 1: Info version (currently supported: 3)
		 * Arg 2: Add-on name
		 * Arg 3: Language name
		 * Returns (for version 3):
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
		 *       - filesize in bytes
		 *       - '\n'
		 *       - The content of the file as a byte stream
		 *   - '\n'
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
		 *     - MO file size in bytes
		 *     - '\n'
		 *     - The content of the MO file as a byte stream
		 *   - '\n'
		 */
		CMD_I18N,

		/** 
		 * CMD_VOTE name user passwd vote
		 * Vote on an add-on.
		 * Arg 1: Add-on name
		 * Arg 2: User's name
		 * Arg 3: User's password hash
		 * Arg 4: Vote (as string) 1-10
		 */
		CMD_VOTE,

		/** 
		 * CMD_GET_VOTE name user passwd
		 * How a user voted an add-on.
		 * Arg 1: Add-on name
		 * Arg 2: User's name
		 * Arg 3: User's password hash
		 * Returns: vote as string followed by '\n'
		 */
		CMD_GET_VOTE,

		/** 
		 * CMD_COMMENT name user passwd version whitespaces message
		 * Vote on an add-on.
		 * Arg 1: Add-on name
		 * Arg 2: User's name
		 * Arg 3: User's password hash
		 * Arg 4: Add-on version
		 * Arg 5: Number of whitespaces in the message
		 * Arg 6: Comment message (NOTE: use '\0' instead of '\n' for line breaks)
		 */
		CMD_COMMENT,

		/** 
		 * CMD_SUBMIT
		 * Upload an add-on. Not yet implemented.
		 */
		CMD_SUBMIT,
	}

	public static void main(String[] args) throws Exception {
		System.out.println("Server starting.");
		ServerSocket serverSocket = new ServerSocket(7399);
		while (true) {
			Socket s = serverSocket.accept();
			new Thread() { public void run() {
				try {
					System.out.println("Received a connection.");
					PrintStream out = new PrintStream(s.getOutputStream(), true);
					BufferedReader in = new BufferedReader(new InputStreamReader(s.getInputStream()));
					String cmd;
					while ((cmd = in.readLine()) != null) {
						handle(cmd.split(" "), out);
					}
				} catch (Exception e) {
					System.out.println("ERROR: " + e);
				}
				System.out.println("Quit a connection.");
			}}.start();
		}
	}

	private static void handle(String[] cmd, PrintStream out) throws Exception {
		switch (CMD.valueOf(cmd[0])) {
			case CMD_LIST: {
				String[] names = new File("../addons").list();
				String str = "" + names.length;
				for (String s : names) str += "\n" + s;
				out.println(str);
				return;
			}
			case CMD_INFO:
				out.println(info(Integer.valueOf(cmd[1]), cmd[2], cmd[3]));
				return;
			case CMD_DOWNLOAD: {
				DirInfo dir = new DirInfo(new File("../addons", cmd[1]));
				registerDownload(cmd[1]);
				out.println(dir.totalDirs);
				dir.writeAllDirNames(out, "");
				dir.writeAllFileInfos(out);
				out.println();
				return;
			}
			case CMD_I18N: {
				DirInfo dir = new DirInfo(new File("../i18n", cmd[1]));
				dir.writeAllFileInfos(out);
				out.println();
				return;
			}
			case CMD_COMMENT: {
				if (!auth(cmd[2], cmd[3])) return;
				String msg = cmd[6];
				for (int i = 0; i < Integer.valueOf(cmd[5]); ++i) msg += " " + cmd[7 + i];
				comment(cmd[1], cmd[2], cmd[4], msg.replaceAll("\0", "\n"));
				return;
			}
			case CMD_VOTE:
				if (!auth(cmd[2], cmd[3])) return;
				registerVote(cmd[1], cmd[2], cmd[4]);
				return;
			case CMD_GET_VOTE: {
				if (!auth(cmd[2], cmd[3])) {
					out.println();
					return;
				}
				Value vote = readProfile(new File("../metadata", cmd[1]), cmd[1]).get("vote_" + cmd[2]);
				out.println(vote == null ? "" : vote.value);
				return;
			}
			case CMD_SUBMIT:
				// NOCOM
			default:
				System.out.println("ERROR: Invalid command '" + cmd[0] + "'");
				out.println();
				return;
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

			for (File f : dir.listFiles()) {
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
				long l = f.length();
				out.println(f.getName());
				out.println(l);
				FileInputStream read = new FileInputStream(f);
				while (l > 0) {
					int len = (int)Math.min(l, Integer.MAX_VALUE - 1);
					byte[] buffer = new byte[len];
					int r = read.read(buffer, 0, len);
					if (r != len) {
						System.out.println("ERROR: Read " + r + " bytes but expected " + len);
						return;
					}
					out.write(buffer);
					l -= len;
				}
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
				System.out.println("WARNING: gettext error for '" + key + "'='" + value + "' @ '" + textdomain + "' / '" + locale + "': " + e);
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

	private static final TreeMap<File, TreeMap<String, Value>> _staticprofiles = new TreeMap<>();
	synchronized private static TreeMap<String, Value> readProfile(File f, String textdomain) throws Exception {
		if (_staticprofiles.containsKey(f)) return _staticprofiles.get(f);

		TreeMap<String, Value> profile = new TreeMap<>();
		for (String line : Files.readAllLines(f.toPath())) {
			if (line.trim().startsWith("#")) continue;
			String[] str = line.split("=");
			if (str.length < 2) {
				if (str.length == 1) profile.put(str[0], new Value(str[0], ""));
				continue;
			}
			String arg = str[1];
			for (int i = 2; i < str.length; ++i) arg += "=" + str[i];
			boolean localize = false;
			if (arg.startsWith("_")) { arg = arg.substring(1); localize = true; }
			if (arg.startsWith("\"")) arg = arg.substring(1);
			if (arg.endsWith("\"")) arg = arg.substring(0, arg.length() - 1);
			profile.put(str[0], new Value(str[0], arg, localize ? textdomain == null ? "" : textdomain : null));
		}

		_staticprofiles.put(f, profile);
		return profile;
	}

	synchronized private static boolean auth(String user, String passwd) throws Exception {
		Value p = readProfile(new File("users"), null).get(user);
		return p != null && p.value.equals(passwd);
	}

	synchronized private static void registerDownload(String addon) throws Exception {
		File f = new File("../metadata", addon);
		TreeMap<String, Value> ch = new TreeMap<>();
		ch.put("downloads", new Value("downloads", "" + (Long.valueOf(readProfile(f, addon).get("downloads").value) + 1)));
		editMetadata(addon, ch);
	}

	synchronized private static void registerVote(String addon, String user, String v) throws Exception {
		File f = new File("../metadata", addon);
		TreeMap<String, Value> metadata = readProfile(f, addon);
		TreeMap<String, Value> ch = new TreeMap<>();
		Value oldVote = metadata.get("vote_" + user);
		if (oldVote != null) {
			if (oldVote.value.equals("" + v)) return;
			ch.put("votes_" + oldVote.value, new Value("votes_" + oldVote.value, "" + (Long.valueOf(metadata.get("votes_" + oldVote.value).value) - 1)));
		}
		ch.put("vote_" + user, new Value("vote_" + user, "" + v));
		ch.put("votes_" + v, new Value("votes_" + v, "" + (Long.valueOf(metadata.get("votes_" + v).value) + 1)));
		editMetadata(addon, ch);
	}

	synchronized private static void comment(String addon, String user, String version, String message) throws Exception {
		File f = new File("../metadata", addon);
		TreeMap<String, Value> ch = new TreeMap<>();
		int c = Integer.valueOf(readProfile(f, addon).get("comments").value);
		ch.put("comments", new Value("comments", "" + (c + 1)));
		ch.put("comment_name_" + c, new Value("comment_name_" + c, user));
		ch.put("comment_version_" + c, new Value("comment_version_" + c, version));
		ch.put("comment_timestamp_" + c, new Value("comment_timestamp_" + c, "" + (System.currentTimeMillis() / 1000)));
		String[] msg = message.split("\n");
		ch.put("comment_" + c, new Value("comment_" + c, "" + (msg.length - 1)));
		for (int i = 0; i < msg.length; ++i) ch.put("comment_" + c + "_" + i, new Value("comment_" + c + "_" + i, msg[i]));
		editMetadata(addon, ch);
	}

	synchronized private static void editMetadata(String addon, TreeMap<String, Value> changes) throws Exception {
		File f = new File("../metadata", addon);
		TreeMap<String, Value> metadata = readProfile(f, addon);
		metadata.putAll(changes);
		PrintStream out = new PrintStream(f);
		for (String key : metadata.keySet()) {
			out.print(key);
			out.print("=");
			if (metadata.get(key).textdomain != null) out.print("_");
			out.print("\"");
			out.print(metadata.get(key).value);
			out.print("\"\n");
		}
		out.close();
	}

	private static long filesize(File dir) {
		long l = 0;
		for (File f : dir.listFiles()) {
			if (f.isDirectory()) l += filesize(f);
			else l += f.length();
		}
		return l;
	}

	synchronized public static String info(final int version, final String addon, final String locale) throws Exception {
		switch (version) {
			case 3: {
				TreeMap<String, Value> profile = readProfile(new File("../addons/" + addon, "addon"), addon);
				TreeMap<String, Value> metadata = readProfile(new File("../metadata", addon), null);
				String str = "";

				str += profile.get("name"       ).value         + "\n";
				str += profile.get("name"       ).value(locale) + "\n";
				str += profile.get("description").value         + "\n";
				str += profile.get("description").value(locale) + "\n";
				str += profile.get("author"     ).value         + "\n";
				str += profile.get("author"     ).value(locale) + "\n";
				str += metadata.get("uploader"  ).value(locale) + "\n";
				str += profile.get("version"    ).value(locale) + "\n";
				str += metadata.get("i18n"      ).value(locale) + "\n";
				str += profile.get("category"   ).value(locale) + "\n";
				str += profile.get("requires"   ).value(locale) + "\n";

				File f = new File("../screenshots/" + addon, "descriptions");
				if (f.isFile()) {
					List<String> in = Files.readAllLines(f.toPath());
					String s = ""; int i = 0;
					while (!in.isEmpty()) {
						++i;
						s += in.remove(0) + "\n";
						s += in.remove(0) + "\n";
					}
					str += i + "\n" + s;
				} else {
					str += "0\n";
				}

				str += filesize(new File("../addons", addon)) + "\n";
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
					for (int j = 0; j < l; ++j) str += metadata.get("comment_" + i + "_" + j).value(locale) + "\n";
				}

				str += metadata.get("security"  ).value(locale);
				return str;
			}
			default:
				System.out.println("ERROR: Invalid info version '" + version + "'");
				return "";
		}
	}
}
