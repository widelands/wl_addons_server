/*
 * Copyright (C) 2021-2025 by the Widelands Development Team
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

import java.io.InputStream;
import java.io.PrintStream;
import java.net.Socket;
import java.util.Base64;
import java.util.HashSet;
import java.util.Set;
import wl.utils.Utils;

/**
 * A thread that handles all the server's interaction with one specific client.
 *
 * <p>
 *
 * Blacklist/whitelist documentation.
 * Users can be blacklisted to forbid them from performing a specific action,
 * or whitelisted to give them extra privileges.
 * Supported blacklist/whitelist keys are:
 * <ul>
 * <li> "deny_login" – Forbid the user from logging in to the server.
 * <li> "deny_comment" – Forbid the user from writing or editing comments.
 * <li> "deny_upload_addon" – Forbid the user from uploading add-ons.
 * <li> "deny_upload_screenshot" – Forbid the user from uploading screenshots.
 * <li> "trust_upgrade" – Do not reset verification and quality ratings on upgrades.
 * <li> "trust_new" – Immediately mark new add-ons as verified.
 * </ul>
 */
public class ClientThread implements Runnable {
	private Socket socket;

	/** The oldest protocol version the server supports. */
	// Never, ever change this!
	public static final int kOldestSupportedProtocolVersion = 4;

	/** The newest protocol version the server supports. */
	// May be increased but never decreased.
	public static final int kNewestSupportedProtocolVersion = 8;

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
		final long timeOfConnection = System.currentTimeMillis();
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
			if (protocolVersion < kOldestSupportedProtocolVersion ||
			    protocolVersion > kNewestSupportedProtocolVersion) {
				throw new ServerUtils.WLProtocolException(
				    "Unsupported version '" + protocolVersion + "' (supported versions are " +
				    kOldestSupportedProtocolVersion + "-" + kNewestSupportedProtocolVersion + ")");
			}
			final String locale = ServerUtils.readLine(in);
			Utils.log("Locale: " + locale);
			final String username = ServerUtils.readLine(in);
			Utils.log("Username: " + username);
			final String widelandsVersion = (protocolVersion < 5) ? null : ServerUtils.readLine(in);
			if (widelandsVersion != null) Utils.log("Widelands: " + widelandsVersion);
			ServerUtils.checkEndOfStream(in);

			boolean admin = false;
			Set<String> blackWhiteList = new HashSet<>();

			if (protocolVersion >= 7) {
				out.println(Utils.config("name"));
			}
			if (protocolVersion >= 8) {
				out.println(TransifexIntegration.TX.getWebsiteMapTranslationsVersion());
			}

			if (username.isEmpty()) {
				out.println("ENDOFSTREAM");
			} else {
				Utils.QueryResult sql =
				    Utils.sqlQuery(Utils.Databases.kWebsite,
				                   "select id,is_active from auth_user where username=?", username);
				if (!sql.rs.next())
					throw new ServerUtils.WLProtocolException("User " + username +
					                                          " is not registered");
				if (sql.rs.getShort("is_active") == 0)
					throw new ServerUtils.WLProtocolException("Access denied for banned user " +
					                                          username);
				userDatabaseID = sql.rs.getLong("id");
				sql.close();

				sql = Utils.sqlQuery(Utils.Databases.kWebsite,
				                     "select deleted from wlprofile_profile where user_id=?",
				                     userDatabaseID);
				if (!sql.rs.next())
					throw new ServerUtils.WLProtocolException("User " + username +
					                                          " does not have a valid profile");
				if (sql.rs.getShort("deleted") > 0)
					throw new ServerUtils.WLProtocolException("Access denied for deleted user " +
					                                          username);
				sql.close();

				sql = Utils.sqlQuery(Utils.Databases.kAddOns,
				                     "select action,value from blackwhitelist where id=?",
				                     userDatabaseID);
				while (sql.rs.next()) {
					if (sql.rs.getShort("value") > 0) {
						String str = sql.rs.getString("action");
						if (str.equals("deny_login")) {
							throw new ServerUtils.WLProtocolException(
							    "Access denied for blocked user " + username);
						}
						blackWhiteList.add(str);
					}
				}
				sql.close();

				sql =
				    Utils.sqlQuery(Utils.Databases.kWebsite,
				                   "select permissions,password from wlggz_ggzauth where user_id=?",
				                   userDatabaseID);
				if (!sql.rs.next())
					throw new ServerUtils.WLProtocolException(
					    "User " + username + " did not set an online gaming password");
				final long permissions = sql.rs.getLong("permissions");
				if (permissions != 7 && permissions != 127)
					throw new ServerUtils.WLProtocolException(
					    "User " + username + " has invalid permissions code " + permissions);
				admin = (permissions == 127);
				String passwordHash = "";
				for (byte b : Base64.getDecoder().decode(sql.rs.getString("password"))) {
					passwordHash = String.format("%s%02x", passwordHash, b);
				}

				sql.close();

				ServerUtils.passwordAuthentification(in, out, passwordHash);
				out.println(admin ? "ADMIN" : "SUCCESS");
			}

			didLogInSuccessfully = true;
			MuninStatistics.MUNIN.registerLogin(userDatabaseID);
			HandleCommand handler =
			    new HandleCommand(out, in, protocolVersion, widelandsVersion, username,
			                      userDatabaseID, admin, blackWhiteList, locale);
			String cmd;
			while ((cmd = ServerUtils.readLine(in, false)) != null) {
				ThreadActivityAndGitHubSyncManager.SYNCER.tick(socket);
				Utils.log("Received command: " + cmd);
				handler.handle(cmd.split(" "));
			}
		} catch (Exception e) {
			Utils.log("ERROR: " + e);
			e.printStackTrace();
			if (out != null) out.println(e);
		} finally {
			Utils.log("Connection quit.");
			if (!hideFromStats) {
				if (!didLogInSuccessfully) MuninStatistics.MUNIN.registerFailedLogin();
				MuninStatistics.MUNIN.registerClientLifetime(System.currentTimeMillis() -
				                                             timeOfConnection);
			}
			if (out != null) out.close();
			ThreadActivityAndGitHubSyncManager.SYNCER.threadClosed();
		}
	}
}
