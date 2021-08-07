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

class ClientThread implements Runnable {
	private Socket socket;

	public ClientThread(Socket s) { socket = s; }

	@Override
	public void run() {
		ServerUtils.SYNCER.tick(socket);
		PrintStream out = null;
		long userDatabaseID = -1;
		boolean didLogInSuccessfully = false, hideFromStats = false;
		try {
			ServerUtils.log("Connection received from " + socket.getInetAddress() + " : " +
			                socket.getPort() + " on " + socket.getLocalSocketAddress() + " (" +
			                socket.getLocalAddress() + " : " + socket.getLocalPort() + ").");
			out = new PrintStream(socket.getOutputStream(), true);
			InputStream in = socket.getInputStream();

			final String protocolVersionString = ServerUtils.readLine(in);
			ServerUtils.log("Version: " + protocolVersionString);

			if (protocolVersionString.equals("munin")) {
				hideFromStats = true;
				ServerUtils.handleMunin(in, out);
				return;
			}

			final int protocolVersion = Integer.valueOf(protocolVersionString);
			if (protocolVersion != 4) {
				throw new ServerUtils.WLProtocolException("Unsupported version '" +
				                                          protocolVersion +
				                                          "' (only supported version is '4')");
			}
			final String locale = ServerUtils.readLine(in);
			ServerUtils.log("Locale: " + locale);
			final String username = ServerUtils.readLine(in);
			ServerUtils.log("Username: " + username);
			ServerUtils.checkEndOfStream(in);
			boolean admin = false;
			if (username.isEmpty()) {
				out.println("ENDOFSTREAM");
			} else {
				ResultSet sql = ServerUtils.sqlQuery(
				    ServerUtils.Databases.kWebsite,
				    "select id from auth_user where username='" + username + "'");
				if (!sql.next())
					throw new ServerUtils.WLProtocolException("User " + username +
					                                          " is not registered");
				userDatabaseID = sql.getLong​("id");

				sql = ServerUtils.sqlQuery(
				    ServerUtils.Databases.kWebsite,
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
			ServerUtils.MUNIN.registerLogin(userDatabaseID);
			String cmd;
			while ((cmd = ServerUtils.readLine(in, false)) != null) {
				ServerUtils.SYNCER.tick(socket);
				ServerUtils.log("Received command: " + cmd);
				Server.handle(cmd.split(" "), out, in, protocolVersion, username, userDatabaseID,
				              admin, locale);
			}
		} catch (Exception e) {
			ServerUtils.log("ERROR: " + e);
			if (out != null) out.println(e);
		} finally {
			ServerUtils.log("Connection quit.");
			if (!hideFromStats) {
				if (didLogInSuccessfully) {
					ServerUtils.MUNIN.registerLogout(userDatabaseID);
				} else {
					ServerUtils.MUNIN.registerFailedLogin();
				}
			}
			if (out != null) out.close();
			ServerUtils.SYNCER.threadClosed();
		}
	}
}
