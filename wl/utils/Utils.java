package wl.utils;

import java.io.*;
import java.nio.file.*;
import java.util.*;

public abstract class Utils {
	public static final TreeMap<File, TreeMap<String, Value>> _staticprofiles = new TreeMap<>();

	public static File[] listSorted(File dir) {
		File[] files = dir.listFiles();
		if (files == null) return new File[0];
		Arrays.sort(files);
		return files;
	}

	synchronized public static File createTempDir() {
		File d;
		do {
			d = new File("temp", "temp_" + System.currentTimeMillis());
		} while (d.exists());
		d.mkdirs();
		return d;
	}

	public static int bash(String... args) throws Exception {
		System.out.print("    $");
		for (String a : args) System.out.print(" " + a);
		System.out.println();

		Process p = Runtime.getRuntime().exec(args);
		p.waitFor();
		BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
		String str;
		while ((str = b.readLine()) != null) {
			System.out.println("    # " + str);
		}

		int e = p.exitValue();
		System.out.println("    = " + e);
		return e;
	}

	public static String durationString(long millis) {
		long hours = millis / (1000 * 60 * 60);
		millis -= hours * 1000 * 60 * 60;
		long minutes = millis / (1000 * 60);
		millis -= minutes * 1000 * 60;
		long seconds = millis / 1000;
		millis -= seconds * 1000;
		String str = millis + "ms";
		if (seconds == 0) return str;
		str = seconds + "s " + str;
		if (minutes == 0) return str;
		str = minutes + "min " + str;
		if (hours == 0) return str;
		return hours + "h " + str;
	}

	public static class Value {
		public final String key, value, textdomain;
		public String value(String locale) {
			if (textdomain == null || textdomain.isEmpty()) return value;
			try {
				return new BufferedReader(
				           new InputStreamReader(
				               Runtime.getRuntime()
				                   .exec(new String[] {
				                       "bash", "-c",
				                       "TEXTDOMAINDIR=./i18n/ TEXTDOMAIN=" + textdomain +
				                           " LANGUAGE=" + locale + " gettext -s \"" +
				                           value.replaceAll("\"", "\\\"") + "\""})
				                   .getInputStream()))
				    .readLine();
			} catch (Exception e) {
				System.out.println("[" + Thread.currentThread().getName() +
				                   "] WARNING: gettext error for '" + key + "'='" + value +
				                   "' @ '" + textdomain + "' / '" + locale + "': " + e);
				return value;
			}
		}
		public Value(String k, String v) { this(k, v, null); }
		public Value(String k, String v, String t) {
			key = k;
			value = v;
			textdomain = t;
		}
	}

	synchronized public static TreeMap<String, Value> readProfile(File f, String textdomain)
	    throws Exception {
		if (_staticprofiles.containsKey(f)) return _staticprofiles.get(f);

		TreeMap<String, Value> profile = new TreeMap<>();
		if (!f.isFile()) {
			_staticprofiles.put(f, profile);
			return profile;
		}

		for (String line : Files.readAllLines(f.toPath())) {
			line = line.trim();
			if (line.startsWith("#")) continue;
			String[] str = line.split("=");
			for (int i = 0; i < str.length; i++) str[i] = str[i].trim();

			if (str.length < 2) {
				if (str.length == 1) profile.put(str[0], new Value(str[0], ""));
				continue;
			}

			String arg = str[1];
			for (int i = 2; i < str.length; ++i) arg += "=" + str[i];
			boolean localize = false;
			if (arg.startsWith("_")) {
				arg = arg.substring(1).trim();
				localize = true;
			}
			if (arg.startsWith("\"")) {
				arg = arg.substring(1);
				if (arg.endsWith("\"")) arg = arg.substring(0, arg.length() - 1);
			}
			profile.put(str[0], new Value(str[0], arg,
			                              localize ? textdomain == null ? "" : textdomain : null));
		}

		_staticprofiles.put(f, profile);
		return profile;
	}

	synchronized public static void
	editProfile(File f, String textdomain, TreeMap<String, Value> changes) throws Exception {
		TreeMap<String, Value> profile = readProfile(f, textdomain);
		profile.putAll(changes);
		f.getParentFile().mkdirs();
		PrintStream out = new PrintStream(f);
		for (String key : profile.keySet()) {
			out.print(key);
			out.print("=");
			if (profile.get(key).textdomain != null) out.print("_");
			out.print("\"");
			out.print(profile.get(key).value);
			out.print("\"\n");
		}
		out.close();
	}

	synchronized public static void
	editMetadata(boolean server, String addon, TreeMap<String, Value> changes) throws Exception {
		editProfile(
		    new File("metadata", addon + (server ? ".server" : ".maintain")), addon, changes);
	}

	synchronized public static void initMetadata(String addon, String uploader) throws Exception {
		PrintWriter w = new PrintWriter(new File("metadata", addon + ".maintain"));
		w.println("timestamp=\"" + (System.currentTimeMillis() / 1000) + "\"");
		w.println("security=\"unchecked\"");
		w.println("uploader=\"" + uploader + "\"");
		w.println("i18n_version=\"1\"");
		w.println("version=\"\"");
		w.close();

		w = new PrintWriter(new File("metadata", addon + ".server"));
		w.println("downloads=\"0\"");
		w.println("comments=\"0\"");
		for (int i = 1; i <= 10; ++i) w.println("votes_" + i + "=\"0\"");
		w.close();
	}

	public static void registerDownload(String addon) throws Exception {
		File f = new File("metadata", addon + ".server");
		TreeMap<String, Value> ch = new TreeMap<>();
		ch.put("downloads",
		       new Value("downloads",
		                 "" + (Long.valueOf(readProfile(f, addon).get("downloads").value) + 1)));
		editMetadata(true, addon, ch);
	}

	public static void registerVote(String addon, String user, String v) throws Exception {
		File votesFile = new File(config("uservotesdir"));
		votesFile.mkdir();
		votesFile = new File(votesFile, addon);
		if (!votesFile.isFile()) votesFile.createNewFile();

		TreeMap<String, Value> edit = new TreeMap<>();
		edit.put(user, new Value(user, v));
		editProfile(votesFile, addon, edit);
		TreeMap<String, Value> uservotes = readProfile(votesFile, addon);

		edit.clear();
		for (int i = 1; i <= 10; i++) edit.put("votes_" + i, new Value("votes_" + i, "0"));
		for (String key : uservotes.keySet()) {
			String vote = "votes_" + uservotes.get(key).value;
			if (edit.containsKey(vote))
				edit.put(vote, new Value(vote, "" + (Long.valueOf(edit.get(vote).value) + 1)));
		}
		editMetadata(true, addon, edit);
	}

	public static void comment(String addon, String user, String version, String message)
	    throws Exception {
		File f = new File("metadata", addon + ".server");
		TreeMap<String, Value> ch = new TreeMap<>();

		int c = Integer.valueOf(readProfile(f, addon).get("comments").value);
		ch.put("comments", new Value("comments", "" + (c + 1)));

		ch.put("comment_name_" + c, new Value("comment_name_" + c, user));
		ch.put("comment_version_" + c, new Value("comment_version_" + c, version));
		ch.put("comment_timestamp_" + c,
		       new Value("comment_timestamp_" + c, "" + (System.currentTimeMillis() / 1000)));
		String[] msg = message.split("\n");
		ch.put("comment_" + c, new Value("comment_" + c, "" + (msg.length - 1)));
		for (int i = 0; i < msg.length; ++i)
			ch.put("comment_" + c + "_" + i, new Value("comment_" + c + "_" + i, msg[i]));

		editMetadata(true, addon, ch);
	}

	public static void editComment(String addon, String index, String user, String message)
	    throws Exception {
		File f = new File("metadata", addon + ".server");
		TreeMap<String, Value> ch = new TreeMap<>();

		ch.put("comment_editor_" + index, new Value("comment_editor_" + index, user));
		ch.put(
		    "comment_edit_timestamp_" + index,
		    new Value("comment_edit_timestamp_" + index, "" + (System.currentTimeMillis() / 1000)));
		String[] msg = message.split("\n");
		ch.put("comment_" + index, new Value("comment_" + index, "" + (msg.length - 1)));
		for (int i = 0; i < msg.length; ++i)
			ch.put("comment_" + index + "_" + i, new Value("comment_" + index + "_" + i, msg[i]));

		editMetadata(true, addon, ch);
	}

	public static String config(String key) throws Exception {
		return readProfile(new File("config"), null).get(key).value;
	}

	public static long filesize(File dir) {
		long l = 0;
		for (File f : listSorted(dir)) {
			if (f.isDirectory())
				l += filesize(f);
			else
				l += f.length();
		}
		return l;
	}

	public static void fatalError(String str, Exception x) {
		System.out.println("#########################################################");
		System.out.println(" VERY FATAL ERROR: " + str);
		System.out.println("  " + x);
		System.out.println(" Something has gone seriously wrong here.");
		System.out.println(" Killing the server in the hope that the maintainers");
		System.out.println(" will hurry to resolve the problems.");
		System.out.println("#########################################################");
		System.exit(1);
	}

	public static void sendNotificationToGitHubThread(String msg) throws Exception {
		msg = msg.replaceAll("\n", "\\\\n");
		msg = msg.replaceAll("\t", "\\\\t");
		msg = msg.replaceAll("\\$", "§");
		msg = msg.replaceAll("\"", "❞");
		msg = msg.replaceAll("'", "❜");

		if (!Boolean.parseBoolean(config("deploy"))) {
			System.out.println("    SKIPPING message: " + msg);
			return;
		}

		System.out.println("    Sending message: " + msg);

		Process p = Runtime.getRuntime().exec(new String[] {
		    "bash", "-c",
		    "curl -X POST -H \"Accept: application/vnd.github.v3+json\" -u " +
		        config("githubusername") + ":" + config("githubtoken") +
		        " https://api.github.com/repos/widelands/wl_addons_server/issues/31/comments "
		        + "-d '{\"body\":\"" + msg + "\"}'"});
		p.waitFor();
		BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
		boolean err = false;
		String str;
		while ((str = b.readLine()) != null) {
			System.out.println("    # " + str);
			err |= str.contains("documentation_url");
		}
		System.out.println("    = " + p.exitValue());
		if (err) throw new Exception("CURL output looks like failure");
		if (p.exitValue() != 0) throw new Exception("CURL returned error code " + p.exitValue());
	}

	private static enum MergeResolverStatus { kUnchanged, kHead, kSource }
	public static void resolveMergeConflicts(File f) throws Exception {
		if (_staticprofiles.containsKey(f)) _staticprofiles.remove(f);

		TreeMap<String, Value> unchanged = new TreeMap<>();
		TreeMap<String, Value> head = new TreeMap<>();
		TreeMap<String, Value> source = new TreeMap<>();
		MergeResolverStatus status = MergeResolverStatus.kUnchanged;

		for (String line : Files.readAllLines(f.toPath())) {
			if (line.trim().startsWith("#")) continue;
			if (line.startsWith("<<<<<<<")) {
				status = MergeResolverStatus.kHead;
				continue;
			}
			if (line.startsWith(">>>>>>>")) {
				status = MergeResolverStatus.kUnchanged;
				continue;
			}
			if (line.startsWith("=======")) {
				status = MergeResolverStatus.kSource;
				continue;
			}

			TreeMap<String, Value> profile = null;
			switch (status) {
				case kUnchanged:
					profile = unchanged;
					break;
				case kSource:
					profile = source;
					break;
				case kHead:
					profile = head;
					break;
			}

			String[] str = line.split("=");
			if (str.length < 2) {
				if (str.length == 1) profile.put(str[0], new Value(str[0], ""));
				continue;
			}
			String arg = str[1];
			for (int i = 2; i < str.length; ++i) arg += "=" + str[i];
			boolean localize = false;
			if (arg.startsWith("_")) {
				arg = arg.substring(1);
				localize = true;
			}
			if (arg.startsWith("\"")) arg = arg.substring(1);
			if (arg.endsWith("\"")) arg = arg.substring(0, arg.length() - 1);
			profile.put(str[0], new Value(str[0], arg, localize ? "" : null));
		}

		for (String key : head.keySet()) {
			if (source.containsKey(key)) {
				String vh = head.get(key).value;
				String vs = source.get(key).value;
				String result = null;
				switch (key) {
					case "security":
						result =
						    (vh.equals("verified") && vs.equals("verified")) ? vh : "unchecked";
						break;
					case "i18n_version":
						result = vs;
						break;
					case "version":
					case "downloads":
					case "timestamp":
					case "uploader":
						result = vh;
						break;
					default:
						if (key.startsWith("vote") || key.startsWith("comment")) {
							result = vh;
							break;
						}
						throw new Exception("Unable to merge key '" + key + "' in file " +
						                    f.getPath());
				}
				unchanged.put(key, new Value(key, result, head.get(key).textdomain));
			} else {
				unchanged.put(key, head.get(key));
			}
		}
		for (String key : source.keySet()) {
			if (!head.containsKey(key)) {
				unchanged.put(key, source.get(key));
			}
		}

		PrintStream out = new PrintStream(f);
		for (String key : unchanged.keySet()) {
			out.print(key);
			out.print("=");
			if (unchanged.get(key).textdomain != null) out.print("_");
			out.print("\"");
			out.print(unchanged.get(key).value);
			out.print("\"\n");
		}
		out.close();
	}
}
