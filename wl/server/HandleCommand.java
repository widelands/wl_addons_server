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

import java.io.File;
import java.io.InputStream;
import java.io.PrintStream;
import java.nio.file.Files;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import wl.utils.Utils;

/**
 * Class to process commands sent from a client thread to the server.
 */
public class HandleCommand {
	private final PrintStream out;
	private final InputStream in;
	private final int protocolVersion;
	private final String widelandsVersion;
	private final String username;
	private final long userDatabaseID;
	private final boolean admin;
	private final String locale;

	private String[] cmd;
	private int commandVersion;

	/**
	 * Constructor.
	 * @param out Stream to send data to the client.
	 * @param in Stream to receive further data from the client.
	 * @param protocolVersion Protocol version the client uses.
	 * @param widelandsVersion Widelands version the client uses
	 *                         (null if protocol version is less than 5).
	 * @param username Name of the user ("" for unregistered guests).
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
		this.commandVersion = 0;
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
	 * Check that the command version is within the expected bounds.
	 * @param max Maximum supported command version.
	 * @throws Exception If the version is out of bounds.
	 */
	private void checkCommandVersion(int max) throws Exception {
		if (commandVersion < 1 || commandVersion > max)
			throw new ServerUtils.WLProtocolException("Invalid command version " + commandVersion +
			                                          " (maximum supported is " + max + ")");
	}

	/**
	 * Handle a new command.
	 * @param c The command sent by the client. Parameters are in index 1+.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public void handle(String... c) throws Exception {
		cmd = c;
		Command command;
		if (protocolVersion >= 6) {
			String[] split = cmd[0].split(":");
			if (split.length != 2)
				throw new ServerUtils.WLProtocolException("Invalid command/version sequence " +
				                                          cmd[0]);
			commandVersion = Integer.valueOf(split[0]);
			command = Command.valueOf(split[1]);
		} else {
			command = Command.valueOf(cmd[0]);
			if (protocolVersion == 5 &&
			    (command == Command.CMD_LIST || command == Command.CMD_INFO ||
			     command == Command.CMD_EDIT_COMMENT)) {
				commandVersion = 2;
			} else {
				commandVersion = 1;
			}
		}
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
	 * Handle a CMD_LIST command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdList() throws Exception {
		// Args: [2+: control]
		checkCommandVersion(2);
		ServerUtils.checkNrArgs(cmd, commandVersion < 2 ? 0 : 1);

		final boolean versionCheck =
		    widelandsVersion != null && commandVersion >= 2 &&
		    (cmd[1].equalsIgnoreCase("true") || cmd[1].equalsIgnoreCase("showall"));
		final boolean appendInfo =
		    commandVersion >= 2 &&
		    (cmd[1].equalsIgnoreCase("showall") || cmd[1].equalsIgnoreCase("showcompatible"));
		ArrayList<String> compatibleAddOns = new ArrayList<>();

		ResultSet sql = Utils.sql(Utils.Databases.kAddOns, "select name from addons order by name");
		while (sql.next()) {
			final String addon = sql.getString("name");
			if (versionCheck) {
				Utils.Profile profile =
				    Utils.readProfile(new File("addons/" + addon + "/addon"), addon);
				if (!ServerUtils.matchesWidelandsVersion(widelandsVersion,
				                                         profile.get("min_wl_version") != null ?
                                                             profile.get("min_wl_version").value :
                                                             null,
				                                         profile.get("max_wl_version") != null ?
                                                             profile.get("max_wl_version").value :
                                                             null)) {
					continue;
				}
			}
			compatibleAddOns.add(addon);
		}

		MuninStatistics.MUNIN.skipNextCmdInfo(compatibleAddOns.size() - (appendInfo ? 0 : 1));
		out.println(compatibleAddOns.size());
		for (String name : compatibleAddOns) out.println(name);
		out.println("ENDOFSTREAM");

		if (appendInfo) {
			for (String name : compatibleAddOns) {
				handle("2:CMD_INFO", name);
			}
		}
	}

	/**
	 * Handle a CMD_INFO command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdInfo() throws Exception {
		// Args: name
		checkCommandVersion(2);
		ServerUtils.checkNrArgs(cmd, 1);
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		ServerUtils.semaphoreRO(cmd[1], () -> {
			ResultSet sqlMain =
			    Utils.sql(Utils.Databases.kAddOns, "select * from addons where name=?", cmd[1]);
			if (!sqlMain.next())
				throw new ServerUtils.WLProtocolException("Add-on '" + cmd[1] +
				                                          "' is not in the database");
			final long addOnID = sqlMain.getLong("id");

			Utils.Profile profile =
			    Utils.readProfile(new File("addons/" + cmd[1], "addon"), cmd[1]);
			Utils.Profile.Section screenies =
			    Utils.readProfile(new File("screenshots/" + cmd[1], "descriptions"), cmd[1])
			        .getSection("");

			out.println(profile.get("name").value);
			out.println(profile.get("name").value(locale));
			out.println(profile.get("description").value);
			out.println(profile.get("description").value(locale));
			out.println(profile.get("author").value);
			out.println(profile.get("author").value(locale));

			out.println(Utils.getUploadersString(
			    addOnID, commandVersion < 2));  // Version 1 assumes there is only one uploader

			out.println(profile.get("version").value);
			out.println(sqlMain.getLong("i18n_version"));
			out.println(profile.get("category").value);
			out.println(profile.get("requires").value);
			out.println(
			    (profile.get("min_wl_version") != null ? profile.get("min_wl_version").value : ""));
			out.println(
			    (profile.get("max_wl_version") != null ? profile.get("max_wl_version").value : ""));
			out.println((profile.get("sync_safe") != null ? profile.get("sync_safe").value : ""));

			out.println(screenies.contents.size());
			for (String key : screenies.contents.keySet())
				out.println(key + "\n" + screenies.contents.get(key).value(locale));

			out.println(Utils.filesize(new File("addons", cmd[1])));
			out.println(sqlMain.getLong("timestamp"));
			out.println(sqlMain.getLong("downloads"));

			for (long v : Utils.getVotes(addOnID)) out.println(v);

			ResultSet sql = Utils.sql(
			    Utils.Databases.kAddOns, "select * from usercomments where addon=?", addOnID);
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
				if (commandVersion >= 2) out.println(c.commentID);
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
			if (commandVersion >= 2) out.println(sqlMain.getLong("quality"));

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
	 * Handle a CMD_DOWNLOAD command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdDownload() throws Exception {
		// Args: name
		checkCommandVersion(1);
		ServerUtils.checkNrArgs(cmd, 1);
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.semaphoreRO(cmd[1], () -> {
			ServerUtils.DirInfo dir = new ServerUtils.DirInfo(new File("addons", cmd[1]));
			out.println(dir.totalDirs);
			dir.writeAllDirNames(out, "");
			dir.writeAllFileInfos(out);
		});

		ResultSet sql = Utils.sql(
		    Utils.Databases.kAddOns, "select id,downloads from addons where name=?", cmd[1]);
		sql.next();
		Utils.sql(Utils.Databases.kAddOns, "update addons set downloads=? where id=?",
		          sql.getLong("downloads") + 1, sql.getLong("id"));

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_I18N command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdI18n() throws Exception {
		// Args: name
		checkCommandVersion(1);
		ServerUtils.checkNrArgs(cmd, 1);
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.semaphoreRO(cmd[1], () -> {
			ServerUtils.DirInfo dir = new ServerUtils.DirInfo(new File("i18n", cmd[1]));
			dir.writeAllFileInfos(out);
		});
		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_SCREENSHOT command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdScreenshot() throws Exception {
		// Args: addon screenie
		checkCommandVersion(1);
		ServerUtils.checkNrArgs(cmd, 2);
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		cmd[2] = ServerUtils.sanitizeName(cmd[2], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		ServerUtils.semaphoreRO(cmd[1], () -> {
			ServerUtils.writeOneFile(new File("screenshots/" + cmd[1], cmd[2]), out);
		});
		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_VOTE command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdVote() throws Exception {
		// Args: name vote
		checkCommandVersion(1);
		ServerUtils.checkNrArgs(cmd, 2);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to vote");
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		final long addon = Utils.getAddOnID(cmd[1]);
		final int vote = Integer.valueOf(cmd[2]);
		Utils.sql(Utils.Databases.kAddOns, "delete from uservotes where user=? and addon=?",
		          userDatabaseID, addon);
		if (vote > 0) {
			Utils.sql(Utils.Databases.kAddOns,
			          "insert into uservotes (user, addon, vote) value (?,?,?)", userDatabaseID,
			          addon, vote);
		}

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_GET_VOTE command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdGetVote() throws Exception {
		// Args: name
		checkCommandVersion(1);
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty()) {
			out.println("NOT_LOGGED_IN");  // No exception here.
			return;
		}
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		ResultSet sql = Utils.sql(Utils.Databases.kAddOns,
		                          "select vote from uservotes where user=? and addon=?",
		                          userDatabaseID, Utils.getAddOnID(cmd[1]));
		out.println(sql.next() ? ("" + sql.getLong(1)) : "0");
		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_COMMENT command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdComment() throws Exception {
		// Args: name version lines
		checkCommandVersion(1);
		ServerUtils.checkNrArgs(cmd, 3);
		if (username.isEmpty()) throw new ServerUtils.WLProtocolException("Log in to comment");
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
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

		Utils.sql(
		    Utils.Databases.kAddOns,
		    "insert into usercomments (addon,user,timestamp,version,message) value(?,?,?,?,?)",
		    Utils.getAddOnID(cmd[1]), userDatabaseID, (System.currentTimeMillis() / 1000), cmd[2],
		    msg);
		ServerUtils.sendCommentNotifications(cmd[1], username, msg, null);

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_EDIT_COMMENT command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdEditComment() throws Exception {
		// Args: name index lines
		checkCommandVersion(2);
		ServerUtils.checkNrArgs(cmd, commandVersion < 2 ? 3 : 2);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("Log in to edit comments");
		if (commandVersion < 2) {
			cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
			ServerUtils.checkAddOnExists(cmd[1]);
		}

		long commentID;
		if (commandVersion >= 2) {
			commentID = Integer.valueOf(cmd[1]);
		} else {
			ResultSet sql =
			    Utils.sql(Utils.Databases.kAddOns, "select id from usercomments where addon=?",
			              Utils.getAddOnID(cmd[1]));
			for (int i = Integer.valueOf(cmd[2]); i >= 0; i--) {
				if (!sql.next()) {
					throw new ServerUtils.WLProtocolException("Invalid comment index " + cmd[2]);
				}
			}
			commentID = sql.getLong("id");
		}
		ResultSet sql = Utils.sql(
		    Utils.Databases.kAddOns,
		    "select user,editor,timestamp,addon,message from usercomments where id=?", commentID);
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
			if (System.currentTimeMillis() / 1000 - sql.getLong("timestamp") >
			    ServerUtils.kCommentEditTimeout)
				throw new ServerUtils.WLProtocolException(
				    "Forbidden to edit a comment later than one day after posting");
		}

		final int nrLines = Integer.valueOf(cmd[commandVersion < 2 ? 3 : 2]);
		if (nrLines < 0 || nrLines > 100 || (nrLines == 0 && commandVersion < 2))
			throw new ServerUtils.WLProtocolException("Comment too long (" + nrLines + " lines)");
		String msg = "";
		for (int i = nrLines; i > 0; --i) {
			if (!msg.isEmpty()) msg += "\n";
			msg += ServerUtils.readLine(in);
		}

		ServerUtils.checkEndOfStream(in);

		if (nrLines == 0) {
			Utils.sql(Utils.Databases.kAddOns, "delete from usercomments where id=?", commentID);
		} else {
			ServerUtils.sendCommentNotifications(
			    Utils.getAddOnName(sql.getLong("addon")), username, msg, sql.getString("message"));
			Utils.sql(Utils.Databases.kAddOns,
			          "update usercomments set editor=?, edit_timestamp=?, message=? where id=?",
			          userDatabaseID, (System.currentTimeMillis() / 1000), msg, commentID);
		}

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_SETUP_TX command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdSetupTx() throws Exception {
		// Args: name
		checkCommandVersion(2);
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 1);
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		synchronized (TransifexIntegration.TX) {
			File potFile = new File("po/" + cmd[1] + "/" + cmd[1] + ".pot");
			if (!potFile.isFile()) {
				TransifexIntegration.TX.buildCatalogues();
				if (!potFile.isFile())
					throw new ServerUtils.WLProtocolException("Unable to create POT for " + cmd[1]);
			}
			String resource = ServerUtils.toTransifexResource(cmd[1]);
			Utils.bash("tx", "config", "mapping", "--execute", "-r", resource, "--source-lang",
			           "en", "--type", "PO", "--source-file", potFile.getAbsolutePath(),
			           "--expression", "po/" + cmd[1] + "/<lang>.po");

			if (commandVersion >= 2) {
				final String priority = ServerUtils.readLine(in);
				if (!priority.equals("normal") && !priority.equals("high") &&
				    !priority.equals("urgent")) {
					throw new ServerUtils.WLProtocolException("Invalid add-on priority " +
					                                          priority);
				}
				final String displayname = ServerUtils.readLine(in);
				if (displayname.trim().isEmpty())
					throw new ServerUtils.WLProtocolException("Empty displayname");
				for (char c : new char[] {'\\', '"'}) {
					if (displayname.indexOf(c) >= 0) {
						throw new ServerUtils.WLProtocolException("Displayname '" + displayname +
						                                          "' may not contain '" + c + "'");
					}
				}

				final String categories = ServerUtils.readLine(in);
				if (!categories.matches("\\[\"[a-zA-Z]+\"(,\"[a-zA-Z]+\")*\\]")) {
					throw new ServerUtils.WLProtocolException("Not a valid list of categories: " +
					                                          categories);
				}
				ServerUtils.checkEndOfStream(in);

				resource = resource.substring(resource.indexOf('.') + 1);
				Utils.bash(
				    "curl", "-g", "-H", "Authorization: Bearer " + Utils.config("transifextoken"),
				    "--request", "PATCH", "-H", "Content-Type: application/vnd.api+json",
				    "https://rest.api.transifex.com/resources/o:widelands:p:widelands-addons:r:" +
				        resource,
				    "-d",
				    "{\"data\":{\"id\":\"o:widelands:p:widelands-addons:r:" + resource +
				        "\",\"type\":\"resources\",\"attributes\":{\"name\":\"" + displayname +
				        "\",\"priority\":\"" + priority + "\",\"categories\":" + categories +
				        "}}}");
			}

			TransifexIntegration.TX.push();
		}

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_ADMIN_VERIFY command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdAdminVerify() throws Exception {
		// Args: name state
		checkCommandVersion(1);
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 2);
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		final int state = Integer.valueOf(cmd[2]);
		if (state != 0 && state != 1)
			throw new ServerUtils.WLProtocolException("Invalid state " + cmd[2]);
		Utils.sql(
		    Utils.Databases.kAddOns, "update addons set security=? where name=?", state, cmd[1]);

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_ADMIN_QUALITY command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdAdminQuality() throws Exception {
		// Args: name quality
		checkCommandVersion(1);
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 2);
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		final int quality = Integer.valueOf(cmd[2]);
		if (quality < 0 || quality > 3)
			throw new ServerUtils.WLProtocolException("Invalid quality " + cmd[2]);
		Utils.sql(
		    Utils.Databases.kAddOns, "update addons set quality=? where name=?", quality, cmd[1]);

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_ADMIN_SYNC_SAFE command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdAdminSyncSafe() throws Exception {
		// Args: name state
		checkCommandVersion(1);
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 2);
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);

		ServerUtils.semaphoreRW(cmd[1], () -> {
			File file = new File("addons/" + cmd[1], "addon");
			Utils.Profile profile = Utils.readProfile(file, cmd[1]);
			profile.getSection(Utils.Profile.kGlobalSection)
			    .contents.put("sync_safe", new Utils.Value("sync_safe", cmd[2]));
			Utils.editProfile(file, profile);
		});

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_ADMIN_DELETE command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdAdminDelete() throws Exception {
		// Args: name lines
		checkCommandVersion(1);
		if (username.isEmpty() || !admin)
			throw new ServerUtils.WLProtocolException("Only admins may do this");
		ServerUtils.checkNrArgs(cmd, 2);
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
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
			Utils.sendEMailToSubscribedAdmins(
			    Utils.kEMailVerbosityFYI, "Add-On Deleted",
			    "The add-on '" + cmd[1] + "' (#" + id + ") has been deleted by " + username +
			        " for the following reason:\n" + reason +
			        "\n\n-------------------------\n\nThe add-on can still be restored manually from the Git history and the last database backups.");

			ResultSet sql =
			    Utils.sql(Utils.Databases.kAddOns, "select user from uploaders where addon=?", id);
			Set<Long> notifyUsers = new HashSet<>();
			while (sql.next()) notifyUsers.add(sql.getLong("user"));
			notifyUsers = ServerUtils.getNotificationSubscribers("deleted", notifyUsers);

			for (Long user : notifyUsers) {
				sql = Utils.sql(Utils.Databases.kWebsite,
				                "select email,username from auth_user where id=?", user);
				sql.next();

				Utils.sendEMail(
				    sql.getString("email"), "Add-On Deleted",
				    "Dear " + sql.getString("username") + ",\n\nyour add-on '" + cmd[1] +
				        "' has been deleted by the server administrators for the following reason:\n" +
				        reason + "\n\n-------------------------\n"
				        +
				        "If you believe this decision to be incorrect, please contact us in the forum at https://www.widelands.org/forum/forum/17/.",
				    true);
			}

			Utils.sql(Utils.Databases.kAddOns, "delete from uservotes where addon=?", id);
			Utils.sql(Utils.Databases.kAddOns, "delete from usercomments where addon=?", id);
			Utils.sql(Utils.Databases.kAddOns, "delete from addons where id=?", id);
			Utils.sql(Utils.Databases.kAddOns, "delete from uploaders where addon=?", id);

			ServerUtils.doDelete(new File("addons", cmd[1]));
			ServerUtils.doDelete(new File("po", cmd[1]));
			ServerUtils.doDelete(new File("i18n", cmd[1]));
			for (File lang : Utils.listSorted(new File("i18n"))) {
				File f = new File(lang, "LC_MESSAGES/" + cmd[1] + ".mo");
				if (f.isFile()) f.delete();
			}

			String resource = ServerUtils.toTransifexResource(cmd[1]);
			resource = resource.substring(resource.indexOf('.') + 1);
			Utils.bash("tx", "delete", "-r", resource, "-f");
			Utils.bash(
			    "curl", "-g", "-H", "Authorization: Bearer " + Utils.config("transifextoken"),
			    "--request", "DELETE",
			    "https://rest.api.transifex.com/resources/o:widelands:p:widelands-addons:r:" +
			        resource);
		});

		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_CONTACT command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdContact() throws Exception {
		// Args: lines
		checkCommandVersion(1);
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

		Utils.sendEMailToSubscribedAdmins(
		    Utils.kEMailVerbosityCritical, "Add-Ons User Enquiry",
		    "The user '" + username + "' has sent the following message.\n"
		        + "Please reply to https://www.widelands.org/messages/compose/" + username +
		        "/\n\n-------------------------\n" + msg);
		out.println("ENDOFSTREAM");
	}

	/**
	 * Handle a CMD_SUBMIT_SCREENSHOT command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdSubmitScreenshot() throws Exception {
		// Args: name filesize checksum whitespaces description
		checkCommandVersion(1);
		if (cmd.length < 5)
			throw new ServerUtils.WLProtocolException("Expected at least 5 argument(s), found " +
			                                          (cmd.length - 1));
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		ServerUtils.checkAddOnExists(cmd[1]);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to submit screenshots");
		if (!admin && !Utils.isUploader(cmd[1], userDatabaseID))
			throw new ServerUtils.WLProtocolException(
			    "You can not submit screenshots for another person's add-on");

		int whitespaces = Integer.valueOf(cmd[4]);
		if (whitespaces < 0 || whitespaces > 1000)
			throw new ServerUtils.WLProtocolException("Description too long (" + whitespaces +
			                                          " words)");
		ServerUtils.checkNrArgs(cmd, 5 + whitespaces);
		long size = Long.valueOf(cmd[2]);
		if (size > 4 * 1000 * 1000)
			throw new ServerUtils.WLProtocolException(
			    "Filesize " + size + " exceeds the limit of 4 MB. "
			    + "If you really need to submit such a large image, "
			    + "please contact the Widelands Development Team.");
		ServerUtils.semaphoreRW(cmd[1], () -> {
			File tempDir = Files.createTempDirectory(null).toFile();

			try {
				File file = new File(tempDir, "image");
				PrintStream stream = new PrintStream(file);
				for (long l = 0; l < size; ++l) {
					int b = in.read();
					if (b < 0) {
						stream.close();
						throw new ServerUtils.WLProtocolException(
						    "Stream ended unexpectedly while reading file");
					}
					stream.write(b);
				}
				stream.close();
				String checksum = Utils.checksum(file);
				if (!checksum.equals(cmd[3]))
					throw new ServerUtils.WLProtocolException("Checksum mismatch: expected " +
					                                          cmd[3] + ", found " + checksum);
				ServerUtils.checkEndOfStream(in);

				String mimetype = Utils.bashOutput("mimetype", "-M", "-b", file.getPath());
				String extension;
				switch (mimetype) {
					case "image/png":
						extension = ".png";
						break;
					case "image/jpeg":
						extension = ".jpg";
						break;
					default:
						throw new ServerUtils.WLProtocolException(
						    "Illegal image type '" + mimetype + "' (only PNG and JPG are allowed)");
				}

				String filename;
				for (long i = System.currentTimeMillis();; ++i) {
					filename = "image" + i + extension;
					if (!new File("screenshots/" + cmd[1], filename).exists()) break;
				}
				File result = new File("screenshots", cmd[1]);
				result.mkdirs();
				result = new File(result, filename);
				file.renameTo(result);
				ServerUtils.doDelete(tempDir);

				String msg = cmd[5];
				for (int w = 0; w < whitespaces; ++w) msg += " " + cmd[6 + w];

				File descriptionsFile = new File("screenshots/" + cmd[1], "descriptions");
				Utils.Profile profile = Utils.readProfile(descriptionsFile, cmd[1]);
				profile.getSection("").contents.put(
				    filename, new Utils.Value(filename, msg, cmd[1]));
				Utils.editProfile(descriptionsFile, profile);

				Utils.sendEMailToSubscribedAdmins(
				    Utils.kEMailVerbosityFYI, "Add-On Screenshot Uploaded",
				    "A new screenshot has been uploaded for the add-on " + cmd[1] + " by " +
				        username + ".\n\nDescription: " + msg);

				out.println("ENDOFSTREAM");
			} catch (Exception e) {
				ServerUtils.doDelete(tempDir);
				throw e;
			}
		});
	}

	/**
	 * Handle a CMD_SUBMIT command.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void handleCmdSubmit() throws Exception {
		// Args: name
		checkCommandVersion(2);
		ServerUtils.checkNrArgs(cmd, 1);
		if (username.isEmpty())
			throw new ServerUtils.WLProtocolException("You need to log in to submit add-ons");
		cmd[1] = ServerUtils.sanitizeName(cmd[1], false);
		// No need here to check if the add-on exists.

		ServerUtils.semaphoreRW(cmd[1], () -> {
			if (!admin && !Utils.isUploader(cmd[1], userDatabaseID))
				throw new ServerUtils.WLProtocolException(
				    "You can not overwrite another person's existing add-on");

			final long timestamp = System.currentTimeMillis() / 1000;
			File tempDir = Files.createTempDirectory(null).toFile();

			try {
				if (commandVersion == 1) {
					doHandleCmdSubmit_V1(tempDir);
				} else {
					doHandleCmdSubmit_New(tempDir);
				}

				File addOnDir = new File("addons", cmd[1]);
				File addOnMain = new File(addOnDir, "addon");

				File newAddOnMain = new File(tempDir, "addon");
				Utils.Profile newProfile = Utils.readProfile(newAddOnMain, cmd[1]);
				boolean isUpdate = false;
				String oldVersionString = null, diff = null;
				int oldSecurity = -1, oldQuality = -1;
				if (addOnDir.isDirectory()) {
					isUpdate = true;
					oldVersionString =
					    doHandleCmdSubmit_CheckUpdateIsValid(addOnMain, newAddOnMain);

					diff =
					    Utils.bashOutput("diff", "-r", "-u", addOnDir.getPath(), tempDir.getPath());

					ResultSet sql =
					    Utils.sql(Utils.Databases.kAddOns,
					              "select id,security,quality from addons where name=?", cmd[1]);
					sql.next();
					oldSecurity = sql.getInt("security");
					oldQuality = sql.getInt("quality");
					Utils.sql(
					    Utils.Databases.kAddOns,
					    "update addons set security=0, quality=0, edit_timestamp=? where id=?",
					    timestamp, sql.getLong("id"));

					ServerUtils.doDelete(addOnDir);
				} else {
					Utils.sql(
					    Utils.Databases.kAddOns,
					    "insert into addons (name,timestamp,edit_timestamp,i18n_version,security,quality,downloads) value(?,?,?,0,0,0,0)",
					    cmd[1], timestamp, timestamp);
					Utils.sql(Utils.Databases.kAddOns,
					          "insert into uploaders (addon,user) value(?,?)",
					          Utils.getAddOnID(cmd[1]), userDatabaseID);
				}

				for (Long user : ServerUtils.getNotificationSubscribers("new", null)) {
					ResultSet sql = Utils.sql(
					    Utils.Databases.kWebsite, "select email from auth_user where id=?", user);
					sql.next();
					Utils.sendEMail(
					    sql.getString("email"),
					    (isUpdate ? "Add-On Updated" : "New Add-On Uploaded"),
					    (isUpdate ? ("An add-on has been updated by " + username) :
                                    ("A new add-on has been submitted by " + username)) +
					        ":\n\n"
					        + "Name: " + newProfile.get("name").value + "\n"
					        + "Description: " + newProfile.get("description").value + "\n"
					        + "Category: " + newProfile.get("category").value + "\n"
					        + "Version: " + newProfile.get("version").value,
					    true);
				}

				Utils.sendEMailToSubscribedAdmins(
				    Utils.kEMailVerbosityFYI, (isUpdate ? "Add-On Updated" : "New Add-On Uploaded"),
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
				        (newProfile.get("sync_safe") != null ?
                             ("\n- **Sync-safe: " + newProfile.get("sync_safe").value + "**") :
                             ("\n- Sync-safe: N/A")) +
				        "\n- Min WL version: " +
				        (newProfile.get("min_wl_version") != null ?
                             newProfile.get("min_wl_version").value :
                             "N/A") +
				        "\n- Max WL version: " +
				        (newProfile.get("max_wl_version") != null ?
                             newProfile.get("max_wl_version").value :
                             "N/A") +
				        "\n- Requires: " +
				        (newProfile.get("requires").value.isEmpty() ?
                             "N/A" :
                             newProfile.get("requires").value) +
				        (isUpdate ? ("\n- Old security: " + oldSecurity +
				                     "\n- Old quality: " + oldQuality) :
                                    "") +
				        "\n\nPlease review this add-on soonish." +
				        (isUpdate ? ("\n\n-------------------------\n\n" + diff) : ""));

				ServerUtils.doMove(tempDir, addOnDir);
				out.println("ENDOFSTREAM");
			} catch (Exception e) {
				ServerUtils.doDelete(tempDir);
				throw e;
			}
		});
	}

	// Below are implementation details for features whose protocol significantly differs
	// between command versions. We need to keep support for all older versions around
	// indefinitely, so this section will accumulate a lot of legacy code over time.

	/**
	 * Check that a given attempt to update an add-on is valid.
	 * @param existing The existing add-on config file.
	 * @param updated The new add-on config file.
	 * @return The version of the existing add-on.
	 * @throws Exception If the update is not permitted.
	 */
	private String doHandleCmdSubmit_CheckUpdateIsValid(File existing, File updated)
	    throws Exception {
		Utils.Profile oldProfile = Utils.readProfile(existing, cmd[1]);
		Utils.Profile newProfile = Utils.readProfile(updated, cmd[1]);

		if (!oldProfile.get(Utils.Profile.kGlobalSection, "category")
		         .value.equals(newProfile.get(Utils.Profile.kGlobalSection, "category").value))
			throw new ServerUtils.WLProtocolException(
			    "An add-on with the same name and a different category already exists. "
			    + "Old category is '" + oldProfile.get("category").value + "', new category is '" +
			    newProfile.get("category").value + "'.");

		String oldVersionString = oldProfile.get(Utils.Profile.kGlobalSection, "version").value;
		String[] oldVersion = oldVersionString.split("\\.");
		String[] newVersion =
		    newProfile.get(Utils.Profile.kGlobalSection, "version").value.split("\\.");
		Boolean newer = null;
		for (int i = 0; i < oldVersion.length && i < newVersion.length; ++i) {
			if (!oldVersion[i].equals(newVersion[i])) {
				newer = (Integer.valueOf(oldVersion[i]) < Integer.valueOf(newVersion[i]));
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

		return oldVersionString;
	}

	/**
	 * Handle the CMD_SUBMIT client/server communication at command version 1.
	 * @param tempDir The directory in which to assemble the add-on.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void doHandleCmdSubmit_V1(File tempDir) throws Exception {
		final int nrDirs = Integer.valueOf(ServerUtils.readLine(in));
		if (nrDirs < 0 || nrDirs > 1000)
			throw new ServerUtils.WLProtocolException(
			    "Directory count limit of 1000 exceeded. "
			    + "If you really want to submit such a large add-on, "
			    + "please contact the Widelands Development Team.");
		File[] dirnames = new File[nrDirs];
		for (int i = 0; i < nrDirs; ++i) {
			String n = ServerUtils.readLine(in);
			n = ServerUtils.sanitizeName(n, true);
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
				String filename = ServerUtils.readLine(in);
				filename = ServerUtils.sanitizeName(filename, false);
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
					if (b < 0) {
						stream.close();
						throw new ServerUtils.WLProtocolException(
						    "Stream ended unexpectedly while reading file");
					}
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
	}

	/**
	 * Helper for doHandleCmdSubmit_New().
	 * Abstract representation of a filename in a directory plus a file checksum.
	 */
	private static class AbstractFile {
		public final String directory;
		public final String name;
		public final String checksum;
		public final long size;
		public AbstractFile(String d, String n, String c, long s) {
			directory = d;
			name = n;
			checksum = c;
			size = s;
		}
	}

	/**
	 * Helper for doHandleCmdSubmit_New().
	 * Create all AbstractFile infos for the files under a directory.
	 * @param existingChecksums Map to which the files will be added.
	 * @param dir Directory to traverse.
	 */
	private static void recursivelyFindExistingChecksums(Map<String, File> existingChecksums,
	                                                     File dir) {
		for (File f : dir.listFiles()) {
			if (f.isDirectory()) {
				recursivelyFindExistingChecksums(existingChecksums, f);
			} else {
				existingChecksums.put(Utils.checksum(f), f);
			}
		}
	}

	/**
	 * Handle the CMD_SUBMIT client/server communication at command versions newer than 1.
	 * @param tempDir The directory in which to assemble the add-on.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	private void doHandleCmdSubmit_New(File tempDir) throws Exception {
		// Phase 1: The client tells us what he wants to send.

		final int nrDirs = Integer.valueOf(ServerUtils.readLine(in));
		if (nrDirs < 0 || nrDirs > 1000)
			throw new ServerUtils.WLProtocolException(
			    "Directory count limit of 1000 exceeded. "
			    + "If you really want to submit such a large add-on, "
			    + "please contact the Widelands Development Team.");

		Set<AbstractFile> abstractFiles = new HashSet<>();

		long totalSize = 0;
		for (int i = 0; i < nrDirs; ++i) {
			String dirname = ServerUtils.readLine(in);
			dirname = ServerUtils.sanitizeName(dirname, true);

			final int nrFiles = Integer.valueOf(ServerUtils.readLine(in));
			if (nrFiles < 0 || nrFiles > 1000)
				throw new ServerUtils.WLProtocolException(
				    "File count limit of 1000 exceeded. "
				    + "If you really want to submit such a large add-on, "
				    + "please contact the Widelands Development Team.");

			for (int j = 0; j < nrFiles; ++j) {
				String filename = ServerUtils.readLine(in);
				filename = ServerUtils.sanitizeName(filename, false);
				final String checksum = ServerUtils.readLine(in);

				final long size = Long.valueOf(ServerUtils.readLine(in));
				totalSize += size;
				if (totalSize < 0 || totalSize > 200 * 1000 * 1000)
					throw new ServerUtils.WLProtocolException(
					    "Filesize limit of 200 MB exceeded. "
					    + "If you really want to submit such a large add-on, "
					    + "please contact the Widelands Development Team.");

				abstractFiles.add(new AbstractFile(dirname, filename, checksum, size));
			}
		}

		ServerUtils.checkEndOfStream(in);

		if (abstractFiles.isEmpty())
			throw new ServerUtils.WLProtocolException("Your add-on contains no files");

		// Phase 2: We check which checksums we already have and which ones we need.

		File addOnDir = new File("addons", cmd[1]);
		File addOnMain = new File(addOnDir, "addon");

		Map<String, File> existingChecksums = new HashMap<>();
		if (addOnDir.exists()) {
			recursivelyFindExistingChecksums(existingChecksums, addOnDir);
		}

		AbstractFile mainFile = null;
		Set<String> missingChecksums = new HashSet<>();
		ArrayList<AbstractFile> filesToRequest = new ArrayList<>();
		for (AbstractFile f : abstractFiles) {
			if (f.directory.isEmpty() && f.name.equals("addon")) mainFile = f;
			if (!existingChecksums.containsKey(f.checksum) &&
			    !missingChecksums.contains(f.checksum)) {
				missingChecksums.add(f.checksum);
				filesToRequest.add(f);
			}
		}

		if (mainFile == null)
			throw new ServerUtils.WLProtocolException("Your add-on contains no `addon` file");
		if (addOnMain.exists()) {
			if (Utils.checksum(addOnMain).equals(mainFile.checksum))
				throw new ServerUtils.WLProtocolException("You forgot to update the `addon` file");
			if (existingChecksums.containsKey(mainFile.checksum))
				doHandleCmdSubmit_CheckUpdateIsValid(
				    addOnMain, existingChecksums.get(mainFile.checksum));
		}

		if (missingChecksums.contains(mainFile.checksum)) {
			// The main file should be sent first so that we can check its integrity early
			filesToRequest.remove(mainFile);
			filesToRequest.add(0, mainFile);
		}

		out.println(filesToRequest.size());
		for (AbstractFile f : filesToRequest) {
			out.println(f.directory);
			out.println(f.name);
		}
		out.println("ENDOFSTREAM");

		// Phase 3: Receive missing files and build the directory tree

		for (AbstractFile f : filesToRequest) {
			File output = Files.createTempFile(null, null).toFile();

			PrintStream stream = new PrintStream(output);
			for (long l = 0; l < f.size; ++l) {
				int b = in.read();
				if (b < 0) {
					stream.close();
					throw new ServerUtils.WLProtocolException(
					    "Stream ended unexpectedly while reading file");
				}
				stream.write(b);
			}
			stream.close();
			String c = Utils.checksum(output);
			if (!f.checksum.equals(c))
				throw new ServerUtils.WLProtocolException("Checksum mismatch for " + f.directory +
				                                          "/" + f.name + ": expected " +
				                                          f.checksum + ", found " + c);

			// Automatically shrink PNGs during uploading to speed up subsequent downloads
			if (f.name.endsWith(".png")) {
				File optimized = Files.createTempFile(null, null).toFile();
				if (Utils.bash("bash", "-c",
				               "pngquant 256 < '" + output.getAbsolutePath() + "' > '" +
				                   optimized.getAbsolutePath() + "'") == 0 &&
				    optimized.length() < output.length()) {
					output = optimized;
				}
			}

			if (f == mainFile && addOnMain.exists())
				doHandleCmdSubmit_CheckUpdateIsValid(addOnMain, output);

			existingChecksums.put(f.checksum, output);
		}

		ServerUtils.checkEndOfStream(in);

		for (AbstractFile f : abstractFiles) {
			File file = new File(tempDir, f.directory);
			file.mkdirs();
			Files.copy(existingChecksums.get(f.checksum).toPath(), new File(file, f.name).toPath());
		}
	}
}
