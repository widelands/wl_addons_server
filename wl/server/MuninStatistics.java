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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import wl.utils.Utils;

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
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void handleMunin(InputStream in, PrintStream out) throws Exception {
		final int version = Integer.valueOf(ServerUtils.readLine(in));
		if (version != 2)
			throw new ServerUtils.WLProtocolException("Unsupported munin version '" + version +
			                                          "' (only supported version is '2')");
		Utils.log("Munin version: " + version);
		ServerUtils.checkEndOfStream(in);

		ServerUtils.passwordAuthentification(in, out, Utils.config("muninpassword"));
		MUNIN.printStats(version, out);
		out.println("ENDOFSTREAM");
	}

	private final long[] commandCounters;
	private final long initTime;
	private long registeredUsers, unregisteredUsers, failedLogins, skippedCommands,
	    successfulCommands;
	private final List<Long> clientLifetimes;
	private final Set<Long> allRegisteredUsers;
	private final Map<Thread, Long> cmdInfoToSkip;

	private MuninStatistics() {
		initTime = System.currentTimeMillis();
		commandCounters = new long[Command.values().length];
		for (int i = 0; i < commandCounters.length; i++) commandCounters[i] = 0;

		registeredUsers = 0;
		unregisteredUsers = 0;
		failedLogins = 0;
		skippedCommands = 0;
		successfulCommands = 0;
		clientLifetimes = new ArrayList<>();
		allRegisteredUsers = new HashSet<>();
		cmdInfoToSkip = new HashMap<>();
	}

	/**
	 * Print all current statistics.
	 * @param version Munin protocol version.
	 * @param out The stream to print data to.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public synchronized void printStats(int version, PrintStream out) throws Exception {
		out.println((System.currentTimeMillis() - initTime) / (1000.0 * 60 * 60));
		out.println(clientLifetimes.stream().mapToDouble(a -> a).average().orElse(0) / 1000);
		out.println(Runtime.getRuntime().totalMemory() / 1000000);

		out.println(registeredUsers);
		out.println(unregisteredUsers);
		out.println(allRegisteredUsers.size());
		out.println(failedLogins);

		long totalCmd = skippedCommands;
		for (long cmd : commandCounters) {
			totalCmd += cmd;
			out.println(cmd);
		}
		out.println(totalCmd - successfulCommands);
	}

	/**
	 * Inform Munin not to record the next <var>n</var> <code>CMD_INFO</code> commands in the
	 * statistics. <p> Each thread has its own skip counter. Registering a command other than
	 * <code>CMD_INFO</code> resets the thread's skip counter.
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
	 * @param user ID of the user (-1 for unregistered users).
	 */
	public synchronized void registerLogin(long user) {
		if (user < 0) {
			unregisteredUsers++;
		} else {
			registeredUsers++;
			allRegisteredUsers.add(user);
		}
	}

	/**
	 * Inform Munin that a user has unsuccessfully attempted to connect.
	 */
	public synchronized void registerFailedLogin() { failedLogins++; }
}
