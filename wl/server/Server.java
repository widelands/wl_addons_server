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

import java.net.ServerSocket;
import java.net.Socket;
import wl.utils.Utils;

/**
 * Main class that initializes all server processes
 * and then keeps receiving client requests and creating threads to serve them.
 */
public class Server {
	private Server() {}

	/**
	 * The server's main loop. This runs forever until the server is killed
	 * with <kbd>^C</kbd> or <code>kill PID</code>.
	 * @param args Ignored.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void main(String[] args) throws Exception {
		Utils.bash(
		    "bash", "-c", "echo PID: $PPID");  // Print our PID to the logfile so the maintainer
		                                       // knows how to kill the server process.

		Utils.initDatabases();

		Utils.log("Server starting...");
		ServerSocket serverSocket = new ServerSocket(Integer.valueOf(Utils.config("port")));
		new Thread(SyncThread.INSTANCE, "Syncer").start();
		Utils.log("Ready.");
		long n = 0;
		while (true) {
			Socket s = serverSocket.accept();
			new Thread(new ClientThread(s), String.format("Client#%06d", ++n)).start();
		}
	}
}
