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

import java.io.File;

/**
 * Class to rebuild a POT file for an add-on.
 */
public class Buildcats {
	private Buildcats() {}

	private static void recurse(String out, File dir) throws Exception {
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
