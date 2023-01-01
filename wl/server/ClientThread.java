/*
 * Copyright (C) 2021-2023 by the Widelands Development Team
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
import java.sql.ResultSet;
import java.util.Base64;
import wl.utils.Utils;

/**
 * A thread that handles all the server's interaction with one specific client.
 */
public class ClientThread implements Runnable {
	private Socket socket;

	/** The oldest protocol version the server supports. */
	// Never, ever change this!
	public static final int kOldestSupportedProtocolVersion = 4;

	/** The newest protocol version the server supports. */
	// May be increased but never decreased.
	public static final int kNewestSupportedProtocolVersion = 7;

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
			if (protocolVersion >= 7) out.println(Utils.config("name"));
			if (username.isEmpty()) {
				out.println("ENDOFSTREAM");
			} else {
				Long uid = Utils.getUserID(username);
				if (uid == null)
					throw new ServerUtils.WLProtocolException("User " + username +
					                                          " is not registered");
				userDatabaseID = uid;

				ResultSet sql =
				    Utils.sql(Utils.Databases.kWebsite,
				              "select permissions,password from wlggz_ggzauth where user_id=?",
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
			HandleCommand handler = new HandleCommand(out, in, protocolVersion, widelandsVersion,
			                                          username, userDatabaseID, admin, locale);
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
