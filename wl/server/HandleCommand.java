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

package wl.server;

import java.io.*;
import java.net.*;
import java.sql.ResultSet;
import java.util.*;
import wl.utils.*;

class HandleCommand {
	private final String[] cmd;
	private final PrintStream out;
	private final InputStream in;
	private final int version;
	private final String username;
	private final long userDatabaseID;
	private final boolean admin;
	private final String locale;

	public HandleCommand(String[] cmd,
	                     PrintStream out,
	                     InputStream in,
	                     int version,
	                     String username,
	                     long userDatabaseID,
	                     boolean admin,
	                     String locale) {
		this.cmd = cmd;
		this.out = out;
		this.in = in;
		this.version = version;
		this.username = username;
		this.userDatabaseID = userDatabaseID;
		this.admin = admin;
		this.locale = locale;
	}

	public void handleCmdList() throws Exception {
		// Args: –
		ServerUtils.checkNrArgs(cmd, 0);
		File[] names = Utils.listSorted(new File("addons"));
		String str = "" + names.length;
		MuninStatistics.MUNIN.skipNextCmdInfo(names.length - 1);
		for (File s : names) str += "\n" + s.getName();
		out.println(str);
		out.println("ENDOFSTREAM");
	}

	public void handleCmdInfo() throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		ServerUtils.semaphoreRO(cmd[1], () -> { ServerUtils.info(version, cmd[1], locale, out); });
	}

	public void handleCmdDownload() throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.semaphoreRO(cmd[1], () -> {
			ServerUtils.DirInfo dir = new ServerUtils.DirInfo(new File("addons", cmd[1]));
			out.println(dir.totalDirs);
			dir.writeAllDirNames(out, "");
			dir.writeAllFileInfos(out);
			Utils.registerDownload(cmd[1]);
		});
		out.println("ENDOFSTREAM");
	}

	public void handleCmdI18n() throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.semaphoreRO(cmd[1], () -> {
			ServerUtils.DirInfo dir = new ServerUtils.DirInfo(new File("i18n", cmd[1]));
			dir.writeAllFileInfos(out);
		});
		out.println("ENDOFSTREAM");
	}

	public void handleCmdScreenshot() throws Exception {
		// Args: addon screenie
		ServerUtils.checkNrArgs(cmd, 2);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkNameValid(cmd[2], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.semaphoreRO(cmd[1], () -> {
			ServerUtils.writeOneFile(new File("screenshots/" + cmd[1], cmd[2]), out);
		});
		out.println("ENDOFSTREAM");
	}

	public void handleCmdVote() throws Exception {
		// Args: name vote
		ServerUtils.checkNrArgs(cmd, 2);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to vote");
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.semaphoreRW(cmd[1], () -> {
			ServerUtils.registerVote(cmd[1], userDatabaseID, Integer.valueOf(cmd[2]));
		});
		out.println("ENDOFSTREAM");
	}

	public void handleCmdGetVote() throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty()) {
			out.println("NOT_LOGGED_IN");  // No exception here.
			return;
		}
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.semaphoreRO(cmd[1], () -> {
			ResultSet sql = ServerUtils.sqlQuery(
			    ServerUtils.Databases.kAddOns, "select vote from uservotes where user_id=" +
			                                       userDatabaseID + " and addon='" + cmd[1] + "'");
			out.println(sql.next() ? ("" + sql.getLong​(1)) : "0");
		});
		out.println("ENDOFSTREAM");
	}

	public void handleCmdComment() throws Exception {
		// Args: name version lines
		ServerUtils.checkNrArgs(cmd, 3);
		if (username.isEmpty()) throw new ServerUtils.WLProtocolException("Log in to comment");
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		int nrLines = Integer.valueOf(cmd[3]);
		if (nrLines < 1 || nrLines > 100)
			throw new ServerUtils.WLProtocolException("Comment too long (" + nrLines + " lines)");
		String msg = "";
		for (int i = nrLines; i > 0; --i) {
			if (!msg.isEmpty()) msg += "\n";
			msg += ServerUtils.readLine(in);
		}
		ServerUtils.checkEndOfStream(in);
		final String finalMsg = msg;
		ServerUtils.semaphoreRW(
		    cmd[1], () -> { Utils.comment(cmd[1], username, cmd[2], finalMsg); });
		out.println("ENDOFSTREAM");
	}

	public void handleCmdEditComment() throws Exception {
		// Args: name index lines
		ServerUtils.checkNrArgs(cmd, 3);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("Log in to edit comments");
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		if (!admin) {
			if (!username.equals(Utils.readProfile(new File("metadata", cmd[1] + ".server"), cmd[1])
			                         .get("comment_name_" + cmd[2])
			                         .value)) {
				throw new ServerUtils.WLProtocolException(
				    "Forbidden to edit another user's comment");
			}
			Utils.Value v = Utils.readProfile(new File("metadata", cmd[1] + ".server"), cmd[1])
			                    .get("comment_editor_" + cmd[2]);
			if (v != null && !username.equals(v.value))
				throw new ServerUtils.WLProtocolException(
				    "Forbidden to edit a comment edited by a maintainer");
		}

		int nrLines = Integer.valueOf(cmd[3]);
		if (nrLines < 1 || nrLines > 100)
			throw new ServerUtils.WLProtocolException("Comment too long (" + nrLines + " lines)");
		String msg = "";
		for (int i = nrLines; i > 0; --i) {
			if (!msg.isEmpty()) msg += "\n";
			msg += ServerUtils.readLine(in);
		}

		ServerUtils.checkEndOfStream(in);
		final String finalMsg = msg;
		ServerUtils.semaphoreRW(
		    cmd[1], () -> { Utils.editComment(cmd[1], cmd[2], username, finalMsg); });
		out.println("ENDOFSTREAM");
	}

	public void handleCmdSetupTx() throws Exception {
		// Args: name
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 1);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		synchronized (TransifexIntegration.TX) {
			File potFile = new File("po/" + cmd[1] + "/" + cmd[1] + ".pot");
			if (!potFile.isFile()) {
				TransifexIntegration.TX.buildCatalogues();
				if (!potFile.isFile())
					throw new ServerUtils.WLProtocolException("Unable to create POT for " + cmd[1]);
			}
			String resource = "widelands-addons." + cmd[1].replaceAll("[._]", "-");
			Utils.bash("tx", "config", "mapping", "--execute", "-r", resource, "--source-lang",
			           "en", "--type", "PO", "--source-file", potFile.getAbsolutePath(),
			           "--expression", "po/" + cmd[1] + "/<lang>.po");
			TransifexIntegration.TX.push();
		}
		out.println("ENDOFSTREAM");
	}

	public void handleCmdContact() throws Exception {
		// Args: lines
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to use the contact form");

		int nrLines = Integer.valueOf(cmd[1]);
		if (nrLines < 1 || nrLines > 100)
			throw new ServerUtils.WLProtocolException("Message too long (" + nrLines + " lines)");
		String msg = "";
		for (int i = nrLines; i > 0; --i) {
			msg += "\n";
			msg += ServerUtils.readLine(in);
		}
		ServerUtils.checkEndOfStream(in);

		ServerUtils.sendEnquiry(username, msg);
		out.println("ENDOFSTREAM");
	}

	public void handleCmdSubmitScreenshot() throws Exception {
		// Args: name filesize checksum whitespaces description
		ServerUtils.checkNrArgs(cmd, 5);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to submit screenshots");
		if (!admin) {
			String originalUploader =
			    Utils.readProfile(new File("metadata", cmd[1] + ".maintain"), cmd[1])
			        .get("uploader")
			        .value(locale);
			if (!username.equals(originalUploader))
				throw new ServerUtils.WLProtocolException(
				    "You can not submit screenshots for another person's (" + originalUploader +
				    ") add-on");
		}
		long size = Long.valueOf(cmd[2]);
		if (size > 4 * 1000 * 1000)
			throw new ServerUtils.WLProtocolException(
			    "Filesize " + size + " exceeds the limit of 4 MB. "
			    + "If you really need to submit such a large image, "
			    + "please contact the Widelands Development Team.");
		ServerUtils.semaphoreRW(cmd[1], () -> {
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
						throw new ServerUtils.WLProtocolException(
						    "Stream ended unexpectedly while reading file");
					stream.write(b);
				}
				stream.close();
				String checksum = UpdateList.checksum(file);
				if (!checksum.equals(cmd[3]))
					throw new ServerUtils.WLProtocolException("Checksum mismatch: expected " +
					                                          cmd[3] + ", found " + checksum);
				ServerUtils.checkEndOfStream(in);
				File result = new File("screenshots", cmd[1]);
				result.mkdirs();
				result = new File(result, filename);
				file.renameTo​(result);
				ServerUtils.doDelete(tempDir);
				TreeMap<String, Utils.Value> ch = new TreeMap<>();
				int whitespaces = Integer.valueOf(cmd[4]);
				if (whitespaces < 0 || whitespaces > 1000)
					throw new ServerUtils.WLProtocolException("Description too long (" +
					                                          whitespaces + " words)");
				String msg = cmd[5];
				for (int w = 0; w < whitespaces; ++w) msg += " " + cmd[6 + w];
				ch.put(filename, new Utils.Value(filename, msg, cmd[1]));
				Utils.editProfile(new File("screenshots/" + cmd[1], "descriptions"), cmd[1], ch);
				out.println("ENDOFSTREAM");
			} catch (Exception e) {
				ServerUtils.doDelete(tempDir);
				throw new ServerUtils.WLProtocolException(e.getMessage());
			}
		});
	}

	public void handleCmdSubmit() throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to submit add-ons");
		ServerUtils.checkNameValid(cmd[1], false);
		/* No need here to check if the add-on exists. */

		ServerUtils.semaphoreRW(cmd[1], () -> {
			if (!admin) {
				File f = new File("metadata", cmd[1] + ".maintain");
				if (f.exists()) {
					String originalUploader =
					    Utils.readProfile(f, cmd[1]).get("uploader").value(locale);
					if (!username.equals(originalUploader))
						throw new ServerUtils.WLProtocolException(
						    "You can not overwrite another person's (" + originalUploader +
						    ") existing add-on");
				}
			}
			File tempDir = Utils.createTempDir();

			try {
				final int nrDirs = Integer.valueOf(ServerUtils.readLine(in));
				if (nrDirs < 0 || nrDirs > 1000)
					throw new ServerUtils.WLProtocolException(
					    "Directory count limit of 1000 exceeded. "
					    + "If you really want to submit such a large add-on, "
					    + "please contact the Widelands Development Team.");
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
					if (nrFiles < 0 || nrFiles > 1000)
						throw new ServerUtils.WLProtocolException(
						    "File count limit of 1000 exceeded. "
						    + "If you really want to submit such a large add-on, "
						    + "please contact the Widelands Development Team.");
					for (int j = 0; j < nrFiles; ++j) {
						final String filename = ServerUtils.readLine(in);
						ServerUtils.checkNameValid(filename, false);
						final String checksum = ServerUtils.readLine(in);
						final long size = Long.valueOf(ServerUtils.readLine(in));
						totalSize += size;
						if (totalSize < 0 || totalSize > 200 * 1000 * 1000)
							throw new ServerUtils.WLProtocolException(
							    "Filesize limit of 200 MB exceeded. "
							    + "If you really want to submit such a large add-on, "
							    + "please contact the Widelands Development Team.");
						File file = new File(dirnames[i], filename);
						PrintStream stream = new PrintStream(file);
						for (long l = 0; l < size; ++l) {
							int b = in.read();
							if (b < 0)
								throw new ServerUtils.WLProtocolException(
								    "Stream ended unexpectedly while reading file");
							stream.write(b);
						}
						stream.close();
						String c = UpdateList.checksum(file);
						if (!checksum.equals(c))
							throw new ServerUtils.WLProtocolException(
							    "Checksum mismatch for " + dirnames[i].getPath() + "/" + filename +
							    ": expected " + checksum + ", found " + c);
					}
				}

				ServerUtils.checkEndOfStream(in);

				File addOnDir = new File("addons", cmd[1]);
				File addOnMain = new File(addOnDir, "addon");

				TreeMap<String, Utils.Value> newProfile =
				    Utils.readProfile(new File(tempDir, "addon"), cmd[1]);
				boolean isUpdate = false;
				String oldVersionString = null;
				if (addOnDir.isDirectory()) {
					TreeMap<String, Utils.Value> oldProfile = Utils.readProfile(addOnMain, cmd[1]);

					if (!oldProfile.get("category").value.equals(newProfile.get("category").value))
						throw new ServerUtils.WLProtocolException(
						    "An add-on with the same name and a different category already exists. "
						    + "Old category is '" + oldProfile.get("category").value +
						    "', new category is '" + newProfile.get("category").value + "'.");

					oldVersionString = oldProfile.get("version").value;
					String[] oldVersion = oldVersionString.split("\\.");
					String[] newVersion = newProfile.get("version").value.split("\\.");
					Boolean newer = null;
					for (int i = 0; i < oldVersion.length && i < newVersion.length; ++i) {
						if (!oldVersion[i].equals(newVersion[i])) {
							newer =
							    (Integer.valueOf(oldVersion[i]) < Integer.valueOf(newVersion[i]));
							break;
						}
					}
					if (newer == null) newer = (oldVersion.length < newVersion.length);
					if (!newer) {
						throw new ServerUtils.WLProtocolException(
						    "An add-on with the same name and an equal or newer version "
						    + "already exists. Existing version is '" + oldVersionString +
						    "', your version is '" + newProfile.get("version").value + "'.");
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
                         ("\n- Sync-safe: N/A")) +
				    "\n- Min WL version: " +
				    (newProfile.containsKey("min_wl_version") ?
                         newProfile.get("min_wl_version").value :
                         "N/A") +
				    "\n- Max WL version: " +
				    (newProfile.containsKey("max_wl_version") ?
                         newProfile.get("max_wl_version").value :
                         "N/A") +
				    "\n- Requires: " +
				    (newProfile.get("requires").value.isEmpty() ?
                         "N/A" :
                         newProfile.get("requires").value) +
				    "\n\nPlease review this add-on soonish.");
				if (isUpdate) {
					ServerUtils.doDelete(addOnDir);

					TreeMap<String, Utils.Value> edit = new TreeMap<>();
					edit.put(
					    "version", new Utils.Value("version", newProfile.get("version").value));
					edit.put("security", new Utils.Value("security", "unchecked"));
					Utils.editMetadata(false, cmd[1], edit);

					Utils._staticprofiles.remove(addOnMain);
				}
				tempDir.renameTo​(addOnDir);

				out.println("ENDOFSTREAM");
			} catch (Exception e) {
				ServerUtils.doDelete(tempDir);
				throw new ServerUtils.WLProtocolException(e.toString());
			}
		});
	}
}
