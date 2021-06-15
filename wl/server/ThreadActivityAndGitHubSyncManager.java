package wl.server;

import java.io.*;
import java.net.*;
import java.util.*;
import wl.utils.*;

class ThreadActivityAndGitHubSyncManager {
	public synchronized void sync() throws Exception {
		Utils.bash("bash", "-c", "git stash clear");
		if (Utils.bash("bash", "-c", "git pull origin master") != 0) {
			Utils.bash("bash", "-c", "git stash");
			Utils.bash("bash", "-c", "git pull origin master");
			Utils.bash("bash", "-c", "git stash apply");
			Utils.bash("bash", "-c", "git status");
			Process p = Runtime.getRuntime().exec(new String[]{ "bash", "-c", "git status -s" });
			BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String str;
			while ((str = b.readLine()) != null) {
				String file = str.substring(3);
				System.out.println("Detected merge conflict in file: " + file);
				if (file.startsWith("list")) {
					System.out.println("    Skipping (will be newly generated later).");
				} else if (!file.startsWith("metadata/")) {
					System.out.println("    Attempting to resolve the merge conflicts automatically...");
					Utils.resolveMergeConflicts(new File(file));
				} else {
					throw new Exception("Unable to resolve merge conflict in " + file);
				}
			}
		}
		UpdateList.main();
		Utils.bash("bash", "-c", "git add .");
		Utils.bash("bash", "-c", "git commit -m 'Automated server sync'");
		Utils.bash("bash", "-c", "git push https://" +
				Utils.config("githubusername") + ":" + Utils.config("githubtoken") +
				"@github.com/widelands/wl_addons_server.git master");
		Utils.bash("bash", "-c", "git stash clear");
	}

	public static class Data {
		long lastActivity;
		Socket socket;
		Data(Socket s) {
			socket = s;
			lastActivity = System.currentTimeMillis();
		}
	}
	private final HashMap<Thread, Data> lastActivity = new HashMap<>();
	public synchronized void tick(Socket s) {
		lastActivity.put(Thread.currentThread(), new Data(s));
	}
	public synchronized void check() throws Exception {
		final long time = System.currentTimeMillis();
		HashMap<Thread, Long> kill = new HashMap<>();
		for (Thread t : lastActivity.keySet()) {
			long d = time - lastActivity.get(t).lastActivity;
			if (d > 12 * 60 * 60 * 1000) {
				kill.put(t, d);
			}
		}
		for (Thread t : kill.keySet()) {
			System.out.println("Force-closing socket for [" + Thread.currentThread().getName() + "] at " + new Date() + " (last activity was " +
					Utils.durationString(kill.get(t)) + " ago).");
			Socket s = lastActivity.remove(t).socket;
			s.close();
		}
	}
}
