import java.io.*;
import java.nio.file.*;
import java.util.*;

public class Buildcats {
	private static void xgettext(String out, String arg) throws Exception {
		System.out.println("xgettext " + arg);
		Process pr = Runtime.getRuntime().exec(new String[] {"xgettext",
				"-k_",
				"--keyword=_",
				"--flag=_:1:pass-lua-format",
				"--keyword=ngettext:1,2",
				"--flag=ngettext:1:pass-lua-format",
				"--flag=ngettext:2:pass-lua-format",
				"--keyword=pgettext:1c,2 --flag=pgettext:2:pass-lua-format",
				"--keyword=npgettext:1c,2,3",
				"--flag=npgettext:2:pass-lua-format",
				"--flag=npgettext:3:pass-lua-format",
				"--language=Lua",
				"--from-code=UTF-8 -F",
				"--join-existing",
				"--output=" + out,
				arg});
		pr.waitFor();
	}

	private static void recurse(String out, File dir) throws Exception {
		for (File f : UpdateList.listSorted(dir)) {
			if (f.isFile()) {
				xgettext(out, f.getPath());
			} else {
				recurse(out, f);
			}
		}
	}

	public static void main(String[] args) throws Exception {
		Runtime rt = Runtime.getRuntime();
		for (File addon : UpdateList.listSorted(new File("addons"))) {
			File poDir = new File("po", addon.getName());
			File moDir = new File("i18n", addon.getName());
			rt.exec(new String[] {"mkdir", "-p", poDir.getPath()});
			rt.exec(new String[] {"mkdir", "-p", moDir.getPath()});
			
			String out = poDir.getPath() + "/" + addon.getName() + ".pot";
			Process pr = rt.exec(new String[] {"xgettext",
					"--language=Lua",
					"-k_",
					"--from-code=UTF-8",
					"--output=" + out,
					"--copyright-holder=\"Widelands Development Team\"",
					"--msgid-bugs-address=\"https://www.widelands.org/wiki/ReportingBugs/\"",
					addon.getPath() + "/addon"});
			pr.waitFor();
			recurse(out, addon);
		}
	}
}
