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

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.Socket;
import java.util.HashMap;

import wl.utils.UpdateList;
import wl.utils.Utils;

/**
 * Class to manage frequent automated GitHub syncs
 * as well as force-terminating stalled client threads.
 */
class ThreadActivityAndGitHubSyncManager {

	/**
	 * The singleton instance of this class.
	 */
	public static final ThreadActivityAndGitHubSyncManager SYNCER =
	    new ThreadActivityAndGitHubSyncManager();

	private ThreadActivityAndGitHubSyncManager() {}

	/**
	 * Perform a full GitHub sync.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	public synchronized void sync() throws Exception {
		if (!Boolean.parseBoolean(Utils.config("deploy"))) {
			Utils.log("Test environment sync skipped");
			return;
		}

		Utils.bash("bash", "-c", "git stash clear");
		if (Utils.bash("bash", "-c", "git pull origin master") != 0) {
			Utils.bash("bash", "-c", "git add .");
			Utils.bash("bash", "-c", "git stash");
			Utils.bash("bash", "-c", "git pull origin master");
			Utils.bash("bash", "-c", "git stash apply");
			Utils.bash("bash", "-c", "git status");
			Process p = Runtime.getRuntime().exec(new String[] {"bash", "-c", "git status -s"});
			BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String str = b.readLine();
			if (str != null) throw new Exception("Detected merge conflicts: " + str);
		}
		UpdateList.rebuildLists();
		Utils.bash("bash", "-c", "git add .");
		Utils.bash("bash", "-c", "git commit -m 'Automated server sync'");
		Utils.bash("bash", "-c",
		           "git push https://" + Utils.config("githubusername") + ":" +
		               Utils.config("githubtoken") +
		               "@github.com/widelands/wl_addons_server.git master");
		Utils.bash("bash", "-c", "git stash clear");
	}

	private static class Data {
		public long lastActivityTime;
		public Socket socket;
		public Data(Socket s) {
			socket = s;
			lastActivityTime = System.currentTimeMillis();
		}
	}

	private final HashMap<Thread, Data> _allActiveClientThreads = new HashMap<>();

	/**
	 * Register that the current client thread is still active.
	 * @param s The client thread's socket.
	 */
	public synchronized void tick(Socket s) {
		_allActiveClientThreads.put(Thread.currentThread(), new Data(s));
	}

	/**
	 * Register that the current client thread has terminated.
	 */
	public synchronized void threadClosed() {
		_allActiveClientThreads.remove(Thread.currentThread());
	}

	/**
	 * Force-close all threads that have been inactive for a long time.
	 * @throws Exception If anything at all goes wrong, throw an %Exception.
	 */
	public synchronized void check() throws Exception {
		final long time = System.currentTimeMillis();
		HashMap<Thread, Long> kill = new HashMap<>();
		for (Thread t : _allActiveClientThreads.keySet()) {
			long d = time - _allActiveClientThreads.get(t).lastActivityTime;
			if (d > 12 * 60 * 60 * 1000) {
				kill.put(t, d);
			}
		}
		for (Thread t : kill.keySet()) {
			Utils.log("Force-closing socket for [" + t.getName() + "] (last activity was " +
			          Utils.durationString(kill.get(t)) + " ago).");
			Socket s = _allActiveClientThreads.remove(t).socket;
			s.close();
		}
	}
}
