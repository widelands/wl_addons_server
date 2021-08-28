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

/**
 * Class to process commands sent from a client thread to the server.
 */
class HandleCommand {
	private final PrintStream out;
	private final InputStream in;
	private final int protocolVersion;
	private final String widelandsVersion;
	private final String username;
	private final long userDatabaseID;
	private final boolean admin;
	private final String locale;

	private String[] cmd;

	/**
	 * Constructor.
	 * @param out Stream to send data to the client.
	 * @param in Stream to receive further data from the client.
	 * @param protocolVersion Protocol version the client uses.
	 * @param widelandsVersion Widelands version the client uses
	 *                         (\c null if protocol version is less than \c 5).
	 * @param username Name of the user (\c "" for unregistered guests).
	 * @param userDatabaseID ID of the user (only valid for registered users).
	 * @param admin Whether the user is a registered administrator.
	 * @param locale Language the client is speaking.
	 */
	public HandleCommand(PrintStream out,
	                     InputStream in,
	                     int protocolVersion,
	                     String widelandsVersion,
	                     String username,
	                     long userDatabaseID,
	                     boolean admin,
	                     String locale) {
		this.cmd = null;
		this.out = out;
		this.in = in;
		this.protocolVersion = protocolVersion;
		this.widelandsVersion = widelandsVersion;
		this.username = username;
		this.userDatabaseID = userDatabaseID;
		this.admin = admin;
		this.locale = locale;
	}

	/**
	 * Handle a new command.
	 * @param cmd The command sent by the client. Parameters are in index \c 1+.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	public void handle(String... c) throws Exception {
		cmd = c;
		Command command = Command.valueOf(cmd[0]);
		MuninStatistics.MUNIN.countCommand(command);

		switch (command) {
			case CMD_LIST:
				handleCmdList();
				break;
			case CMD_INFO:
				handleCmdInfo();
				break;
			case CMD_DOWNLOAD:
				handleCmdDownload();
				break;
			case CMD_I18N:
				handleCmdI18n();
				break;
			case CMD_SCREENSHOT:
				handleCmdScreenshot();
				break;
			case CMD_COMMENT:
				handleCmdComment();
				break;
			case CMD_EDIT_COMMENT:
				handleCmdEditComment();
				break;
			case CMD_VOTE:
				handleCmdVote();
				break;
			case CMD_GET_VOTE:
				handleCmdGetVote();
				break;
			case CMD_SUBMIT_SCREENSHOT:
				handleCmdSubmitScreenshot();
				break;
			case CMD_SUBMIT:
				handleCmdSubmit();
				break;
			case CMD_CONTACT:
				handleCmdContact();
				break;
			case CMD_SETUP_TX:
				handleCmdSetupTx();
				break;
			case CMD_ADMIN_DELETE:
				handleCmdAdminDelete();
				break;
			case CMD_ADMIN_VERIFY:
				handleCmdAdminVerify();
				break;
			case CMD_ADMIN_QUALITY:
				handleCmdAdminQuality();
				break;
			case CMD_ADMIN_SYNC_SAFE:
				handleCmdAdminSyncSafe();
				break;
			default:
				throw new ServerUtils.WLProtocolException("Invalid command " + cmd[0]);
		}

		MuninStatistics.MUNIN.registerSuccessfulCommand();
	}

	// Command handling implementations below

	/**
	 * Handle a #CMD_LIST command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdList() throws Exception {
		// Args: [5+: all]
		ServerUtils.checkNrArgs(cmd, protocolVersion < 5 ? 0 : 1);
		final boolean versionCheck = widelandsVersion != null && !Boolean.parseBoolean(cmd[1]);
		ArrayList<String> compatibleAddOns = new ArrayList<>();
		for (File addon : Utils.listSorted(new File("addons"))) {
			if (versionCheck) {
				TreeMap<String, Utils.Value> profile =
				    Utils.readProfile(new File(addon, "addon"), addon.getName());
				if (!ServerUtils.matchesWidelandsVersion(widelandsVersion,
				                                         profile.containsKey("min_wl_version") ?
                                                             profile.get("min_wl_version").value :
                                                             null,
				                                         profile.containsKey("max_wl_version") ?
                                                             profile.get("max_wl_version").value :
                                                             null)) {
					continue;
				}
			}
			compatibleAddOns.add(addon.getName());
		}

		MuninStatistics.MUNIN.skipNextCmdInfo(compatibleAddOns.size() - 1);
		out.println(compatibleAddOns.size());
		for (String name : compatibleAddOns) out.println(name);
		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_INFO command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdInfo() throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		ServerUtils.semaphoreRO(cmd[1], () -> {
			ResultSet sqlMain = Utils.sqlQuery(
			    Utils.Databases.kAddOns, "select * from addons where name='" + cmd[1] + "'");
			if (!sqlMain.next())
				throw new ServerUtils.WLProtocolException("Add-on '" + cmd[1] +
				                                          "' is not in the database");
			final long addOnID = sqlMain.getLong("id");

			TreeMap<String, Utils.Value> profile =
			    Utils.readProfile(new File("addons/" + cmd[1], "addon"), cmd[1]);
			TreeMap<String, Utils.Value> screenies =
			    Utils.readProfile(new File("screenshots/" + cmd[1], "descriptions"), cmd[1]);

			out.println(profile.get("name").value);
			out.println(profile.get("name").value(locale));
			out.println(profile.get("description").value);
			out.println(profile.get("description").value(locale));
			out.println(profile.get("author").value);
			out.println(profile.get("author").value(locale));

			out.println(Utils.getUploadersString(
			    addOnID, protocolVersion < 5));  // Version 4 assumes there is only one uploader

			out.println(profile.get("version").value);
			out.println(sqlMain.getLong("i18n_version"));
			out.println(profile.get("category").value);
			out.println(profile.get("requires").value);
			out.println(
			    (profile.containsKey("min_wl_version") ? profile.get("min_wl_version").value : ""));
			out.println(
			    (profile.containsKey("max_wl_version") ? profile.get("max_wl_version").value : ""));
			out.println((profile.containsKey("sync_safe") ? profile.get("sync_safe").value : ""));

			out.println(screenies.size());
			for (String key : screenies.keySet())
				out.println(key + "\n" + screenies.get(key).value(locale));

			out.println(Utils.filesize(new File("addons", cmd[1])));
			out.println(sqlMain.getLong("timestamp"));
			out.println(sqlMain.getLong("downloads"));

			for (long v : Utils.getVotes(addOnID)) out.println(v);

			ResultSet sql = Utils.sqlQuery(
			    Utils.Databases.kAddOns, "select * from usercomments where addon=" + addOnID);
			ArrayList<Utils.AddOnComment> comments = new ArrayList<>();
			while (sql.next()) {
				Long editorID = sql.getLong("editor");
				if (sql.wasNull()) editorID = null;
				Long editTS = sql.getLong("edit_timestamp");
				if (sql.wasNull()) editTS = null;
				comments.add(new Utils.AddOnComment(
				    sql.getLong("id"), sql.getLong("user"), sql.getLong("timestamp"), editorID,
				    editTS, sql.getString("version"), sql.getString("message")));
			}
			out.println(comments.size());
			for (Utils.AddOnComment c : comments) {
				if (protocolVersion >= 5) out.println(c.commentID);
				out.println(Utils.getUsername(c.userID));
				out.println(c.timestamp);
				out.println(c.editorID == null ? "" : Utils.getUsername(c.editorID));
				out.println(c.editTimestamp == null ? 0 : c.editTimestamp);
				out.println(c.version);

				String[] msg = c.message.split("\n");
				out.println(msg.length - 1);
				for (String m : msg) out.println(m);
			}

			out.println(sqlMain.getLong("security") > 0 ? "verified" : "unchecked");
			if (protocolVersion >= 5) out.println(sqlMain.getLong("quality"));

			File iconFile = new File("addons/" + cmd[1], "icon.png");
			if (iconFile.isFile()) {
				ServerUtils.writeOneFile(iconFile, out);
			} else {
				out.println("0\n0");
			}

			out.println("ENDOFSTREAM");
		});
	}

	/**
	 * Handle a #CMD_DOWNLOAD command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdDownload() throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.semaphoreRO(cmd[1], () -> {
			ServerUtils.DirInfo dir = new ServerUtils.DirInfo(new File("addons", cmd[1]));
			out.println(dir.totalDirs);
			dir.writeAllDirNames(out, "");
			dir.writeAllFileInfos(out);
		});

		ResultSet sql = Utils.sqlQuery(
		    Utils.Databases.kAddOns, "select id,downloads from addons where name='" + cmd[1] + "'");
		sql.next();
		Utils.sqlCmd(Utils.Databases.kAddOns,
		             "update addons set downloads=" + (sql.getLong("downloads") + 1) +
		                 " where id=" + sql.getLong("id"));

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_I18N command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdI18n() throws Exception {
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

	/**
	 * Handle a #CMD_SCREENSHOT command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdScreenshot() throws Exception {
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

	/**
	 * Handle a #CMD_VOTE command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdVote() throws Exception {
		// Args: name vote
		ServerUtils.checkNrArgs(cmd, 2);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to vote");
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		final long addon = Utils.getAddOnID(cmd[1]);
		final int vote = Integer.valueOf(cmd[2]);
		Utils.sqlCmd(Utils.Databases.kAddOns,
		             "delete from uservotes where user=" + userDatabaseID + " and addon=" + addon);
		if (vote > 0) {
			Utils.sqlCmd(
			    Utils.Databases.kAddOns, "insert into uservotes (user, addon, vote) value (" +
			                                 userDatabaseID + "," + addon + "," + vote + ")");
		}

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_GET_VOTE command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdGetVote() throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty()) {
			out.println("NOT_LOGGED_IN");  // No exception here.
			return;
		}
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		ResultSet sql = Utils.sqlQuery(
		    Utils.Databases.kAddOns, "select vote from uservotes where user=" + userDatabaseID +
		                                 " and addon=" + Utils.getAddOnID(cmd[1]));
		out.println(sql.next() ? ("" + sql.getLong​(1)) : "0");
		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_COMMENT command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdComment() throws Exception {
		// Args: name version lines
		ServerUtils.checkNrArgs(cmd, 3);
		if (username.isEmpty()) throw new ServerUtils.WLProtocolException("Log in to comment");
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		int nrLines = Integer.valueOf(cmd[3]);
		if (nrLines < 1 || nrLines > 100)
			throw new ServerUtils.WLProtocolException("Comment too long (" + nrLines + " lines)");
		String msg = "";
		for (; nrLines > 0; --nrLines) {
			if (!msg.isEmpty()) msg += "\n";
			msg += ServerUtils.readLine(in);
		}
		ServerUtils.checkEndOfStream(in);

		Utils.sqlCmd(Utils.Databases.kAddOns,
		             "insert into usercomments (addon,user,timestamp,version,message) value(" +
		                 Utils.getAddOnID(cmd[1]) + "," + userDatabaseID + "," +
		                 (System.currentTimeMillis() / 1000) + ",'" + cmd[2] + "','" +
		                 msg.replaceAll("'", "\\'") + "')");

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_EDIT_COMMENT command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdEditComment() throws Exception {
		// Args: name index lines
		ServerUtils.checkNrArgs(cmd, protocolVersion < 5 ? 3 : 2);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("Log in to edit comments");
		if (protocolVersion < 5) {
			ServerUtils.checkNameValid(cmd[1], false);
			ServerUtils.checkAddOnExists(cmd[1]);
		}

		long commentID;
		if (protocolVersion >= 5) {
			commentID = Integer.valueOf(cmd[1]);
		} else {
			ResultSet sql =
			    Utils.sqlQuery(Utils.Databases.kAddOns, "select id from usercomments where addon=" +
			                                                Utils.getAddOnID(cmd[1]));
			for (int i = Integer.valueOf(cmd[2]); i >= 0; i--) {
				if (!sql.next()) {
					throw new ServerUtils.WLProtocolException("Invalid comment index " + cmd[2]);
				}
			}
			commentID = sql.getLong("id");
		}
		ResultSet sql = Utils.sqlQuery(
		    Utils.Databases.kAddOns, "select user,editor from usercomments where id=" + commentID);
		if (!sql.next())
			throw new ServerUtils.WLProtocolException("Invalid comment ID " + commentID);

		if (!admin) {
			if (sql.getLong("user") != userDatabaseID)
				throw new ServerUtils.WLProtocolException(
				    "Forbidden to edit another user's comment");
			final long editor = sql.getLong("editor");
			if (!sql.wasNull() && editor != userDatabaseID)
				throw new ServerUtils.WLProtocolException(
				    "Forbidden to edit a comment edited by a maintainer");
		}

		final int nrLines = Integer.valueOf(cmd[protocolVersion < 5 ? 3 : 2]);
		if (nrLines < 0 || nrLines > 100 || (nrLines == 0 && protocolVersion < 5))
			throw new ServerUtils.WLProtocolException("Comment too long (" + nrLines + " lines)");
		String msg = "";
		for (int i = nrLines; i > 0; --i) {
			if (!msg.isEmpty()) msg += "\n";
			msg += ServerUtils.readLine(in);
		}

		ServerUtils.checkEndOfStream(in);

		if (nrLines == 0) {
			Utils.sqlCmd(Utils.Databases.kAddOns, "delete from usercomments where id=" + commentID);
		} else {
			Utils.sqlCmd(Utils.Databases.kAddOns,
			             "update usercomments set editor=" + userDatabaseID + ", edit_timestamp=" +
			                 (System.currentTimeMillis() / 1000) + ", message='" +
			                 msg.replaceAll("'", "\\'") + "' where id=" + commentID);
		}

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_SETUP_TX command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdSetupTx() throws Exception {
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
			Utils.bash("tx", "config", "mapping", "--execute", "-r",
			           ServerUtils.toTransifexResource(cmd[1]), "--source-lang", "en", "--type",
			           "PO", "--source-file", potFile.getAbsolutePath(), "--expression",
			           "po/" + cmd[1] + "/<lang>.po");
			TransifexIntegration.TX.push();
		}

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_ADMIN_VERIFY command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdAdminVerify() throws Exception {
		// Args: name state
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 2);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		final int state = Integer.valueOf(cmd[2]);
		if (state != 0 && state != 1)
			throw new ServerUtils.WLProtocolException("Invalid state " + cmd[2]);
		Utils.sqlCmd(Utils.Databases.kAddOns,
		             "update addons set security=" + state + " where name='" + cmd[1] + "'");

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_ADMIN_QUALITY command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdAdminQuality() throws Exception {
		// Args: name quality
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 2);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		final int quality = Integer.valueOf(cmd[2]);
		if (quality < 0 || quality > 3)
			throw new ServerUtils.WLProtocolException("Invalid quality " + cmd[2]);
		Utils.sqlCmd(Utils.Databases.kAddOns,
		             "update addons set quality=" + quality + " where name='" + cmd[1] + "'");

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_ADMIN_SYNC_SAFE command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdAdminSyncSafe() throws Exception {
		// Args: name state
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 2);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		ServerUtils.semaphoreRW(cmd[1], () -> {
			TreeMap<String, Utils.Value> ch = new TreeMap<>();
			ch.put("sync_safe", new Utils.Value("sync_safe", cmd[2]));
			Utils.editProfile(new File("addons/" + cmd[1], "addon"), cmd[1], ch);
		});

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_ADMIN_DELETE command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdAdminDelete() throws Exception {
		// Args: name lines
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 2);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		int nrLines = Integer.valueOf(cmd[2]);
		if (nrLines < 1 || nrLines > 100)
			throw new ServerUtils.WLProtocolException("Message too long (" + nrLines + " lines)");
		String msg = "";
		for (; nrLines > 0; --nrLines) {
			msg += "\n";
			msg += ServerUtils.readLine(in);
		}
		ServerUtils.checkEndOfStream(in);

		final String reason = msg;  // Lambdas need "final or effectively final" local variables…
		ServerUtils.semaphoreRW(cmd[1], () -> {
			final long id = Utils.getAddOnID(cmd[1]);
			Utils.sendNotificationToGitHubThread(
			    "The add-on '" + cmd[1] + "' (#" + id +
			    ") has been deleted by an administrator for the following reason:\n" + reason +
			    "\n\nThe add-on can still be restored manually from the Git history and the last database backups.");

			ResultSet sql = Utils.sqlQuery(
			    Utils.Databases.kWebsite,
			    "select id from notification_noticetype where label='addon_deleted'");
			final boolean noticeTypeKnown = sql.next();
			if (!noticeTypeKnown)
				Utils.log("Notification type 'addon_deleted' was not defined yet");
			final long noticeTypeID = noticeTypeKnown ? sql.getLong("id") : -1;

			sql = Utils.sqlQuery(
			    Utils.Databases.kAddOns, "select user from uploaders where addon=" + id);
			while (sql.next()) {
				long user = sql.getLong("user");
				ResultSet email =
				    Utils.sqlQuery(Utils.Databases.kWebsite,
				                   "select email,username from auth_user where id=" + user);
				if (!email.next()) {
					Utils.log("User #" + user +
					          " does not seem to be a registered user. No e-mail will be sent.");
					continue;
				}
				if (noticeTypeKnown && Utils.checkUserDisabledNotifications(user, noticeTypeID)) {
					Utils.log("User '" + username + "' disabled deletion notifications.");
					continue;
				}

				File message = File.createTempFile("deladdon", null);
				PrintWriter write = new PrintWriter(message);
				write.println("From: noreply@widelands.org");
				write.println("Subject: Add-On Deleted");
				write.println("\nDear " + email.getString("username") + ",");
				write.println(
				    "your add-on '" + cmd[1] +
				    "' has been deleted by the server administrators for the following reason:");
				write.println(reason);
				write.println("\n-------------------------");
				write.print(
				    "If you believe this decision to be incorrect, please contact us in the forum at https://www.widelands.org/forum/forum/17/.");
				write.close();

				ServerUtils.sendEMail(email.getString("email"), message);
				message.delete();
			}

			Utils.sqlCmd(Utils.Databases.kAddOns, "delete from uservotes where addon=" + id);
			Utils.sqlCmd(Utils.Databases.kAddOns, "delete from usercomments where addon=" + id);
			Utils.sqlCmd(Utils.Databases.kAddOns, "delete from addons where id=" + id);
			Utils.sqlCmd(Utils.Databases.kAddOns, "delete from uploaders where addon=" + id);

			ServerUtils.doDelete(new File("addons", cmd[1]));
			ServerUtils.doDelete(new File("po", cmd[1]));
			ServerUtils.doDelete(new File("i18n", cmd[1]));
			for (File lang : Utils.listSorted(new File("i18n"))) {
				File f = new File(lang, "LC_MESSAGES/" + cmd[1] + ".mo");
				if (f.isFile()) f.delete();
			}

			Utils.bash("tx", "delete", "-r", ServerUtils.toTransifexResource(cmd[1]), "-f");
		});

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_CONTACT command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdContact() throws Exception {
		// Args: lines
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to use the contact form");

		int nrLines = Integer.valueOf(cmd[1]);
		if (nrLines < 1 || nrLines > 100)
			throw new ServerUtils.WLProtocolException("Message too long (" + nrLines + " lines)");
		String msg = "";
		for (; nrLines > 0; --nrLines) {
			msg += "\n";
			msg += ServerUtils.readLine(in);
		}
		ServerUtils.checkEndOfStream(in);

		ServerUtils.sendEnquiry(username, msg);
		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a #CMD_SUBMIT_SCREENSHOT command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdSubmitScreenshot() throws Exception {
		// Args: name filesize checksum whitespaces description
		ServerUtils.checkNrArgs(cmd, 5);
		ServerUtils.checkNameValid(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to submit screenshots");
		if (!admin && !Utils.isUploader(cmd[1], userDatabaseID))
			throw new ServerUtils.WLProtocolException(
			    "You can not submit screenshots for another person's add-on");
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
				String checksum = Utils.checksum(file);
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

	/**
	 * Handle a #CMD_SUBMIT command.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handleCmdSubmit() throws Exception {
		// Args: name
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to submit add-ons");
		ServerUtils.checkNameValid(cmd[1], false);
		// No need here to check if the add-on exists.

		ServerUtils.semaphoreRW(cmd[1], () -> {
			if (!admin && !Utils.isUploader(cmd[1], userDatabaseID))
				throw new ServerUtils.WLProtocolException(
				    "You can not overwrite another person's existing add-on");
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
						String c = Utils.checksum(file);
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
					Utils.sqlCmd(
					    Utils.Databases.kAddOns,
					    "insert into addons (name,timestamp,i18n_version,security,quality,downloads) value('" +
					        cmd[1] + "'," + (System.currentTimeMillis() / 1000) + ",0,0,0,0)");
					Utils.sqlCmd(Utils.Databases.kAddOns,
					             "insert into uploaders (addon,user) value(" +
					                 Utils.getAddOnID(cmd[1]) + "," + userDatabaseID + ")");
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
					Utils.sqlCmd(Utils.Databases.kAddOns,
					             "update addons set security=0, quality=0 where id=" +
					                 Utils.getAddOnID(cmd[1]));

					ServerUtils.doDelete(addOnDir);
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
