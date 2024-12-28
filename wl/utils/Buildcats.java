/*
 * Copyright (C) 2021-2024 by the Widelands Development Team
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

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.ResultSet;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Class to rebuild a POT file for an add-on.
 */
public class Buildcats {
	/** The textdomain all website map texts are located in. */
	public static final String kWebsiteMapsTextdomain = "websitemaps";

	private Buildcats() {}

	private static boolean isXGettextInput(String filename) {
		String[] f = filename.toLowerCase().split("[/\\\\]");
		filename = f[f.length - 1];
		return filename.endsWith("lua") || filename.equals("elemental") ||
		    filename.equals("dirnames") || filename.equals("descriptions");
	}

	private static void recurse(String out, File dir, boolean mapsOnly) throws Exception {
		Utils.log("Buildcats: Recursing in " + dir.getPath());
		for (File f : Utils.listSorted(dir)) {
			if (f.isDirectory()) {
				recurse(out, f, mapsOnly);
			} else if (f.getName().toLowerCase().endsWith("wmf")) {
				ZipFile zip = new ZipFile(f);
				for (Enumeration e = zip.entries(); e.hasMoreElements();) {
					ZipEntry entry = (ZipEntry)e.nextElement();
					if (entry.isDirectory() || !isXGettextInput(entry.getName())) continue;
					InputStream input = zip.getInputStream(entry);
					ProcessBuilder pb = new ProcessBuilder(new String[] {
					    "xgettext", "-k_", "--keyword=_", "--flag=_:1:pass-lua-format",
					    "--keyword=ngettext:1,2", "--flag=ngettext:1:pass-lua-format",
					    "--flag=ngettext:2:pass-lua-format", "--keyword=pgettext:1c,2",
					    "--flag=pgettext:2:pass-lua-format", "--keyword=npgettext:1c,2,3",
					    "--flag=npgettext:2:pass-lua-format", "--flag=npgettext:3:pass-lua-format",
					    "--language=Lua", "--from-code=UTF-8", "-F",
					    "-c TRANSLATORS:", "--join-existing", "--output=" + out, "-"});
					pb.redirectErrorStream(true);
					Process p = pb.start();
					OutputStream pipe = p.getOutputStream();
					for (;;) {
						int i = input.read();
						if (i < 0) break;
						pipe.write(i);
					}
					pipe.flush();
					pipe.close();
					input.close();
					BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
					String str;
					while ((str = b.readLine()) != null) Utils.log("    # " + str);
					p.waitFor();
				}
			} else if (!mapsOnly && isXGettextInput(f.getName())) {
				Utils.bash("xgettext", "-k_", "--keyword=_", "--flag=_:1:pass-lua-format",
				           "--keyword=ngettext:1,2", "--flag=ngettext:1:pass-lua-format",
				           "--flag=ngettext:2:pass-lua-format", "--keyword=pgettext:1c,2",
				           "--flag=pgettext:2:pass-lua-format", "--keyword=npgettext:1c,2,3",
				           "--flag=npgettext:2:pass-lua-format",
				           "--flag=npgettext:3:pass-lua-format", "--language=Lua",
				           "--from-code=UTF-8", "-F", "-c TRANSLATORS:", "--join-existing",
				           "--output=" + out, f.getPath());
			}
		}
	}

	/**
	 * Regenerate all POT files for all add-ons.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void buildCatalogues() throws Exception {
		File uploaderCommentsFile = Files.createTempFile(null, ".lua").toFile();
		PrintWriter write = new PrintWriter(new FileWriter(uploaderCommentsFile));
		ResultSet sql = Utils.sql(Utils.Databases.kWebsite,
		                          "select uploader_comment from wlmaps_map where "
		                              + "uploader_comment is not null and uploader_comment != ''");
		int nrComments = 0;
		while (sql.next()) {
			String str = sql.getString("uploader_comment");
			write.print("_(\"");
			write.print(Utils.escapeAsShellArgument(str));
			write.println("\")");
			++nrComments;
		}
		write.close();
		Utils.log("Buildcats: Wrote " + nrComments + " uploader comments to " +
		          uploaderCommentsFile.getAbsolutePath());

		File dir = new File("po", kWebsiteMapsTextdomain);
		dir.mkdirs();
		String out = dir.getPath() + "/" + kWebsiteMapsTextdomain + ".pot";

		Utils.bash(
		        "xgettext", "--language=Lua", "--output=" + out, "--force-po",
		        "--copyright-holder=\"Widelands Development Team\"",
		        "--msgid-bugs-address=\"https://www.widelands.org/wiki/ReportingBugs/\"",
		        "--from-code=UTF-8", "/dev/null");

		recurse(out, new File(Utils.config("website_maps_path")), true);

		Utils.bash("xgettext", "--language=Lua", "-k_", "--from-code=UTF-8", "--output=" + out,
		           "--force-po", "--copyright-holder=\"Widelands Development Team\"",
		           "--msgid-bugs-address=\"https://www.widelands.org/wiki/ReportingBugs/\"",
		           "--join-existing", uploaderCommentsFile.getAbsolutePath());

		for (File addon : Utils.listSorted(new File("addons"))) {
			dir = new File("po", addon.getName());
			dir.mkdir();
			out = dir.getPath() + "/" + addon.getName() + ".pot";
			Utils.bash("xgettext", "--language=Lua", "-k_", "--from-code=UTF-8", "--output=" + out,
			           "--force-po", "--copyright-holder=\"Widelands Development Team\"",
			           "--msgid-bugs-address=\"https://www.widelands.org/wiki/ReportingBugs/\"",
			           addon.getPath() + "/addon");
			recurse(out, new File("screenshots", addon.getName()), false);
			recurse(out, addon, false);
		}
	}
}
