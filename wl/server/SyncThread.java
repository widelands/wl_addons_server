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
import java.io.File;
import java.io.InputStreamReader;
import java.util.Calendar;
import java.util.Date;
import wl.utils.Utils;

/**
 * A thread that handles frequent maintenance tasks.
 */
public class SyncThread implements Runnable {

	/**
	 * The singleton instance of this class.
	 */
	public static final SyncThread INSTANCE = new SyncThread();

	private SyncThread() {}

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
				for (Utils.Databases db : Utils.Databases.values()) Utils.sql(db, "show tables");

				Utils.log("Backing up the database...");
				new File("backup").mkdir();
				Runtime.getRuntime().exec(new String[] {
				    "bash", "-c",
				    "mysqldump -u" + Utils.config("addons_db_user") + " -p" +
				        Utils.config("addons_db_password") + " -h" + Utils.config("databasehost") +
				        " -P" + Utils.config("databaseport") + " --column-statistics=0 " +
				        Utils.config("addons_database") + " > backup/addons_database_backup_" +
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
				e.printStackTrace();

				String msg =
				    "The automated GitHub sync on the server has failed with the following error message:\n"
				    + "```\n" + e + "\n```\n\n```\n$ git status";
				try {
					Process p =
					    Runtime.getRuntime().exec(new String[] {"bash", "-c", "git status"});
					p.waitFor();
					BufferedReader b =
					    new BufferedReader(new InputStreamReader(p.getInputStream()));
					String str;
					while ((str = b.readLine()) != null) msg += "\n" + str;
					msg += "\n```\n\nThe automated syncs will discontinue until the server "
					       + "has been restarted. Please resolve the merge conflicts quickly."
					       + "  \nThank you :)";

					Utils.sendEMailToSubscribedAdmins(
					    Utils.kEMailVerbosityCritical, "Add-Ons Server Sync Error", msg);
				} catch (Exception x) {
					Utils.log("ERROR WHILE SENDING ERROR NOTIFICATION: " + x);
					x.printStackTrace();
					Utils.log("Error message being composed was:\n" + msg);
					Utils.log(
					    "Something has gone seriously wrong here. Killing the server in the hope that the maintainers will hurry to resolve the problems.");
					System.exit(1);
				}
			}
			phase++;
			phase %= 4;
		} while (true);
	}
}
