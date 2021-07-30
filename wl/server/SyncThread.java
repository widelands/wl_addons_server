package wl.server;

import java.io.*;
import java.net.*;
import java.util.*;
import wl.utils.*;

class SyncThread implements Runnable {
	@Override
	public void run() {
		boolean errored = false;
		do try {
				Calendar nextSync = Calendar.getInstance();
				nextSync.set(Calendar.HOUR_OF_DAY, 3);
				nextSync.set(Calendar.MINUTE, 0);
				nextSync.set(Calendar.SECOND, 0);
				nextSync.set(Calendar.MILLISECOND, 0);
				long now = System.currentTimeMillis();
				long then = nextSync.getTimeInMillis();
				while (then < now + 60000) then += 1000 * 60 * 60 * 24;
				ServerUtils.log("Next GitHub sync scheduled for " + new Date(then) + " (" +
				                Utils.durationString(then - now) + " remaining).");
				Thread.sleep(then - now);
				ServerUtils.log("Waking up for GitHub sync at " + new Date());
				synchronized (ServerUtils.SYNCER) {
					ServerUtils.log("Cleaning up inactive threads at " + new Date());
					ServerUtils.SYNCER.check();
					if (errored)
						throw new Exception("You still have not resolved the merge conflicts. "
						                    + "Please do so soon!");
					ServerUtils.log("Performing GitHub sync at " + new Date());
					Utils._staticprofiles.clear();
					ServerUtils.SYNCER.sync();
				}
			} catch (Exception e) {
				errored = true;
				ServerUtils.log("GitHub sync ERROR: " + e);
				try {
					String str;
					String msg = "@Noordfrees\n\n"
					             + "The automated GitHub sync on the server "
					             + "has failed with the following error message:\n"
					             + "```\n" + e + "\n```\n\n```\n$ git status";
					Process p =
					    Runtime.getRuntime().exec(new String[] {"bash", "-c", "git status"});
					p.waitFor();
					BufferedReader b =
					    new BufferedReader(new InputStreamReader(p.getInputStream()));
					while ((str = b.readLine()) != null) msg += "\n" + str;
					msg += "\n```\n\nThe automated syncs will discontinue until the server "
					       + "has been restarted. Please resolve the merge conflicts quickly."
					       + "  \nThank you :)";

					Utils.bash("bash", "-c", "git status");
					Utils.bash("bash", "-c", "git restore --staged .");
					Utils.bash("bash", "-c", "git checkout .");

					Utils.sendNotificationToGitHubThread(msg);
				} catch (Exception x) {
					Utils.fatalError("unable to send failure notification!", x);
				}
			}
		while (true);
	}
}
