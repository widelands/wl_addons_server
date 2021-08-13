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
import java.sql.ResultSet;
import java.util.*;
import org.json.simple.parser.*;
import wl.utils.*;

public class TransifexIntegration {
	public static TransifexIntegration TX = new TransifexIntegration();
	private TransifexIntegration() {}

	public synchronized void fullSync() throws Exception {
		pull();
		buildCatalogues();
		push();
	}

	public synchronized void pull() throws Exception {
		ServerUtils.log("Pulling translations from Transifex...");
		Utils.bashOutput("tx", "pull", "-f", "-a");
	}
	public synchronized void push() throws Exception {
		ServerUtils.log("Pushing POT files to Transifex...");
		Utils.bashOutput("tx", "push", "-s");
	}

	public synchronized void buildCatalogues() throws Exception {
		ServerUtils.log("Rebuilding catalogues...");
		Buildcats.buildCatalogues();

		ServerUtils.log("Updating PO and MO files...");
		Utils.bashOutput("rm", "-r", "i18n");
		for (File poDir : Utils.listSorted(new File("po"))) {
			for (File poFile : Utils.listSorted(poDir)) {
				if (poFile.getName().endsWith(".po")) {
					final String lang =
					    poFile.getName().substring(0, poFile.getName().length() - 3);
					final String outFile = "i18n/" + poDir.getName() + "/" + lang + ".mo";

					Utils.bashOutput("msgmerge", poFile.getAbsolutePath(),
					                 new File(poDir, poDir.getName() + ".pot").getAbsolutePath(),
					                 "-o", poFile.getAbsolutePath());
					Utils.bashOutput("mkdir", "-p", "i18n/" + poDir.getName());
					Utils.bashOutput("mkdir", "-p", "i18n/" + lang + "/LC_MESSAGES");
					Utils.bashOutput("msgfmt", poFile.getAbsolutePath(), "-o", outFile);
					// We permanently need to store MO files in two different
					// locations for backwards compatibility.
					Utils.bashOutput(
					    "cp", outFile, "i18n/" + lang + "/LC_MESSAGES/" + poDir.getName() + ".mo");
				}
			}
		}

		ServerUtils.log("Gathering translation changes...");
		List<String> changedMO = new ArrayList<>();
		Utils.bashOutput("git", "add", "i18n");
		for (String changed :
		     Utils.bashOutput("bash", "-c", "git status -s i18n/*.wad").split("\n")) {
			if (changed.trim().isEmpty()) continue;
			String[] split = changed.split(" ");  // "", "M", "i18n/fishy.wad/nds.mo"
			changed = split[split.length - 1];    // "i18n/fishy.wad/nds.mo"
			split = changed.split("/");           // "i18n", "fishy.wad", "nds.mo"
			changedMO.add("+" + split[1]);        // "+fishy.wad"
		}
		UpdateList.main(changedMO.toArray(new String[0]));
		Utils._staticprofiles.clear();
		Utils.bashOutput("./skip_timestamp_only_po_changes.sh");
	}

	private static class Issue {
		public final String issueID, message, string, stringID, occurrence, addon;

		private Issue(
		    String issueID, String message, String string, String stringID, String occurrence) {
			this.issueID = issueID;
			this.message = message;
			this.string = string;
			this.stringID = stringID;
			this.occurrence = occurrence;

			addon = occurrence.split("/")[1];
		}
	}

	public synchronized void checkIssues() throws Exception {
		ServerUtils.log("Checking Transifex issues...");
		List<Issue> allIssues = fetchIssues();
		List<Issue> newIssues = new ArrayList<>();

		for (Issue i : allIssues) {
			ResultSet sql =
			    ServerUtils.sqlQuery(ServerUtils.Databases.kAddOns,
			                         "select * from txissues where id='" + i.issueID + "'");
			if (!sql.next()) {
				newIssues.add(i);
				ServerUtils.sqlCmd(ServerUtils.Databases.kAddOns,
				                   "insert into txissues (id) value ('" + i.issueID + "')");
			}
		}

		ServerUtils.log("Found " + newIssues.size() + " new issue(s) (" + allIssues.size() +
		                " total).");
		if (newIssues.isEmpty()) return;

		Map<String, List<Issue>> perAddOn = new LinkedHashMap<>();
		for (Issue i : newIssues) {
			if (!perAddOn.containsKey(i.addon)) perAddOn.put(i.addon, new ArrayList<>());
			perAddOn.get(i.addon).add(i);
		}

		Map<String, Map<String, List<Issue>>> perUploader = new LinkedHashMap<>();
		for (String addon : perAddOn.keySet()) {
			for (String uploader :
			     new String[] {Utils.readProfile(new File("metadata", addon + ".maintain"), addon)
			                       .get("uploader")
			                       .value}) {
				if (!perUploader.containsKey(uploader))
					perUploader.put(uploader, new LinkedHashMap<>());
				perUploader.get(uploader).put(addon, perAddOn.get(addon));
			}
		}

		ResultSet sql = ServerUtils.sqlQuery(
		    ServerUtils.Databases.kWebsite,
		    "select id from notification_noticetype where label='addon_transifex_issues'");
		final boolean noticeTypeKnown = sql.next();
		if (!noticeTypeKnown)
			ServerUtils.log("Notification type addon_transifex_issues was not defined yet");
		final long noticeTypeID = noticeTypeKnown ? sql.getLong("id") : -1;

		for (String uploader : perUploader.keySet()) {
			sql = ServerUtils.sqlQuery(
			    ServerUtils.Databases.kWebsite,
			    "select id,email from auth_user where username='" + uploader + "'");
			if (!sql.next()) {
				ServerUtils.log("User '" + uploader +
				                "' does not seem to be a registered user. No e-mail will be sent.");
				continue;
			}
			String email = sql.getString("email");

			if (noticeTypeKnown) {
				sql = ServerUtils.sqlQuery(
				    ServerUtils.Databases.kWebsite,
				    "select send from notification_noticesetting where user_id=" +
				        sql.getLong("id") + " and medium=1 and notice_type_id=" + noticeTypeID);
				if (sql.next() && sql.getShort("send") < 1) {
					ServerUtils.log("User '" + uploader + "' disabled notifications.");
					continue;
				}
			}

			Map<String, List<Issue>> relevantIssues = perUploader.get(uploader);
			long total = 0;
			for (List l : relevantIssues.values()) total += l.size();

			File message = File.createTempFile("temp", null);
			PrintWriter write = new PrintWriter(message);
			write.println("From: noreply@widelands.org");
			write.println("Subject: Transifex String Issues");
			write.println();

			write.print("Dear " + uploader + ",\nthe translators have found " + total +
			            " new issue(s) in " + relevantIssues.size() +
			            " of your add-on(s). Below you may find a list of all new string issues.");
			for (String addon : relevantIssues.keySet()) {
				List<Issue> list = relevantIssues.get(addon);
				write.print(
				    "\n\n################################################################################\n " +
				    list.size() + " new issue(s) in add-on " + addon);
				for (Issue i : list) {
					write.print(
					    "\n --------------------------------------------------------------------------------"
					    + "\n  Issue ID      : " + i.issueID + "\n  Source String : " + i.string +
					    "\n  String ID     : " + i.stringID +
					    "\n  Occurrences   : " + i.occurrence + "\n  Issue message : " + i.message);
				}
				write.print(
				    "\n################################################################################");
			}

			write.print(
			    "\n\n-------------------------\n"
			    +
			    "To change how you receive notifications, please go to https://www.widelands.org/notification/.");
			write.close();
			Utils.bash("bash", "-c", "ssmtp '" + email + "' < " + message.getAbsolutePath());
			message.delete();
		}
	}

	private synchronized List<Issue> fetchIssues() throws Exception {
		ContainerFactory cf = new ContainerFactory() {
			public List creatArrayContainer() { return new LinkedList(); }
			public Map createObjectContainer() { return new LinkedHashMap(); }
		};

		JSONParser parser = new JSONParser();
		Map json = (Map)parser.parse(
		    Utils.bashOutput("curl", "-g", "-H",
		                     "Authorization: Bearer " + Utils.config("transifextoken"),
		                     "https://rest.api.transifex.com/"
		                         + "resource_string_comments?"
		                         + "filter[organization]=o:widelands&"
		                         + "filter[type]=issue&"
		                         + "filter[project]=o:widelands:p:widelands-addons&"
		                         + "filter[status]=open"),
		    cf);

		List<Issue> result = new ArrayList<>();
		for (Object oneIssue : (List)json.get("data")) {
			String sourceStringURL =
			    ((Map)((Map)((Map)((Map)oneIssue).get("relationships")).get("resource_string"))
			         .get("links"))
			        .get("related")
			        .toString();
			Map sourceStringQuery = (Map)parser.parse(
			    Utils.bashOutput("curl", "-g", "-H",
			                     "Authorization: Bearer " + Utils.config("transifextoken"),
			                     sourceStringURL),
			    cf);

			result.add(new Issue(
			    ((Map)oneIssue).get("id").toString(),
			    ((Map)((Map)oneIssue).get("attributes")).get("message").toString(),
			    ((Map)((Map)sourceStringQuery.get("data")).get("attributes")).get("key").toString(),
			    ((Map)((Map)sourceStringQuery.get("data")).get("attributes"))
			        .get("appearance_order")
			        .toString(),
			    ((Map)((Map)sourceStringQuery.get("data")).get("attributes"))
			        .get("occurrences")
			        .toString()));
		}
		return result;
	}
}
