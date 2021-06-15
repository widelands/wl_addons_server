package wl.server;

import java.io.*;
import java.net.*;
import java.util.*;
import wl.utils.*;

abstract class HandleCommand {
	public static void handleCmdList(String[] cmd,
	                                 PrintStream out,
	                                 InputStream in,
	                                 int version,
	                                 String username,
	                                 boolean admin,
	                                 String locale) throws Exception {
		// Args: –
		ServerUtils.checkNrArgs(cmd, 0);
		File[] names = ServerUtils.listSorted(new File("addons"));
		String str = "" + names.length;
		for (File s : names) str += "\n" + s.getName();
		out.println(str);
		out.println("ENDOFSTREAM");
	}

	public static void handleCmdInfo(String[] cmd,
	                                 PrintStream out,
	                                 InputStream in,
	                                 int version,
	                                 String username,
	                                 boolean admin,
	                                 String locale) throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.info(version, cmd[1], locale, out);
	}

	public static void handleCmdDownload(String[] cmd,
	                                     PrintStream out,
	                                     InputStream in,
	                                     int version,
	                                     String username,
	                                     boolean admin,
	                                     String locale) throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.DirInfo dir = new ServerUtils.DirInfo(new File("addons", cmd[1]));
		Utils.registerDownload(cmd[1]);
		out.println(dir.totalDirs);
		dir.writeAllDirNames(out, "");
		dir.writeAllFileInfos(out);
		out.println("ENDOFSTREAM");
	}

	public static void handleCmdI18n(String[] cmd,
	                                 PrintStream out,
	                                 InputStream in,
	                                 int version,
	                                 String username,
	                                 boolean admin,
	                                 String locale) throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.DirInfo dir = new ServerUtils.DirInfo(new File("i18n", cmd[1]));
		dir.writeAllFileInfos(out);
		out.println("ENDOFSTREAM");
	}

	public static void handleCmdScreenshot(String[] cmd,
	                                       PrintStream out,
	                                       InputStream in,
	                                       int version,
	                                       String username,
	                                       boolean admin,
	                                       String locale) throws Exception {
		// Args: addon screenie
		ServerUtils.checkNrArgs(cmd, 2);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkNameValid(cmd[2], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.writeOneFile(new File("screenshots/" + cmd[1], cmd[2]), out);
		out.println("ENDOFSTREAM");
	}

	public static void handleCmdVote(String[] cmd,
	                                 PrintStream out,
	                                 InputStream in,
	                                 int version,
	                                 String username,
	                                 boolean admin,
	                                 String locale) throws Exception {
		// Args: name vote
		ServerUtils.checkNrArgs(cmd, 2);
		if (username.isEmpty()) throw new ProtocolException("You need to log in to vote");
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		Utils.registerVote(cmd[1], username, cmd[2]);
		out.println("ENDOFSTREAM");
	}

	public static void handleCmdGetVote(String[] cmd,
	                                    PrintStream out,
	                                    InputStream in,
	                                    int version,
	                                    String username,
	                                    boolean admin,
	                                    String locale) throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty()) {
			out.println("NOT_LOGGED_IN");  // No exception here.
			return;
		}
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		File f = new File(Utils.config("uservotesdir"), cmd[1]);
		Utils.Value vote = f.isFile() ? Utils.readProfile(f, cmd[1]).get(username) : null;
		out.println(vote == null ? "0" : vote.value);
		out.println("ENDOFSTREAM");
	}

	public static void handleCmdComment(String[] cmd,
	                                    PrintStream out,
	                                    InputStream in,
	                                    int version,
	                                    String username,
	                                    boolean admin,
	                                    String locale) throws Exception {
		// Args: name version lines
		ServerUtils.checkNrArgs(cmd, 3);
		if (username.isEmpty()) throw new ProtocolException("Log in to comment");
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		String msg = "";
		for (int i = Integer.valueOf(cmd[3]); i > 0; --i) {
			if (!msg.isEmpty()) msg += "\n";
			msg += ServerUtils.readLine(in);
		}
		if (!ServerUtils.readLine(in).equals("ENDOFSTREAM"))
			throw new ProtocolException("Stream continues past its end");
		Utils.comment(cmd[1], username, cmd[2], msg);
		out.println("ENDOFSTREAM");
	}

	public static void handleCmdEditComment(String[] cmd,
	                                        PrintStream out,
	                                        InputStream in,
	                                        int version,
	                                        String username,
	                                        boolean admin,
	                                        String locale) throws Exception {
		// Args: name index lines
		ServerUtils.checkNrArgs(cmd, 3);
		if (username.isEmpty()) throw new ProtocolException("Log in to edit comments");
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		if (!admin) {
			if (!username.equals(Utils.readProfile(new File("metadata", cmd[1] + ".server"), cmd[1])
			                         .get("comment_name_" + cmd[2])
			                         .value)) {
				throw new ProtocolException("Forbidden to edit another user's comment");
			}
			Utils.Value v = Utils.readProfile(new File("metadata", cmd[1] + ".server"), cmd[1])
			                    .get("comment_editor_" + cmd[2]);
			if (v != null && !username.equals(v.value))
				throw new ProtocolException("Forbidden to edit a comment edited by a maintainer");
		}

		String msg = "";
		for (int i = Integer.valueOf(cmd[3]); i > 0; --i) {
			if (!msg.isEmpty()) msg += "\n";
			msg += ServerUtils.readLine(in);
		}

		if (!ServerUtils.readLine(in).equals("ENDOFSTREAM"))
			throw new ProtocolException("Stream continues past its end");
		Utils.editComment(cmd[1], cmd[2], username, msg);
		out.println("ENDOFSTREAM");
	}

	public static void handleCmdContact(String[] cmd,
	                                    PrintStream out,
	                                    InputStream in,
	                                    int version,
	                                    String username,
	                                    boolean admin,
	                                    String locale) throws Exception {
		// Args: lines
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty())
			throw new ProtocolException("You need to log in to use the contact form");

		String msg = "";
		for (int i = Integer.valueOf(cmd[1]); i > 0; --i) {
			msg += "\n";
			msg += ServerUtils.readLine(in);
		}
		if (!ServerUtils.readLine(in).equals("ENDOFSTREAM"))
			throw new ProtocolException("Stream continues past its end");
		ServerUtils.sendEnquiry(username, msg);

		out.println("ENDOFSTREAM");
	}

	public static void handleCmdSubmitScreenshot(String[] cmd,
	                                             PrintStream out,
	                                             InputStream in,
	                                             int version,
	                                             String username,
	                                             boolean admin,
	                                             String locale) throws Exception {
		// Args: name filesize checksum whitespaces description
		ServerUtils.checkNrArgs(cmd, 5);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		if (username.isEmpty())
			throw new ProtocolException("You need to log in to submit screenshots");
		if (!admin) {
			String originalUploader =
			    Utils.readProfile(new File("metadata", cmd[1] + ".maintain"), cmd[1])
			        .get("uploader")
			        .value(locale);
			if (!username.equals(originalUploader))
				throw new ProtocolException(
				    "You can not submit screenshots for another person's (" + originalUploader +
				    ") add-on");
		}
		long size = Long.valueOf(cmd[2]);
		if (size > 4 * 1000 * 1000)
			throw new ProtocolException(
			    "Filesize " + size +
			    " exceeds the limit of 4 MB. If you really need to submit such a large image, please contact the Widelands Development Team.");
		File tempDir = Utils.createTempDir();

		try {
			String filename;
			for (int i = 1;; ++i) {
				filename = "image" + i + ".png";
				if (!new File("screenshots/" + cmd[1], filename).exists()) break;
			}
			File file = new File(tempDir, filename);
			PrintStream stream = new PrintStream(file);
			for (long l = 0; l < size; ++l) {
				int b = in.read();
				if (b < 0)
					throw new ProtocolException("Stream ended unexpectedly while reading file");
				stream.write(b);
			}
			stream.close();
			String checksum = UpdateList.checksum(file);
			if (!checksum.equals(cmd[3]))
				throw new ProtocolException("Checksum mismatch: expected " + cmd[3] + ", found " +
				                            checksum);
			if (!ServerUtils.readLine(in).equals("ENDOFSTREAM"))
				throw new ProtocolException("Stream continues past its end");
			File result = new File("screenshots", cmd[1]);
			result.mkdirs();
			result = new File(result, filename);
			file.renameTo​(result);
			ServerUtils.doDelete(tempDir);
			TreeMap<String, Utils.Value> ch = new TreeMap<>();
			int whitespaces = Integer.valueOf(cmd[4]);
			String msg = cmd[5];
			for (int w = 0; w < whitespaces; ++w) msg += " " + cmd[6 + w];
			ch.put(filename, new Utils.Value(filename, msg, cmd[1]));
			Utils.editProfile(new File("screenshots/" + cmd[1], "descriptions"), cmd[1], ch);
			out.println("ENDOFSTREAM");
		} catch (Exception e) {
			ServerUtils.doDelete(tempDir);
			throw new ProtocolException(e.getMessage());
		}
	}

	public static void handleCmdSubmit(String[] cmd,
	                                   PrintStream out,
	                                   InputStream in,
	                                   int version,
	                                   String username,
	                                   boolean admin,
	                                   String locale) throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty()) throw new ProtocolException("You need to log in to submit add-ons");
		ServerUtils.checkNameValid(cmd[1], false);
		/* No need here to check if the add-on exists. */
		if (!admin) {
			File f = new File("metadata", cmd[1] + ".maintain");
			if (f.exists()) {
				String originalUploader =
				    Utils.readProfile(f, cmd[1]).get("uploader").value(locale);
				if (!username.equals(originalUploader))
					throw new ProtocolException("You can not overwrite another person's (" +
					                            originalUploader + ") existing add-on");
			}
		}
		File tempDir = Utils.createTempDir();

		try {
			final int nrDirs = Integer.valueOf(ServerUtils.readLine(in));
			File[] dirnames = new File[nrDirs];
			for (int i = 0; i < nrDirs; ++i) {
				String n = ServerUtils.readLine(in);
				if (n.startsWith("/")) n = n.substring(1);
				ServerUtils.checkNameValid(n, true);
				dirnames[i] = new File(tempDir, n);
				dirnames[i].mkdirs();
			}

			long totalSize = 0;
			for (int i = 0; i < nrDirs; ++i) {
				final int nrFiles = Integer.valueOf(ServerUtils.readLine(in));
				for (int j = 0; j < nrFiles; ++j) {
					final String filename = ServerUtils.readLine(in);
					ServerUtils.checkNameValid(filename, false);
					final String checksum = ServerUtils.readLine(in);
					final long size = Long.valueOf(ServerUtils.readLine(in));
					totalSize += size;
					if (totalSize > 200 * 1000 * 1000)
						throw new ProtocolException(
						    "Filesize limit of 200 MB exceeded. "
						    +
						    "If you really want to submit such a large add-on, please contact the Widelands Development Team.");
					File file = new File(dirnames[i], filename);
					PrintStream stream = new PrintStream(file);
					for (long l = 0; l < size; ++l) {
						int b = in.read();
						if (b < 0)
							throw new ProtocolException(
							    "Stream ended unexpectedly while reading file");
						stream.write(b);
					}
					stream.close();
					String c = UpdateList.checksum(file);
					if (!checksum.equals(c))
						throw new ProtocolException("Checksum mismatch for " +
						                            dirnames[i].getPath() + "/" + filename +
						                            ": expected " + checksum + ", found " + c);
				}
			}

			if (!ServerUtils.readLine(in).equals("ENDOFSTREAM"))
				throw new ProtocolException("Stream continues past its end");

			File addOnDir = new File("addons", cmd[1]);
			File addOnMain = new File(addOnDir, "addon");

			TreeMap<String, Utils.Value> newProfile =
			    Utils.readProfile(new File(tempDir, "addon"), cmd[1]);
			boolean isUpdate = false;
			String oldVersionString = null;
			if (addOnDir.isDirectory()) {
				TreeMap<String, Utils.Value> oldProfile = Utils.readProfile(addOnMain, cmd[1]);

				if (!oldProfile.get("category").value.equals(newProfile.get("category").value))
					throw new ProtocolException(
					    "An add-on with the same name and a different category already exists. Old category is '" +
					    oldProfile.get("category").value + "', new category is '" +
					    newProfile.get("category").value + "'.");

				oldVersionString = oldProfile.get("version").value;
				String[] oldVersion = oldVersionString.split("\\.");
				String[] newVersion = newProfile.get("version").value.split("\\.");
				Boolean newer = null;
				for (int i = 0; i < oldVersion.length && i < newVersion.length; ++i) {
					if (!oldVersion[i].equals(newVersion[i])) {
						newer = (Integer.valueOf(oldVersion[i]) < Integer.valueOf(newVersion[i]));
						break;
					}
				}
				if (newer == null) newer = (oldVersion.length < newVersion.length);
				if (!newer) {
					throw new ProtocolException(
					    "An add-on with the same name and an equal or newer version already exists. Existing version is '" +
					    oldVersionString + "', your version is '" +
					    newProfile.get("version").value + "'.");
				}

				isUpdate = true;
			} else {
				Utils.initMetadata(cmd[1], username);
			}

			Utils.sendNotificationToGitHubThread(
			    (isUpdate ? ("An add-on has been updated by " + username) :
                            ("A new add-on has been submitted by " + username)) +
			    ":\n"
			    + "\n- Name: " + cmd[1] +
			    (isUpdate ? ("\n- Old version: " + oldVersionString +
			                 "\n- New version: " + newProfile.get("version").value) :
                            ("\n- Version: " + newProfile.get("version").value)) +
			    (username.equals(newProfile.get("author").value) ?
                     ("\n- Author: " + newProfile.get("author").value) :
                     ("\n- **Author: " + newProfile.get("author").value + "**")) +
			    "\n- Descname: " + newProfile.get("name").value +
			    "\n- Description: " + newProfile.get("description").value +
			    "\n- Category: " + newProfile.get("category").value +
			    (newProfile.containsKey("sync_safe") ?
                     ("\n- **Sync-safe: " + newProfile.get("sync_safe").value + "**") :
                     ("\n- Sync-safe: –")) +
			    "\n- Min WL version: " +
			    (newProfile.containsKey("min_wl_version") ? newProfile.get("min_wl_version").value :
                                                            "–") +
			    "\n- Max WL version: " +
			    (newProfile.containsKey("max_wl_version") ? newProfile.get("max_wl_version").value :
                                                            "–") +
			    "\n- Requires: " +
			    (newProfile.get("requires").value.isEmpty() ? "–" :
                                                              newProfile.get("requires").value) +
			    "\n\nPlease review this add-on soonish.");
			if (isUpdate) ServerUtils.doDelete(addOnDir);
			tempDir.renameTo​(addOnDir);

			out.println("ENDOFSTREAM");
		} catch (Exception e) {
			ServerUtils.doDelete(tempDir);
			throw new ProtocolException(e.toString());
		}
	}
}
