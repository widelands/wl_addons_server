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
import java.util.*;
import wl.utils.*;

/**
 * Class to track statistics about the server.
 */
public class MuninStatistics {

	/**
	 * The singleton instance of this class.
	 */
	public static final MuninStatistics MUNIN = new MuninStatistics();

	/**
	 * Handles all communication with a Munin client.
	 * @param out Stream to send data to the client.
	 * @param in Stream to receive further data from the client.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	public static void handleMunin(InputStream in, PrintStream out) throws Exception {
		final int version = Integer.valueOf(ServerUtils.readLine(in));
		if (version != 1)
			throw new ServerUtils.WLProtocolException("Unsupported munin version '" + version +
			                                          "' (only supported version is '1')");
		Utils.log("Munin version: " + version);
		ServerUtils.checkEndOfStream(in);

		ServerUtils.passwordAuthentification(in, out, Utils.config("muninpassword"));
		MUNIN.printStats(version, out);
		out.println("ENDOFSTREAM");
	}

	private final long[] commandCounters;
	private final long initTime;
	private long currentUnregisteredUsers, failedLogins, successfulLogins, skippedCommands,
	    successfulCommands;
	private final List<Long> currentRegisteredUsers, clientLifetimes;
	private final Set<Long> allRegisteredUsers;
	private final Map<Thread, Long> cmdInfoToSkip;

	private MuninStatistics() {
		initTime = System.currentTimeMillis();
		commandCounters = new long[Command.values().length];
		for (int i = 0; i < commandCounters.length; i++) commandCounters[i] = 0;

		currentUnregisteredUsers = 0;
		failedLogins = 0;
		successfulLogins = 0;
		skippedCommands = 0;
		successfulCommands = 0;
		clientLifetimes = new ArrayList<>();
		currentRegisteredUsers = new ArrayList<>();
		allRegisteredUsers = new HashSet<>();
		cmdInfoToSkip = new HashMap<>();
	}

	/**
	 * Print all current statistics.
	 * @param version Munin protocol version.
	 * @param out The stream to print data to.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	public synchronized void printStats(int version, PrintStream out) throws Exception {
		out.println(System.currentTimeMillis() - initTime);
		if (version > 1) {
			double sum = 0;
			long n = 0;
			for (Long l : clientLifetimes) {
				sum += l;
				n++;
			}
			out.println(n > 0 ? (sum / n) : 0);
		}

		out.println(currentRegisteredUsers.size());
		out.println(currentUnregisteredUsers);
		out.println(allRegisteredUsers.size());
		out.println(successfulLogins);
		out.println(failedLogins);

		long totalCmd = skippedCommands;
		int nrCmdLines =
		    (version > 1 ? commandCounters.length : (Command.CMD_SETUP_TX.ordinal() + 1));
		for (long cmd : commandCounters) {
			totalCmd += cmd;
			if (nrCmdLines > 0) {
				out.println(cmd);
				nrCmdLines--;
			}
		}
		out.println(totalCmd - successfulCommands);
	}

	/**
	 * Inform Munin not to record the next #N #CMD_INFO commands in the statistics.
	 * @param n Number of commands to skip.
	 */
	public synchronized void skipNextCmdInfo(long n) {
		if (n > 0) cmdInfoToSkip.put(Thread.currentThread(), n);
	}

	/**
	 * Inform Munin to record a command.
	 * @param cmd Command to record.
	 */
	public synchronized void countCommand(Command cmd) {
		final Thread t = Thread.currentThread();
		if (cmdInfoToSkip.containsKey(t)) {
			long n = cmdInfoToSkip.get(t);
			if (cmd == Command.CMD_INFO) {
				if (n > 1) {
					cmdInfoToSkip.put(t, n - 1);
				} else {
					cmdInfoToSkip.remove(t);
				}
				skippedCommands++;
				return;
			}
			cmdInfoToSkip.remove(t);
		}
		commandCounters[cmd.ordinal()]++;
	}

	/**
	 * Inform Munin how long a client has been connected in total.
	 * @param ms Client's lifetime in milliseconds.
	 */
	public synchronized void registerClientLifetime(long ms) { clientLifetimes.add(ms); }

	/**
	 * Inform Munin to record that a command terminated successfully.
	 */
	public synchronized void registerSuccessfulCommand() { successfulCommands++; }

	/**
	 * Inform Munin to record a new login.
	 * @param user ID of the user (\c -1 for unregistered users).
	 */
	public synchronized void registerLogin(long user) {
		successfulLogins++;
		if (user < 0) {
			currentUnregisteredUsers++;
		} else {
			currentRegisteredUsers.add(user);
			allRegisteredUsers.add(user);
		}
	}

	/**
	 * Inform Munin that a user has quit the connection.
	 * @param user ID of the user (\c -1 for unregistered users).
	 */
	public synchronized void registerLogout(Long user) {
		if (user < 0) {
			currentUnregisteredUsers--;
		} else {
			currentRegisteredUsers.remove((Object)user);
		}
	}

	/**
	 * Inform Munin that a user has unsuccessfully attempted to connect.
	 */
	public synchronized void registerFailedLogin() { failedLogins++; }
}
