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
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.*;
import wl.utils.*;

class ClientThread implements Runnable {
	private Socket socket;
	private Connection database;

	public ClientThread(Socket s, Connection db) {
		socket = s;
		database = db;
	}

	@Override
	public void run() {
		synchronized (ServerUtils.SYNCER) { ServerUtils.SYNCER.tick(socket); }
		PrintStream out = null;
		try {
			ServerUtils.log("Connection received from " + socket.getInetAddress() + " : " +
			                socket.getPort() + " on " + socket.getLocalSocketAddress() + " (" +
			                socket.getLocalAddress() + " : " + socket.getLocalPort() + ").");
			out = new PrintStream(socket.getOutputStream(), true);
			InputStream in = socket.getInputStream();

			final int protocolVersion = Integer.valueOf(ServerUtils.readLine(in));
			ServerUtils.log("Version: " + protocolVersion);
			if (protocolVersion != 4) {
				throw new ServerUtils.WLProtocolException("Unsupported version '" +
				                                          protocolVersion +
				                                          "' (only supported version is '4')");
			}
			final String locale = ServerUtils.readLine(in);
			ServerUtils.log("Locale: " + locale);
			final String username = ServerUtils.readLine(in);
			ServerUtils.log("Username: " + username);
			if (!ServerUtils.readLine(in).equals("ENDOFSTREAM")) {
				throw new ServerUtils.WLProtocolException("Stream continues past its end");
			}
			boolean admin = false;
			if (username.isEmpty()) {
				out.println("ENDOFSTREAM");
			} else {
				final long r = ServerUtils.RANDOM.nextLong();
				out.println(r);
				out.println("ENDOFSTREAM");

				ResultSet sql = database.createStatement().executeQuery(
				    "select id from auth_user where username='" + username + "'");
				if (!sql.next())
					throw new ServerUtils.WLProtocolException("User " + username +
					                                          " is not registered");
				final long userID = sql.getLong​(1);

				sql = database.createStatement().executeQuery(
				    "select permissions from wlggz_ggzauth where user_id=" + userID);
				if (!sql.next())
					throw new ServerUtils.WLProtocolException("User " + username +
					                                          " has no permissions at all");
				final long permissions = sql.getLong(1);
				if (permissions != 7 && permissions != 127)
					throw new ServerUtils.WLProtocolException(
					    "User " + username + " has invalid permissions code " + permissions);
				admin = (permissions == 127);

				sql = database.createStatement().executeQuery(
				    "select password from wlggz_ggzauth where user_id=" + userID);
				if (!sql.next())
					throw new ServerUtils.WLProtocolException("User " + username +
					                                          " did not set a password");
				String passwordHash = "";
				for (byte b : Base64.getDecoder().decode(sql.getString(1)))
					passwordHash = String.format("%s%02x", passwordHash, b);

				Process p = Runtime.getRuntime().exec(new String[] {"md5sum"});
				PrintWriter md5 = new PrintWriter(p.getOutputStream());
				md5.println(passwordHash);
				md5.println(r);
				md5.close();
				final String expected =
				    new BufferedReader(new InputStreamReader(p.getInputStream()))
				        .readLine()
				        .split(" ")[0];

				final String password = ServerUtils.readLine(in);
				if (!ServerUtils.readLine(in).equals("ENDOFSTREAM")) {
					throw new ServerUtils.WLProtocolException("Stream continues past its end");
				}
				if (!password.equals(expected)) {
					throw new ServerUtils.WLProtocolException("Wrong username or password");
				}

				out.println(admin ? "ADMIN" : "SUCCESS");
			}

			String cmd;
			while ((cmd = ServerUtils.readLine(in, false)) != null) {
				synchronized (ServerUtils.SYNCER) {
					ServerUtils.SYNCER.tick(socket);
					ServerUtils.log("Received command: " + cmd);
				}
				Server.handle(cmd.split(" "), out, in, protocolVersion, username, admin, locale);
			}
		} catch (Exception e) {
			ServerUtils.log("ERROR: " + e);
			if (out != null) out.println(e);
		}
		ServerUtils.log("Connection quit.");
		if (out != null) out.close();
	}
}
