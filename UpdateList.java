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

		public String descname, descr, author, category, new_version, minWLVersion, maxWLVersion, syncSafe;
		public final List<String> requires, dirs, files, locales, checksums, screenies;
		public final List<Long> sizes;
		public long totalSize;

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

			requires = new ArrayList<>();
			dirs = new ArrayList<>();
			files = new ArrayList<>();
			locales = new ArrayList<>();
			checksums = new ArrayList<>();
			screenies = new ArrayList<>();
			sizes = new ArrayList<>();
			descname = null;
			descr = null;
			author = null;
			category = null;
			new_version = null;
			minWLVersion = "";
			maxWLVersion = "";
			syncSafe = "desync";
			totalSize = 0;
		}
	}

	private static String _defaultUploader = null;
	private static Map<String, Data> detectAndUpdateMetadata(List<String> increase, List<String> verify) throws Exception {
		Map<String, Data> result = new HashMap<>();
		File[] allAddons  = Utils.listSorted(new File("addons"));
		final int total   = allAddons.length;
		final int digits = Integer.toString(total).length();
		int progress = 0;
		for (File addonDir : allAddons) {
			progress++;
			final String addon = addonDir.getName();
			if (!addon.endsWith(".wad") || !addonDir.isDirectory()) {
				System.out.println(String.format("[%" + digits + "d/%" + digits + "d] SKIPPING %s ", progress, total, addon));
				continue;
			}
			System.out.print(String.format("[%" + digits + "d/%" + digits + "d] Gathering data for add-on %s ", progress, total, addon));

			File metadataFileMaintain = new File("metadata", addon + ".maintain");
			File metadataFileServer = new File("metadata", addon + ".server");
			if (!metadataFileMaintain.isFile()) {
				while (_defaultUploader == null || _defaultUploader.isEmpty()) {
					System.out.println("\nNew add-on '" + addon + "' detected. Please enter your nickname:");
					_defaultUploader = new BufferedReader(new InputStreamReader(System.in)).readLine();
				}
				Utils.initMetadata(addon, _defaultUploader);
			}
			TreeMap<String, Utils.Value> metadataMaintain = Utils.readProfile(metadataFileMaintain, addon);
			TreeMap<String, Utils.Value> metadataServer = metadataFileServer.isFile() ? Utils.readProfile(metadataFileServer, addon) : null;

			TreeMap<String, Utils.Value> edit = new TreeMap<>();
			if (verify.contains(addon)) edit.put("security", new Utils.Value("security", "verified"));
			if (increase.contains(addon)) {
				edit.put("i18n_version", new Utils.Value("i18n_version",
						"" + (Integer.valueOf(metadataMaintain.get("i18n_version").value) + 1)));
			}
			if (!edit.isEmpty()) {
				Utils.editMetadata(false, addon, edit);
				metadataMaintain = Utils.readProfile(metadataFileMaintain, addon);
			}

			int[] votes = new int[10];
			for (int i = 1; i <= votes.length; ++i) votes[i - 1] = Integer.valueOf(metadataServer.get("votes_" + i).value);
			List<Data.Comment> comments = new ArrayList<>();
			int c = Integer.valueOf(metadataServer.get("comments").value);
			for (int i = 0; i < c; ++i) {
				String msg = "";
				int l = Integer.valueOf(metadataServer.get("comment_" + i).value);
				// These lists don't allow newlines, so we use two spaces instead.
				// Localization is not possible here.
				for (int j = 0; j <= l; ++j) msg += metadataServer.get("comment_" + i + "_" + j).value + "  ";
				comments.add(new Data.Comment(
					metadataServer.get("comment_name_" + i).value,
					msg,
					metadataServer.get("comment_version_" + i).value,
					Long.valueOf(metadataServer.get("comment_timestamp_" + i).value)
				));
			}

			Data d = new Data(
				metadataMaintain.get("version").value,
				metadataMaintain.get("uploader").value,
				Integer.valueOf(metadataMaintain.get("i18n_version").value),
				metadataMaintain.get("security").value.equals("verified"),
				Long.valueOf(metadataMaintain.get("timestamp").value),
				Long.valueOf(metadataServer.get("downloads").value),
				comments,
				votes);
			result.put(addon, d);

			recurse(d.dirs, d.files, d.checksums, d.sizes, addonDir, "");
			gatherLocales(addonDir, d.locales, d.checksums);
			gatherScreenshots(addonDir, d.screenies);

			for (String line : Files.readAllLines(new File(addonDir, "addon").toPath())) {
				String[] str = line.split("=");
				if (str.length < 2) continue;
				String arg = str[1];
				for (int i = 2; i < str.length; ++i) arg += "=" + str[i];
				if (arg.startsWith("_")) arg = arg.substring(1);
				if (arg.startsWith("\"")) arg = arg.substring(1);
				if (arg.endsWith("\"")) arg = arg.substring(0, arg.length() - 1);
				switch (str[0]) {
					case "name"          : d.descname     = arg; break;
					case "description"   : d.descr        = arg; break;
					case "author"        : d.author       = arg; break;
					case "category"      : d.category     = arg; break;
					case "version"       : d.new_version  = arg; break;
					case "min_wl_version": d.minWLVersion = arg; break;
					case "max_wl_version": d.maxWLVersion = arg; break;
					case "sync_safe":
						if (arg.equalsIgnoreCase("true")) d.syncSafe = "sync_safe";
						break;
					case "requires":
						for (String req : arg.split(",")) d.requires.add(req);
						break;
					default: break;
				}
			}
			for (Long l : d.sizes) d.totalSize += l;
			System.out.println(" done");
		}
		return result;
	}

	private static String checksum(File f) {
		try {
			Runtime rt = Runtime.getRuntime();
			Process pr = rt.exec(new String[] {"md5sum", f.getPath()});
			BufferedReader reader = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			pr.waitFor();
			String md5 = reader.readLine();
			return md5.split(" ")[0];
		} catch (Exception e) {
			System.err.println("checksumming error: " + e);
			System.exit(1);
		}
		return "";
	}

	private static void recurse(List<String> dirs, List<String> files, List<String> checksums, List<Long> size, File curdir, String prefix) {
		System.out.print('.');
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

	private static void writeAddon(int listVersion, PrintWriter w, File addon, Data data) throws Exception {
		w.println(addon.getName());
		w.println(data.descname);
		w.println(data.descr);
		w.println(data.author);
		w.println(data.uploader);
		if (listVersion >= 3) {
			w.println(data.minWLVersion);
			w.println(data.maxWLVersion);
			w.println(data.syncSafe);
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
		w.println(data.new_version);
		w.println(data.i18n_version);
		w.println(data.totalSize);
		w.println(data.category);
		w.println(data.requires.size ()); for (String r : data.requires ) w.println(r);
		w.println(data.dirs.size     ()); for (String r : data.dirs     ) w.println(r);
		w.println(data.files.size    ()); for (String r : data.files    ) w.println(r);
		w.println(data.locales.size  ()); for (String r : data.locales  ) w.println(r);
		w.println(data.checksums.size()); for (String r : data.checksums) w.println(r);

		if (listVersion >= 2) {
			w.println(data.screenies.size() / 2);
			for (String r : data.screenies) w.println(r);
		}

		// never verify immediately during an update
		w.println(data.verified && data.version.equals(data.new_version) ? "verified" : "unchecked");

		if (listVersion == 1 && !data.version.equals(data.new_version)) {
			TreeMap<String, Utils.Value> edit = new TreeMap<>();
			edit.put("version", new Utils.Value("version", data.new_version));
			edit.put("security", new Utils.Value("security", "unchecked"));
			Utils.editMetadata(false, addon.getName(), edit);
		}
	}

	private static final int kHighestListVersion = 3;
	public static void main(String[] args) throws Exception {
		List<String> increase_i18n = new ArrayList<>();
		List<String> verify = new ArrayList<>();
		for (String s : args) {
			if (s.isEmpty()) continue;
			String name = s.substring(1);
			if (!new File("addons", name).isDirectory()) {
				System.out.println("ERROR: Add-on '" + name + "' does not exist");
				System.exit(2);
			}
			if (s.startsWith("+")) {
				increase_i18n.add(name);
			} else if (s.startsWith("/")) {
				verify.add(name);
			} else {
				System.out.println("USAGE: java UpdateList {[+|/]NAME.wad}");
				System.out.println("Rebuilds the add-ons list.");
				System.out.println("Prefix a filenames with ‘+’ to increase the i18n version by 1.");
				System.out.println("Prefix a filename with ‘/’ to mark the add-on as verified.");
				System.exit(1);
				return;
			}
		}
		final Map<String, Data> data = detectAndUpdateMetadata(increase_i18n, verify);
		File[] files = Utils.listSorted(new File("addons"));
		for (int listVersion = 1; listVersion <= kHighestListVersion; ++listVersion) {
			System.out.print("Writing list version " + listVersion + " ");
			PrintWriter write = new PrintWriter(new File(listVersion == 1 ? "list" : ("list_" + listVersion)));
			write.println(listVersion);
			write.println(files.length);
			for (File file : files) {
				System.out.print('.');
				writeAddon(listVersion, write, file, data.get(file.getName()));
			}
			write.close();
			System.out.println(" done");
		}
	}
}
