import java.io.*;
import java.nio.file.*;
import java.util.*;

public class UpdateList {
	public static class Data {
		public final int version;
		public final int i18n_version;
		public final boolean verified;
		public Data(int v, int i, boolean ver) {
			version = v;
			i18n_version = i;
			verified = ver;
		}
	}
	
	private static Map<String, Data> detectLocaleVersions(List<String> increase, List<String> verify) throws Exception {
		List<String> lines = Files.readAllLines(new File("list").toPath());
		Map<String, Data> result = new HashMap<>();
		lines.remove(0);  // consume version
		final int size = Integer.valueOf(lines.remove(0));
		for (int i = 0; i < size; ++i) {
			final String addon = lines.remove(0);
			lines.remove(0); lines.remove(0); lines.remove(0); lines.remove(0);
			final int version = Integer.valueOf(lines.remove(0));
			final int i18n_version = Integer.valueOf(lines.remove(0));
			lines.remove(0);
			for (int j = Integer.valueOf(lines.remove(0)); j > 0; --j) lines.remove(0);
			for (int j = Integer.valueOf(lines.remove(0)); j > 0; --j) lines.remove(0);
			for (int j = Integer.valueOf(lines.remove(0)); j > 0; --j) lines.remove(0);
			result.put(addon, new Data(version, i18n_version + (increase.contains(addon) ? 1 : 0), lines.remove(0).equals("verified") || verify.contains(addon)));
		}
		return result;
	}
	
	private static void recurse(List<String> dirs, List<String> files, File curdir, String prefix) {
		for (File f : curdir.listFiles()) {
			if (f.isFile()) {
				files.add(prefix + f.getName());
			} else {
				dirs.add(prefix + f.getName());
				recurse(dirs, files, f, prefix + f.getName() + "/");
			}
		}
	}
	
	private static void writeAddon(PrintWriter w, File addon, Data data) throws Exception {
		if (data == null) data = new Data(0, 1, false);
		
		String descname = null, descr = null, author = null, category = null;
		Integer new_version = null;
		List<String> requires = new ArrayList<>(), dirs = new ArrayList<>(), files = new ArrayList<>();
		recurse(dirs, files, addon, "");
		
		for (String line : Files.readAllLines(new File(addon, "addon").toPath())) {
			String[] str = line.split("=");
			if (str.length < 2) continue;
			String arg = str[1];
			for (int i = 2; i < str.length; ++i) arg += "=" + str[i];
			if (arg.startsWith("\"")) arg = arg.substring(1);
			if (arg.endsWith("\"")) arg = arg.substring(0, arg.length() - 1);
			switch (str[0]) {
				case "name": descname = arg; break;
				case "description": descr = arg; break;
				case "author": author = arg; break;
				case "category": category = arg; break;
				case "version": new_version = Integer.valueOf(arg); break;
				case "requires":
					for (String req : arg.split(",")) requires.add(req);
					break;
				default: break;
			}
		}
		
		w.println(addon.getName());
		w.println(descname);
		w.println(descr);
		w.println(author);
		w.println("Nordfriese");  // uploader
		w.println(new_version);
		w.println(data.i18n_version);
		w.println(category);
		w.println(requires.size()); for (String r : requires) w.println(r);
		w.println(dirs.size()); for (String r : dirs) w.println(r);
		w.println(files.size()); for (String r : files) w.println(r);
		// never verify immediately during an update
		w.println(data.verified && data.version == new_version ? "verified" : "unchecked");
	}
	
	public static void main(String[] args) throws Exception {
		List<String> increase_i18n = new ArrayList<>();
		List<String> verify = new ArrayList<>();
		for (String s : args) {
			if (s.startsWith("+")) {
				increase_i18n.add(s.substring(1));
			} else if (s.startsWith("§")) {
				verify.add(s.substring(1));
			} else {
				System.out.println("USAGE: java UpdateList {[+|§]NAME.wad}");
				System.out.println("Rebuilds the add-ons list.");
				System.out.println("Prefix a filenames with ‘+’ to increase the i18n version by 1.");
				System.out.println("Prefix a filename with ‘§’ to mark the add-on as verified.");
				return;
			}
		}
		final Map<String, Data> data = detectLocaleVersions(increase_i18n, verify);

		PrintWriter write = new PrintWriter(new File("list"));
		File[] files = new File("addons").listFiles();
		write.println("1");  // version
		write.println(files.length);
		for (File file : files) {
			writeAddon(write, file, data.get(file.getName()));
		}
		write.close();
	}
}
