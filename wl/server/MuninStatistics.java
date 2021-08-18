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

public class MuninStatistics {
	public static final MuninStatistics MUNIN = new MuninStatistics();

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
	private final List<Long> currentRegisteredUsers;
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
		currentRegisteredUsers = new ArrayList<>();
		allRegisteredUsers = new HashSet<>();
		cmdInfoToSkip = new HashMap<>();
	}

	public synchronized void printStats(int version, PrintStream out) throws Exception {
		switch (version) {
			case 1: {
				out.println(System.currentTimeMillis() - initTime);
				out.println(currentRegisteredUsers.size());
				out.println(currentUnregisteredUsers);
				out.println(allRegisteredUsers.size());
				out.println(successfulLogins);
				out.println(failedLogins);

				long totalCmd = skippedCommands;
				for (long cmd : commandCounters) {
					totalCmd += cmd;
					out.println(cmd);
				}
				out.println(totalCmd - successfulCommands);

				break;
			}
			default:
				throw new ServerUtils.WLProtocolException("Wrong version " + version);
		}
	}

	public synchronized void skipNextCmdInfo(long n) {
		if (n > 0) cmdInfoToSkip.put(Thread.currentThread(), n);
	}
	public synchronized void countCommand(Command cmd) {
		final Thread t = Thread.currentThread();
		if (cmdInfoToSkip.containsKey(t)) {
			long n = cmdInfoToSkip.get(t);
			if (cmd == Command.CMD_INFO) {
				if (n > 0) {
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
	public synchronized void registerSuccessfulCommand() { successfulCommands++; }
	public synchronized void registerLogin(long user) {
		successfulLogins++;
		if (user < 0) {
			currentUnregisteredUsers++;
		} else {
			currentRegisteredUsers.add(user);
			allRegisteredUsers.add(user);
		}
	}
	public synchronized void registerLogout(Long user) {
		if (user < 0) {
			currentUnregisteredUsers--;
		} else {
			currentRegisteredUsers.remove((Object)user);
		}
	}
	public synchronized void registerFailedLogin() { failedLogins++; }
}
