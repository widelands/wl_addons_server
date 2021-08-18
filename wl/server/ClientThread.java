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
 * A thread that handles all the server's interaction with one specific client.
 */
class ClientThread implements Runnable {
	private Socket socket;

	/**
	 * Constructor.
	 * @param s The socket via which we're connected to the client.
	 */
	public ClientThread(Socket s) { socket = s; }

	/**
	 * Main method of a client thread.
	 */
	@Override
	public void run() {
		ThreadActivityAndGitHubSyncManager.SYNCER.tick(socket);
		PrintStream out = null;
		long userDatabaseID = -1;
		boolean didLogInSuccessfully = false, hideFromStats = false;
		try {
			Utils.log("Connection received from " + socket.getInetAddress() + " : " +
			          socket.getPort() + " on " + socket.getLocalSocketAddress() + " (" +
			          socket.getLocalAddress() + " : " + socket.getLocalPort() + ").");
			out = new PrintStream(socket.getOutputStream(), true);
			InputStream in = socket.getInputStream();

			final String protocolVersionString = ServerUtils.readLine(in);
			Utils.log("Version: " + protocolVersionString);

			if (protocolVersionString.equals("munin")) {
				hideFromStats = true;
				MuninStatistics.handleMunin(in, out);
				return;
			}

			final int protocolVersion = Integer.valueOf(protocolVersionString);
			if (protocolVersion < 4 || protocolVersion > 5) {
				throw new ServerUtils.WLProtocolException(
				    "Unsupported version '" + protocolVersion + "' (supported versions are 4-5)");
			}
			final String locale = ServerUtils.readLine(in);
			Utils.log("Locale: " + locale);
			final String username = ServerUtils.readLine(in);
			Utils.log("Username: " + username);
			final String widelandsVersion = (protocolVersion < 5) ? null : ServerUtils.readLine(in);
			if (widelandsVersion != null) Utils.log("Widelands: " + widelandsVersion);
			ServerUtils.checkEndOfStream(in);
			boolean admin = false;
			if (username.isEmpty()) {
				out.println("ENDOFSTREAM");
			} else {
				Long uid = Utils.getUserID(username);
				if (uid == null)
					throw new ServerUtils.WLProtocolException("User " + username +
					                                          " is not registered");
				userDatabaseID = uid;

				ResultSet sql =
				    Utils.sqlQuery(Utils.Databases.kWebsite,
				                   "select permissions,password from wlggz_ggzauth where user_id=" +
				                       userDatabaseID);
				if (!sql.next())
					throw new ServerUtils.WLProtocolException(
					    "User " + username + " did not set an online gaming password");
				final long permissions = sql.getLong("permissions");
				if (permissions != 7 && permissions != 127)
					throw new ServerUtils.WLProtocolException(
					    "User " + username + " has invalid permissions code " + permissions);
				admin = (permissions == 127);
				String passwordHash = "";
				for (byte b : Base64.getDecoder().decode(sql.getString("password")))
					passwordHash = String.format("%s%02x", passwordHash, b);

				ServerUtils.passwordAuthentification(in, out, passwordHash);
				out.println(admin ? "ADMIN" : "SUCCESS");
			}

			didLogInSuccessfully = true;
			MuninStatistics.MUNIN.registerLogin(userDatabaseID);
			String cmd;
			while ((cmd = ServerUtils.readLine(in, false)) != null) {
				ThreadActivityAndGitHubSyncManager.SYNCER.tick(socket);
				Utils.log("Received command: " + cmd);
				handle(cmd.split(" "), out, in, protocolVersion, widelandsVersion, username,
				       userDatabaseID, admin, locale);
			}
		} catch (Exception e) {
			Utils.log("ERROR: " + e);
			if (out != null) out.println(e);
		} finally {
			Utils.log("Connection quit.");
			if (!hideFromStats) {
				if (didLogInSuccessfully) {
					MuninStatistics.MUNIN.registerLogout(userDatabaseID);
				} else {
					MuninStatistics.MUNIN.registerFailedLogin();
				}
			}
			if (out != null) out.close();
			ThreadActivityAndGitHubSyncManager.SYNCER.threadClosed();
		}
	}

	/**
	 * Handle a command.
	 * @param cmd The command sent by the client. Parameters are in index 1+.
	 * @param out Stream to send data to the client.
	 * @param in Stream to receive further data from the client.
	 * @param protocolVersion Protocol version the client uses.
	 * @param widelandsVersion Widelands version the client uses (\c null if protocol version is
	 *     less than \c 5).
	 * @param username Name of the user (\c "" for unregistered guests).
	 * @param userDatabaseID ID of the user (only valid for registered users).
	 * @param admin Whether the user is a registered administrator.
	 * @param locale Language the client is speaking.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	private void handle(String[] cmd,
	                    PrintStream out,
	                    InputStream in,
	                    int protocolVersion,
	                    String widelandsVersion,
	                    String username,
	                    long userDatabaseID,
	                    boolean admin,
	                    String locale) throws Exception {
		Command command = Command.valueOf(cmd[0]);
		MuninStatistics.MUNIN.countCommand(command);
		HandleCommand h = new HandleCommand(cmd, out, in, protocolVersion, widelandsVersion,
		                                    username, userDatabaseID, admin, locale);

		switch (command) {
			case CMD_LIST:
				h.handleCmdList();
				break;
			case CMD_INFO:
				h.handleCmdInfo();
				break;
			case CMD_DOWNLOAD:
				h.handleCmdDownload();
				break;
			case CMD_I18N:
				h.handleCmdI18n();
				break;
			case CMD_SCREENSHOT:
				h.handleCmdScreenshot();
				break;
			case CMD_COMMENT:
				h.handleCmdComment();
				break;
			case CMD_EDIT_COMMENT:
				h.handleCmdEditComment();
				break;
			case CMD_VOTE:
				h.handleCmdVote();
				break;
			case CMD_GET_VOTE:
				h.handleCmdGetVote();
				break;
			case CMD_SUBMIT_SCREENSHOT:
				h.handleCmdSubmitScreenshot();
				break;
			case CMD_SUBMIT:
				h.handleCmdSubmit();
				break;
			case CMD_CONTACT:
				h.handleCmdContact();
				break;
			case CMD_SETUP_TX:
				h.handleCmdSetupTx();
				break;
			default:
				throw new ServerUtils.WLProtocolException("Invalid command " + cmd[0]);
		}

		MuninStatistics.MUNIN.registerSuccessfulCommand();
	}
}
