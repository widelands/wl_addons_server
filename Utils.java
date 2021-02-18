import java.io.*;
import java.nio.file.*;
import java.util.*;

public class Utils {
	public static final TreeMap<File, TreeMap<String, Value>> _staticprofiles = new TreeMap<>();

	public static File[] listSorted(File dir) {
		File[] files = dir.listFiles();
		if (files == null) return new File[0];
		Arrays.sort(files);
		return files;
	}

	public static class Value {
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

	synchronized public static TreeMap<String, Value> readProfile(File f, String textdomain) throws Exception {
		if (_staticprofiles.containsKey(f)) return _staticprofiles.get(f);

		TreeMap<String, Value> profile = new TreeMap<>();
		if (!f.isFile()) return profile;
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

	synchronized public static void editMetadata(String addon, TreeMap<String, Value> changes) throws Exception {
		File f = new File("metadata", addon);
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

	synchronized public static void initMetadata(String addon, String uploader) throws Exception {
		PrintWriter w = new PrintWriter(new File("metadata", addon));
		w.println("timestamp=\"" + (System.currentTimeMillis() / 1000) + "\"");
		w.println("downloads=\"0\"");
		w.println("comments=\"0\"");
		w.println("security=\"unchecked\"");
		w.println("uploader=\"" + uploader + "\"");
		w.println("i18n_version=\"1\"");
		w.println("version=\"\"");
		for (int i = 1; i <= 10; ++i) w.println("votes_" + i + "=\"0\"");
		w.close();
	}

	synchronized public static void registerDownload(String addon) throws Exception {
		File f = new File("metadata", addon);
		TreeMap<String, Value> ch = new TreeMap<>();
		ch.put("downloads", new Value("downloads", "" + (Long.valueOf(readProfile(f, addon).get("downloads").value) + 1)));
		editMetadata(addon, ch);
	}

	synchronized public static void registerVote(String addon, String user, String v) throws Exception {
		File f = new File("metadata", addon);
		TreeMap<String, Value> metadata = readProfile(f, addon);
		TreeMap<String, Value> ch = new TreeMap<>();
		Value oldVote = metadata.get("vote_" + user);
		if (oldVote != null && !oldVote.value.equals("0")) {
			if (oldVote.value.equals("" + v)) return;
			ch.put("votes_" + oldVote.value, new Value("votes_" + oldVote.value, "" + (Long.valueOf(metadata.get("votes_" + oldVote.value).value) - 1)));
		}
		ch.put("vote_" + user, new Value("vote_" + user, "" + v));
		if (!v.equals("0")) ch.put("votes_" + v, new Value("votes_" + v, "" + (Long.valueOf(metadata.get("votes_" + v).value) + 1)));
		editMetadata(addon, ch);
	}

	synchronized public static void comment(String addon, String user, String version, String message) throws Exception {
		File f = new File("metadata", addon);
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

	public static long filesize(File dir) {
		long l = 0;
		for (File f : listSorted(dir)) {
			if (f.isDirectory()) l += filesize(f);
			else l += f.length();
		}
		return l;
	}
}
