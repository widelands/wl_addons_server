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

package wl.utils;

import java.io.*;
import java.nio.file.*;
import java.sql.ResultSet;
import java.util.*;

/**
 * Class to update the legacy list* files.
 */
public class UpdateList {
	private static class Data {

		public final String uploader;
		public final long i18n_version, votes;
		public final float rating;
		public boolean verified;
		public final long timestamp, downloadCount;
		public final List<Utils.AddOnComment> comments;
		public final long[] ratings;

		public String descname, descr, author, category, new_version, minWLVersion, maxWLVersion,
		    syncSafe;
		public final List<String>
		requires, dirs, files, locales, checksums, screenies;
		public final List<Long> sizes;
		public long totalSize;

		public Data(
		    String u, long i, boolean ver, long t, long dl, List<Utils.AddOnComment> c, long[] rs) {
			comments = c;
			uploader = u;
			i18n_version = i;
			verified = ver;
			timestamp = t;
			downloadCount = dl;
			ratings = rs;

			long vot = 0;
			float sum = 0;
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

	private static Map<String, Data> detectAndUpdateMetadata() throws Exception {
		Map<String, Data> result = new HashMap<>();
		File[] allAddons = Utils.listSorted(new File("addons"));
		for (File addonDir : allAddons) {
			final String addon = addonDir.getName();
			if (!addon.endsWith(".wad") || !addonDir.isDirectory()) {
				continue;
			}

			ResultSet sqlMain =
			    Utils.sql(Utils.Databases.kAddOns, "select * from addons where name=?", addon);
			sqlMain.next();
			final long addOnID = sqlMain.getLong("id");

			long[] votes = Utils.getVotes(addOnID);

			List<Utils.AddOnComment> comments = new ArrayList<>();
			ResultSet sql = Utils.sql(
			    Utils.Databases.kAddOns, "select * from usercomments where addon=?", addOnID);
			while (sql.next()) {
				comments.add(new Utils.AddOnComment(
				    sql.getLong("id"), sql.getLong("user"), sql.getLong("timestamp"), null, null,
				    sql.getString("version"),
				    // These lists don't allow newlines, so we use two spaces
				    // instead. Localization is not possible here.
				    sql.getString("message").replaceAll("[\n\r\t]", "  ")));
			}

			Data d =
			    new Data(Utils.getUploadersString(addOnID, true), sqlMain.getLong("i18n_version"),
			             sqlMain.getInt("security") > 0, sqlMain.getLong("timestamp"),
			             sqlMain.getLong("downloads"), comments, votes);
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
					case "name":
						d.descname = arg;
						break;
					case "description":
						d.descr = arg;
						break;
					case "author":
						d.author = arg;
						break;
					case "category":
						d.category = arg;
						break;
					case "version":
						d.new_version = arg;
						break;
					case "min_wl_version":
						d.minWLVersion = arg;
						break;
					case "max_wl_version":
						d.maxWLVersion = arg;
						break;
					case "sync_safe":
						if (arg.equalsIgnoreCase("true")) d.syncSafe = "sync_safe";
						break;
					case "requires":
						for (String req : arg.split(",")) d.requires.add(req);
						break;
					default:
						break;
				}
			}
			for (Long l : d.sizes) d.totalSize += l;
		}
		return result;
	}

	private static void recurse(List<String> dirs,
	                            List<String> files,
	                            List<String> checksums,
	                            List<Long> size,
	                            File curdir,
	                            String prefix) {
		for (File f : Utils.listSorted(curdir)) {
			if (f.isFile()) {
				files.add(prefix + f.getName());
				size.add(f.length());
				checksums.add(Utils.checksum(f));
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
				checksums.add(Utils.checksum(f));
			}
		}
	}

	private static void gatherScreenshots(File addon, List<String> screenies) throws Exception {
		File dir = new File(addon, "../../screenshots/" + addon.getName());
		if (dir.isDirectory()) {
			List<String> in = Files.readAllLines(
			    new File(addon, "../../screenshots/" + addon.getName() + "/descriptions").toPath());
			while (!in.isEmpty()) {
				String str = in.remove(0);
				screenies.add(str.split("=")[0]);
				screenies.add(str.split("\"")[1]);
			}
		}
	}

	private static void writeAddon(int listVersion, PrintWriter w, File addon, Data data)
	    throws Exception {
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
			for (long r : data.ratings) w.println(r);
		}
		w.println(data.comments.size());
		for (Utils.AddOnComment c : data.comments) {
			w.println(Utils.getUsername(c.userID));
			w.println(c.message);
			w.println(c.version);
			w.println(c.timestamp);
		}
		w.println(data.new_version);
		w.println(data.i18n_version);
		w.println(data.totalSize);
		w.println(data.category);
		w.println(data.requires.size());
		for (String r : data.requires) w.println(r);
		w.println(data.dirs.size());
		for (String r : data.dirs) w.println(r);
		w.println(data.files.size());
		for (String r : data.files) w.println(r);
		w.println(data.locales.size());
		for (String r : data.locales) w.println(r);
		w.println(data.checksums.size());
		for (String r : data.checksums) w.println(r);

		if (listVersion >= 2) {
			w.println(data.screenies.size() / 2);
			for (String r : data.screenies) w.println(r);
		}

		w.println(data.verified ? "verified" : "unchecked");
	}

	private static final int kHighestListVersion = 3;

	/**
	 * Manual lists synchronization main function.
	 * @param args Ignored.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	public static void main(String[] args) throws Exception {
		Utils.initDatabases();
		rebuildLists();
	}

	/**
	 * Regenerate all list* files.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	public static void rebuildLists() throws Exception {
		Utils.log("Rebuilding the lists...");
		final Map<String, Data> data = detectAndUpdateMetadata();
		File[] files = Utils.listSorted(new File("addons"));
		for (int listVersion = 1; listVersion <= kHighestListVersion; ++listVersion) {
			PrintWriter write =
			    new PrintWriter(new File(listVersion == 1 ? "list" : ("list_" + listVersion)));
			write.println(listVersion);
			write.println(files.length);
			for (File file : files) {
				writeAddon(listVersion, write, file, data.get(file.getName()));
			}
			write.close();
		}
	}
}
