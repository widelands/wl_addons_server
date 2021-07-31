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

	public static void main(String[] args) throws Exception {
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
