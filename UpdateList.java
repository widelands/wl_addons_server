import java.io.*;
import java.nio.file.*;
import java.util.*;

public class UpdateList {
	public static class Data {
		public static class Comment {
			public final String username, message;
			public final String version;
			public final long timestamp;
			public Comment(String n, String m, String v, long t) {
				username = n;
				message = m;
				version = v;
				timestamp = t;
			}
		}

		public final String version, uploader;
		public final int i18n_version, votes;
		public final float rating;
		public final boolean verified;
		public final long timestamp, downloadCount;
		public final List<Comment> comments;
		public final int[] ratings;
		public Data(String v, String u, int i, boolean ver, long t, long dl, List<Comment> c, int[] rs) {
			comments = c;
			uploader = u;
			version = v;
			i18n_version = i;
			verified = ver;
			timestamp = t;
			downloadCount = dl;
			ratings = rs;

			int vot = 0; float sum = 0;
			for (int index = 0; index < ratings.length; ++index) {
				vot += ratings[index];
				sum += ratings[index] * (index + 1);
			}
			votes = vot;
			rating = votes > 0 ? sum / votes : 0;
		}
	}

	private static String _defaultUploader = null;
	private static Map<String, Data> detectAndUpdateMetadata(List<String> increase, List<String> verify) throws Exception {
		Map<String, Data> result = new HashMap<>();
		for (String addon : new File("addons").list()) {
			if (!addon.endsWith(".wad")) continue;
			File metadataFile = new File("metadata", addon);
			if (!metadataFile.isFile()) {
				while (_defaultUploader == null || _defaultUploader.isEmpty()) {
					System.out.println("New add-on detected. Please enter your nickname:");
					_defaultUploader = new BufferedReader(new InputStreamReader(System.in)).readLine();
				}
				Utils.initMetadata(addon, _defaultUploader);
			}
			TreeMap<String, Utils.Value> metadata = Utils.readProfile(metadataFile, addon);

			TreeMap<String, Utils.Value> edit = new TreeMap<>();
			if (verify.contains(addon)) edit.put("security", new Utils.Value("security", "verified"));
			if (increase.contains(addon)) {
				edit.put("i18n_version", new Utils.Value("i18n_version",
						"" + (Integer.valueOf(metadata.get("i18n_version").value) + 1)));
			}
			if (!edit.isEmpty()) {
				Utils.editMetadata(addon, edit);
				metadata = Utils.readProfile(metadataFile, addon);
			}

			int[] votes = new int[10];
			for (int i = 1; i <= votes.length; ++i) votes[i - 1] = Integer.valueOf(metadata.get("votes_" + i).value);
			List<Data.Comment> comments = new ArrayList<>();
			int c = Integer.valueOf(metadata.get("comments").value);
			for (int i = 0; i < c; ++i) {
				String msg = "";
				int l = Integer.valueOf(metadata.get("comment_" + i).value);
				// These lists don't allow newlines, so we use two spaces instead.
				// Localization is not possible here.
				for (int j = 0; j <= l; ++j) msg += metadata.get("comment_" + i + "_" + j).value + "  ";
				comments.add(new Data.Comment(
					metadata.get("comment_name_" + i).value,
					msg,
					metadata.get("comment_version_" + i).value,
					Long.valueOf(metadata.get("comment_timestamp_" + i).value)
				));
			}
			result.put(addon, new Data(
				metadata.get("version").value,
				metadata.get("uploader").value,
				Integer.valueOf(metadata.get("i18n_version").value),
				metadata.get("security").value.equals("verified"),
				Long.valueOf(metadata.get("timestamp").value),
				Long.valueOf(metadata.get("downloads").value),
				comments,
				votes));
		}
		return result;
	}

	public static String checksum(File f) {
		try {
			Runtime rt = Runtime.getRuntime();
			Process pr = rt.exec(new String[] {"md5sum", f.getPath()});
			BufferedReader reader = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			pr.waitFor();
			String md5 = reader.readLine();
			return md5.split(" ")[0];
		} catch (Exception e) {
			System.err.println("checksumming error: " + e);
		}
		return "";
	}

	private static void recurse(List<String> dirs, List<String> files, List<String> checksums, List<Long> size, File curdir, String prefix) {
		for (File f : Utils.listSorted(curdir)) {
			if (f.isFile()) {
				files.add(prefix + f.getName());
				size.add(f.length());
				checksums.add(checksum(f));
			} else if (f.listFiles().length > 0) {
				dirs.add(prefix + f.getName());
				recurse(dirs, files, checksums, size, f, prefix + f.getName() + "/");
			}
		}
	}

	private static void gatherLocales(File addon, List<String> locales, List<String> checksums) {
		for (File f : Utils.listSorted(new File(addon, "../../i18n/" + addon.getName()))) {
			if (f.getName().endsWith(".mo")) {
				locales.add(f.getName());
				checksums.add(checksum(f));
			}
		}
	}

	private static void gatherScreenshots(File addon, List<String> screenies) throws Exception {
		File dir = new File(addon, "../../screenshots/" + addon.getName());
		if (dir.isDirectory()) {
			List<String> in = Files.readAllLines(new File(addon, "../../screenshots/" + addon.getName() + "/descriptions").toPath());
			while (!in.isEmpty()) {
				String str = in.remove(0);
				screenies.add(str.split("=")[0]);
				screenies.add(str.split("\"")[1]);
			}
		}
	}

	private static final float[] kDefaultRatings = new float[] { 9.5f, 9.1f, 8.7f, 8.3f, 7.9f, 7.4f, 6.8f };  // dummy values

	private static void writeAddon(int listVersion, PrintWriter w, File addon, Data data) throws Exception {
		String descname = null, descr = null, author = null, category = null, new_version = null, minWLVersion = "", maxWLVersion = "", sync_safe = "desync";
		List<String> requires = new ArrayList<>(), dirs = new ArrayList<>(), files = new ArrayList<>(),
				locales = new ArrayList<>(), checksums = new ArrayList<>(), screenies = new ArrayList<>(); List<Long> sizes = new ArrayList<>();
		recurse(dirs, files, checksums, sizes, addon, "");
		gatherLocales(addon, locales, checksums);
		gatherScreenshots(addon, screenies);

		for (String line : Files.readAllLines(new File(addon, "addon").toPath())) {
			String[] str = line.split("=");
			if (str.length < 2) continue;
			String arg = str[1];
			for (int i = 2; i < str.length; ++i) arg += "=" + str[i];
			if (arg.startsWith("_")) arg = arg.substring(1);
			if (arg.startsWith("\"")) arg = arg.substring(1);
			if (arg.endsWith("\"")) arg = arg.substring(0, arg.length() - 1);
			switch (str[0]) {
				case "name": descname = arg; break;
				case "description": descr = arg; break;
				case "author": author = arg; break;
				case "category": category = arg; break;
				case "version": new_version = arg; break;
				case "min_wl_version": minWLVersion = arg; break;
				case "max_wl_version": maxWLVersion = arg; break;
				case "sync_safe": if (arg.equalsIgnoreCase("true")) sync_safe = "sync_safe"; break;
				case "requires":
					for (String req : arg.split(",")) requires.add(req);
					break;
				default: break;
			}
		}
		long totalSize = 0;
		for (Long l : sizes) totalSize += l;

		w.println(addon.getName());
		w.println(descname);
		w.println(descr);
		w.println(author);
		w.println(data.uploader);
		if (listVersion >= 3) {
			w.println(minWLVersion);
			w.println(maxWLVersion);
			w.println(sync_safe);
		}
		w.println(data.timestamp);
		w.println(data.downloadCount);
		if (listVersion < 2) {
			w.println(data.votes);
			w.println(data.rating);
		} else {
			for (int r : data.ratings) w.println(r);
		}
		w.println(data.comments.size());
		for (Data.Comment c : data.comments) {
			w.println(c.username);
			w.println(c.message);
			w.println(c.version);
			w.println(c.timestamp);
		}
		w.println(new_version);
		w.println(data.i18n_version);
		w.println(totalSize);
		w.println(category);
		w.println(requires.size()); for (String r : requires) w.println(r);
		w.println(dirs.size()); for (String r : dirs) w.println(r);
		w.println(files.size()); for (String r : files) w.println(r);
		w.println(locales.size()); for (String r : locales) w.println(r);
		w.println(checksums.size()); for (String r : checksums) w.println(r);

		if (listVersion >= 2) {
			w.println(screenies.size() / 2);
			for (String r : screenies) w.println(r);
		}

		// never verify immediately during an update
		w.println(data.verified && data.version.equals(new_version) ? "verified" : "unchecked");

		if (listVersion == 1 && !data.version.equals(new_version)) {
			TreeMap<String, Utils.Value> edit = new TreeMap<>();
			edit.put("version", new Utils.Value("version", new_version));
			edit.put("security", new Utils.Value("security", "unchecked"));
			Utils.editMetadata(addon.getName(), edit);
		}
	}

	public static void main(String ... args) throws Exception {
		List<String> increase_i18n = new ArrayList<>();
		List<String> verify = new ArrayList<>();
		for (String s : args) {
			if (s.startsWith("+")) {
				increase_i18n.add(s.substring(1));
			} else if (s.startsWith("/")) {
				verify.add(s.substring(1));
			} else {
				System.out.println("USAGE: java UpdateList {[+|/]NAME.wad}");
				System.out.println("Rebuilds the add-ons list.");
				System.out.println("Prefix a filenames with ‘+’ to increase the i18n version by 1.");
				System.out.println("Prefix a filename with ‘/’ to mark the add-on as verified.");
				return;
			}
		}
		System.out.println("Parsing lists");
		final Map<String, Data> data = detectAndUpdateMetadata(increase_i18n, verify);
		for (int listVersion = 1; listVersion <= 3; ++listVersion) {
			PrintWriter write = new PrintWriter(new File(listVersion == 1 ? "list" : ("list_" + listVersion)));
			File[] files = Utils.listSorted(new File("addons"));
			write.println(listVersion);
			write.println(files.length);
			for (File file : files) {
				System.out.println("Writing add-on " + file.getName() + " for version " + listVersion);
				writeAddon(listVersion, write, file, data.get(file.getName()));
			}
			write.close();
		}
	}
}
