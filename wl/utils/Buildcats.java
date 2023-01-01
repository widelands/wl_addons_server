/*
 * Copyright (C) 2021-2023 by the Widelands Development Team
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

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * Class to rebuild a POT file for an add-on.
 */
public class Buildcats {
	private Buildcats() {}

	private static boolean isXGettextInput(String filename) {
		String[] f = filename.toLowerCase().split("[/\\\\]");
		filename = f[f.length - 1];
		return filename.endsWith("lua") || filename.equals("elemental") ||
		    filename.equals("dirnames") || filename.equals("descriptions");
	}

	private static void recurse(String out, File dir) throws Exception {
		for (File f : Utils.listSorted(dir)) {
			if (f.isDirectory()) {
				recurse(out, f);
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
					p.waitFor();
				}
			} else if (isXGettextInput(f.getName())) {
				Runtime.getRuntime()
				    .exec(new String[] {
				        "xgettext", "-k_", "--keyword=_", "--flag=_:1:pass-lua-format",
				        "--keyword=ngettext:1,2", "--flag=ngettext:1:pass-lua-format",
				        "--flag=ngettext:2:pass-lua-format", "--keyword=pgettext:1c,2",
				        "--flag=pgettext:2:pass-lua-format", "--keyword=npgettext:1c,2,3",
				        "--flag=npgettext:2:pass-lua-format", "--flag=npgettext:3:pass-lua-format",
				        "--language=Lua", "--from-code=UTF-8", "-F",
				        "-c TRANSLATORS:", "--join-existing", "--output=" + out, f.getPath()})
				    .waitFor();
			}
		}
	}

	/**
	 * Regenerate all POT files for all add-ons.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void buildCatalogues() throws Exception {
		for (File addon : Utils.listSorted(new File("addons"))) {
			File dir = new File("po", addon.getName());
			dir.mkdirs();
			String out = dir.getPath() + "/" + addon.getName() + ".pot";
			Runtime.getRuntime()
			    .exec(new String[] {
			        "xgettext", "--language=Lua", "-k_", "--from-code=UTF-8", "--output=" + out,
			        "--copyright-holder=\"Widelands Development Team\"",
			        "--msgid-bugs-address=\"https://www.widelands.org/wiki/ReportingBugs/\"",
			        addon.getPath() + "/addon"})
			    .waitFor();
			recurse(out, new File("screenshots", addon.getName()));
			recurse(out, addon);
		}
	}
}
