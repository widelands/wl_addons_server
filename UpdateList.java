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
		public final boolean verified;
		public final long timestamp, downloadCount;
		public final float rating;
		public final List<Comment> comments;
		public Data(String v, String u, int i, boolean ver, long t, long dl, int vot, float r, List<Comment> c) {
			comments = c;
			uploader = u;
			version = v;
			i18n_version = i;
			verified = ver;
			timestamp = t;
			votes = vot;
			downloadCount = dl;
			rating = votes > 0 ? r : 0;
		}
	}
	
	private static Map<String, Data> detectLocaleVersions(List<String> increase, List<String> verify) throws Exception {
		List<String> lines = Files.readAllLines(new File("list").toPath());
		Map<String, Data> result = new HashMap<>();
		lines.remove(0);
		final int size = Integer.valueOf(lines.remove(0));
		for (int i = 0; i < size; ++i) {
			final String addon = lines.remove(0);
			lines.remove(0); lines.remove(0); lines.remove(0);
			final String uploader = lines.remove(0);
			final long timestamp = Long.valueOf(lines.remove(0));
			final long downloadCount = Long.valueOf(lines.remove(0));
			final int votes = Integer.valueOf(lines.remove(0));
			final float rating = Float.valueOf(lines.remove(0));
			List<Data.Comment> comments = new ArrayList<>();
			for (int j = Integer.valueOf(lines.remove(0)); j > 0; --j) {
				String n = lines.remove(0);
				String m = lines.remove(0);
				String v = lines.remove(0);
				long t = Long.valueOf(lines.remove(0));
				comments.add(new Data.Comment(n, m, v, t));
			}
			final String version = lines.remove(0);
			final int i18n_version = Integer.valueOf(lines.remove(0));
			lines.remove(0); lines.remove(0);
			for (int j = Integer.valueOf(lines.remove(0)); j > 0; --j) lines.remove(0);
			for (int j = Integer.valueOf(lines.remove(0)); j > 0; --j) lines.remove(0);
			for (int j = Integer.valueOf(lines.remove(0)); j > 0; --j) lines.remove(0);
			for (int j = Integer.valueOf(lines.remove(0)); j > 0; --j) lines.remove(0);
			for (int j = Integer.valueOf(lines.remove(0)); j > 0; --j) lines.remove(0);
			result.put(addon, new Data(version, uploader, i18n_version + (increase.contains(addon) ? 1 : 0),
					lines.remove(0).equals("verified") || verify.contains(addon), timestamp, downloadCount, votes, rating, comments));
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
		for (File f : curdir.listFiles()) {
			if (f.isFile()) {
				files.add(prefix + f.getName());
				size.add(f.length());
				checksums.add(checksum(f));
			} else {
				dirs.add(prefix + f.getName());
				recurse(dirs, files, checksums, size, f, prefix + f.getName() + "/");
			}
		}
	}
	private static void gatherLocales(File addon, List<String> locales, List<String> checksums) {
		for (File f : new File(addon, "../../i18n/" + addon.getName()).listFiles()) {
			locales.add(f.getName());
			checksums.add(checksum(f));
		}
	}
	
	private static final float[] kDefaultRatings = new float[] { 9.5f, 9.1f, 8.7f, 8.3f, 7.9f, 7.4f, 6.8f };  // dummy values
	
	private static void writeAddon(PrintWriter w, File addon, Data data) throws Exception {
		if (data == null) data = new Data("0", "Nordfriese", 1, false, System.currentTimeMillis() / 1000,
				// some dummy values for initialization of not-yet-implemented data
				12345, (int)(10 * Math.random()), kDefaultRatings[(int)(kDefaultRatings.length * Math.random())], new ArrayList<>());
		
		String descname = null, descr = null, author = null, category = null, new_version = null;
		List<String> requires = new ArrayList<>(), dirs = new ArrayList<>(), files = new ArrayList<>(),
				locales = new ArrayList<>(), checksums = new ArrayList<>(); List<Long> sizes = new ArrayList<>();
		recurse(dirs, files, checksums, sizes, addon, "");
		gatherLocales(addon, locales, checksums);
		
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
		w.println(data.timestamp);
		w.println(data.downloadCount);
		w.println(data.votes);
		w.println(data.rating);
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
		// never verify immediately during an update
		w.println(data.verified && data.version.equals(new_version) ? "verified" : "unchecked");
	}
	
	public static void main(String[] args) throws Exception {
		List<String> increase_i18n = new ArrayList<>();
		List<String> verify = new ArrayList<>();
		for (String s : args) {
			if (s.startsWith("+")) {
				increase_i18n.add(s.substring(1));
			} else if (s.startsWith("!")) {
				verify.add(s.substring(1));
			} else {
				System.out.println("USAGE: java UpdateList {[+|!]NAME.wad}");
				System.out.println("Rebuilds the add-ons list.");
				System.out.println("Prefix a filenames with ‘+’ to increase the i18n version by 1.");
				System.out.println("Prefix a filename with ‘!’ to mark the add-on as verified.");
				return;
			}
		}
		final Map<String, Data> data = detectLocaleVersions(increase_i18n, verify);

		PrintWriter write = new PrintWriter(new File("list"));
		File[] files = new File("addons").listFiles();
		write.println("1");  // list format version
		write.println(files.length);
		for (File file : files) {
			writeAddon(write, file, data.get(file.getName()));
		}
		write.close();
	}
}
