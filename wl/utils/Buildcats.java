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
import java.util.*;

public class Buildcats {
	private static void recurse(String out, File dir) throws Exception {
		System.out.print('.');
		for (File f : Utils.listSorted(dir)) {
			if (f.isDirectory()) {
				recurse(out, f);
			} else if (f.getName().toLowerCase().endsWith("lua") ||
			           f.getName().equalsIgnoreCase("elemental") ||
			           f.getName().equalsIgnoreCase("dirnames") ||
			           f.getName().equalsIgnoreCase("descriptions")) {
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

	public static void buildCatalogues() throws Exception {
		Runtime rt = Runtime.getRuntime();
		File[] files = Utils.listSorted(new File("addons"));
		final int digits = Integer.toString(files.length).length();
		int progress = 0;
		for (File addon : files) {
			System.out.print(String.format(
			    "[%" + digits + "d/%" + digits + "d] Generating POT file for add-on %s ",
			    ++progress, files.length, addon.getName()));
			String dir = "po/" + addon.getName();
			rt.exec(new String[] {"mkdir", "-p", dir});
			String out = dir + "/" + addon.getName() + ".pot";
			rt.exec(new String[] {
			            "xgettext", "--language=Lua", "-k_", "--from-code=UTF-8", "--output=" + out,
			            "--copyright-holder=\"Widelands Development Team\"",
			            "--msgid-bugs-address=\"https://www.widelands.org/wiki/ReportingBugs/\"",
			            addon.getPath() + "/addon"})
			    .waitFor();
			recurse(out, new File("screenshots", addon.getName()));
			recurse(out, addon);
			System.out.println(" done");
		}
	}
}
