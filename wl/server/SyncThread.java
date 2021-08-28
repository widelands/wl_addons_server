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
import java.util.*;
import wl.utils.*;

/**
 * A thread that handles frequent maintenance tasks.
 */
class SyncThread implements Runnable {

	/**
	 * Main loop of the sync thread.
	 * This runs forever until the server is terminated.
	 */
	@Override
	public void run() {
		// We run a full sync every 24 hours, but in order to prevent SQL connection
		// timeouts we run an arbitrary SQL statement every 6 hours as well.
		boolean errored = false;
		int phase = ((Calendar.getInstance().get(Calendar.HOUR_OF_DAY) + 3) / 6) % 4;
		do {
			try {
				Calendar nextSync = Calendar.getInstance();
				nextSync.set(Calendar.HOUR_OF_DAY, 3 + (phase * 6));
				nextSync.set(Calendar.MINUTE, 0);
				nextSync.set(Calendar.SECOND, 0);
				nextSync.set(Calendar.MILLISECOND, 0);
				long now = System.currentTimeMillis();
				long then = nextSync.getTimeInMillis();
				while (then < now + 60000) then += 1000 * 60 * 60 * 24;
				Utils.log("Next " + (phase == 0 ? "full" : "SQL-only") + " sync scheduled for " +
				          new Date(then) + " (" + Utils.durationString(then - now) +
				          " remaining).");

				Thread.sleep(then - now);

				Utils.log("Waking up for " + (phase == 0 ? "full" : "SQL-only") + " sync.");
				for (Utils.Databases db : Utils.Databases.values()) Utils.sqlCmd(db, "show tables");

				Utils.log("Backing up the database...");
				Runtime.getRuntime().exec(new String[] {
				    "bash", "-c",
				    "mysqldump -u" + Utils.config("databaseuser") + " -p" +
				        Utils.config("databasepassword") + " -h" + Utils.config("databasehost") +
				        " -P" + Utils.config("databaseport") + " --column-statistics=0 " +
				        Utils.config("addonsdatabase") + " > _addons_database_backup_" +
				        Calendar.getInstance().get(Calendar.DAY_OF_WEEK) + "_" + phase + ".sql"});

				if (phase == 0) {
					if (Boolean.parseBoolean(Utils.config("deploy"))) {
						TransifexIntegration.TX.checkIssues();
						TransifexIntegration.TX.fullSync();
					}

					synchronized (ThreadActivityAndGitHubSyncManager.SYNCER) {
						Utils.log("Cleaning up inactive threads...");
						ThreadActivityAndGitHubSyncManager.SYNCER.check();

						if (errored)
							throw new Exception(
							    "You still have not resolved the merge conflicts. Please do so soon!");

						Utils.log("Performing GitHub sync...");
						ThreadActivityAndGitHubSyncManager.SYNCER.sync();
					}
				}
			} catch (Exception e) {
				errored = true;
				Utils.log("GitHub sync ERROR: " + e);
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
			phase++;
			phase %= 4;
		} while (true);
	}
}
