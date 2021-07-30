package wl.server;

import java.io.*;
import java.net.*;
import java.util.*;
import wl.utils.*;

abstract class ServerUtils {
	public static final ThreadActivityAndGitHubSyncManager SYNCER =
	    new ThreadActivityAndGitHubSyncManager();
	public static final Random RANDOM = new Random(System.currentTimeMillis());

	public static class WLProtocolException extends RuntimeException {
		public WLProtocolException(String msg) { super("WL Protocol Exception: " + msg); }
		@Override
		public String toString() {
			return getMessage();
		}
	}

	public static void log(String msg) {
		System.out.println("[" + new Date() + " @ " + Thread.currentThread().getName() + "] " + msg);
	}

	public static String readLine(InputStream in) throws Exception { return readLine(in, true); }
	public static String readLine(InputStream in, boolean exceptionOnStreamEnd) throws Exception {
		String str = "";
		for (;;) {
			int c = in.read();
			if (c < 0) {
				if (exceptionOnStreamEnd)
					throw new WLProtocolException("Stream ended unexpectedly during readLine");
				return null;
			}
			if (c == '\n') return str;
			str += (char)c;
		}
	}

	public static class DirInfo {
		public final File file;
		public final ArrayList<File> regularFiles;
		public final ArrayList<DirInfo> subdirs;
		public final int totalDirs;
		public final int totalFiles;

		public DirInfo(File dir) {
			file = dir;
			regularFiles = new ArrayList<>();
			subdirs = new ArrayList<>();

			for (File f : listSorted(dir)) {
				if (f.isDirectory())
					subdirs.add(new DirInfo(f));
				else
					regularFiles.add(f);
			}

			int t = 0;
			for (File f : regularFiles) t++;
			totalFiles = t;
			t = 0;
			for (DirInfo d : subdirs) t += d.totalDirs + 1;
			totalDirs = t;
		}

		public void writeAllDirNames(PrintStream out, String prefix) {
			for (DirInfo d : subdirs) {
				out.println(prefix + d.file.getName());
				d.writeAllDirNames(out, prefix + d.file.getName() + "/");
			}
		}
		public void writeAllFileInfos(PrintStream out) throws Exception {
			out.println(regularFiles.size());
			for (File f : regularFiles) {
				out.println(f.getName());
				writeOneFile(f, out);
			}
			for (DirInfo d : subdirs) d.writeAllFileInfos(out);
		}
	}

	public static void checkNrArgs(String[] cmd, int expected) {
		if (cmd.length != expected + 1)
			throw new WLProtocolException("Expected " + expected + " argument(s), found " +
			                              (cmd.length - 1));
	}

	public static File[] listSorted(File dir) {
		File[] files = dir.listFiles();
		Arrays.sort(files);
		return files;
	}

	public static void checkNameValid(String name, boolean directory) {
		if (name == null || (!directory && name.isEmpty()))
			throw new WLProtocolException("Empty name");
		for (char c : name.toCharArray()) {
			if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '1' && c <= '9') ||
			    c == '0' || c == '.' || c == '_' || c == '-')
				continue;
			if (directory && c == '/') continue;
			throw new WLProtocolException("Name '" + name + "' may not contain the character '" +
			                              c + "'");
		}
		if (name.startsWith("/"))
			throw new WLProtocolException("Name '" + name + "' may not start with '/'");
		if (name.contains(".."))
			throw new WLProtocolException("Name '" + name + "' may not contain '..'");
	}

	public static void checkAddOnExists(String name) {
		if (!(new File("addons", name).isDirectory() &&
		      new File("metadata", name + ".maintain").isFile() &&
		      new File("metadata", name + ".server").isFile())) {
			throw new WLProtocolException("Add-on '" + name + "' does not exist");
		}
	}

	public static void writeOneFile(File f, PrintStream out) throws Exception {
		out.println(UpdateList.checksum(f));
		long l = f.length();
		out.println(l);
		FileInputStream read = new FileInputStream(f);
		while (l > 0) {
			int len = (int)Math.min(l, Integer.MAX_VALUE - 1);
			byte[] buffer = new byte[len];
			int r = read.read(buffer, 0, len);
			if (r != len)
				throw new WLProtocolException("Server-side error: Read " + r +
				                              " bytes but expected " + len);
			out.write(buffer);
			l -= len;
		}
	}

	synchronized public static void doDelete(File f) {
		if (f.isDirectory())
			for (File file : f.listFiles()) doDelete(file);
		f.delete();
	}

	private static Object _enquiry_syncer = new Object();
	public static void sendEnquiry(String username, String msg) throws Exception {
		File dir = new File(Utils.config("uservotesdir"), "enquiries");
		dir.mkdirs();
		String filename =
		    username + "_" + new Date().toString().replaceAll(" ", "_").replaceAll(":", "-");
		synchronized (_enquiry_syncer) {
			while (new File(dir, filename).exists()) filename += "+";
		}
		PrintWriter w = new PrintWriter(new File(dir, filename));
		w.println(new Date());
		w.println("The user '" + username + "' sent the following message.");
		w.println("Please reply to https://www.widelands.org/messages/compose/" + username + "/");
		w.print(msg);
		w.close();
		Utils.sendNotificationToGitHubThread("A user has sent an enquiry, please help!\n\n"
		                                     + "- User: " + username + "\n"
		                                     + "- Filename: `" + filename + "`\n"
		                                     + "- Message length: " + msg.length() + " characters");
	}
	synchronized public static void
	info(final int version, final String addon, final String locale, PrintStream out)
	    throws Exception {
		switch (version) {
			case 4: {
				TreeMap<String, Utils.Value> profile =
				    Utils.readProfile(new File("addons/" + addon, "addon"), addon);
				TreeMap<String, Utils.Value> metadataServer =
				    Utils.readProfile(new File("metadata", addon + ".server"), addon);
				TreeMap<String, Utils.Value> metadataMaintain =
				    Utils.readProfile(new File("metadata", addon + ".maintain"), addon);
				TreeMap<String, Utils.Value> screenies =
				    Utils.readProfile(new File("screenshots/" + addon, "descriptions"), addon);

				out.println(profile.get("name").value);
				out.println(profile.get("name").value(locale));
				out.println(profile.get("description").value);
				out.println(profile.get("description").value(locale));
				out.println(profile.get("author").value);
				out.println(profile.get("author").value(locale));
				out.println(metadataMaintain.get("uploader").value(locale));
				out.println(profile.get("version").value);
				out.println(metadataMaintain.get("i18n_version").value);
				out.println(profile.get("category").value);
				out.println(profile.get("requires").value);
				out.println((profile.containsKey("min_wl_version") ?
                                 profile.get("min_wl_version").value :
                                 ""));
				out.println((profile.containsKey("max_wl_version") ?
                                 profile.get("max_wl_version").value :
                                 ""));
				out.println(
				    (profile.containsKey("sync_safe") ? profile.get("sync_safe").value : ""));

				out.println(screenies.size());
				for (String key : screenies.keySet())
					out.println(key + "\n" + screenies.get(key).value(locale));

				out.println(Utils.filesize(new File("addons", addon)));
				out.println(metadataMaintain.get("timestamp").value);
				out.println(metadataServer.get("downloads").value);
				for (int i = 1; i <= 10; ++i) out.println(metadataServer.get("votes_" + i).value);

				int c = Integer.valueOf(metadataServer.get("comments").value);
				out.println(c);
				for (int i = 0; i < c; ++i) {
					out.println(metadataServer.get("comment_name_" + i).value);
					out.println(metadataServer.get("comment_timestamp_" + i).value);

					Utils.Value v = metadataServer.get("comment_editor_" + i);
					out.println(v == null ? "" : v.value);
					v = metadataServer.get("comment_edit_timestamp_" + i);
					out.println(v == null ? "0" : v.value);

					out.println(metadataServer.get("comment_version_" + i).value);
					int l = Integer.valueOf(metadataServer.get("comment_" + i).value);
					out.println(l);
					for (int j = 0; j <= l; ++j)
						out.println(metadataServer.get("comment_" + i + "_" + j).value(locale));
				}
				out.println(
				    metadataMaintain.get("version").value.equals(profile.get("version").value) ?
                        metadataMaintain.get("security").value :
                        "unchecked");

				File iconFile = new File("addons/" + addon, "icon.png");
				if (iconFile.isFile()) {
					ServerUtils.writeOneFile(iconFile, out);
				} else {
					out.println("0\n0");
				}

				out.println("ENDOFSTREAM");
				return;
			}
			default:
				throw new WLProtocolException("Wrong version " + version);
		}
	}
}
