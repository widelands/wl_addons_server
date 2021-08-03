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

public class TransifexIssue {
	public final String issueID, message, string, stringID, occurrence, addon;

	private TransifexIssue(
	    String issueID, String message, String string, String stringID, String occurrence) {
		this.issueID = issueID;
		this.message = message;
		this.string = string;
		this.stringID = stringID;
		this.occurrence = occurrence;

		addon = occurrence.split("/")[1];
	}

	public static void checkIssues() throws Exception {
		ServerUtils.log("Checking Transifex issues...");
		List<TransifexIssue> allIssues = fetchIssues();
		List<TransifexIssue> newIssues = new ArrayList<>();

		for (TransifexIssue i : allIssues) {
			ResultSet sql = ServerUtils.sqlQuery(
			    ServerUtils.Databases.kAddOns,
			    "select * from txissues where id='" + i.issueID + "'");
			if (!sql.next()) {
				newIssues.add(i);
				ServerUtils.sqlCmd(
				    ServerUtils.Databases.kAddOns,
				    "insert into txissues (id) value ('" + i.issueID + "')");
			}
		}

		ServerUtils.log("Found " + newIssues.size() + " new issue(s) (" + newIssues.size() + " total).");
		if (newIssues.isEmpty()) return;

		Map<String, List<TransifexIssue>> perAddOn = new LinkedHashMap<>();
		for (TransifexIssue i : newIssues) {
			if (!perAddOn.containsKey(i.addon)) perAddOn.put(i.addon, new ArrayList<>());
			perAddOn.get(i.addon).add(i);
		}

		Map<String, Map<String, List<TransifexIssue>>> perUploader = new LinkedHashMap<>();
		for (String addon : perAddOn.keySet()) {
			String uploader =
			    Utils
			        .readProfile(
			            new File("metadata", addon + ".maintain"), addon)
			        .get("uploader")
			        .value;
			if (!perUploader.containsKey(uploader)) perUploader.put(uploader, new LinkedHashMap<>());
			perUploader.get(uploader).put(addon, perAddOn.get(addon));
		}

		for (String uploader : perUploader.keySet()) {
			ResultSet sql = ServerUtils.sqlQuery(
			    ServerUtils.Databases.kWebsite,
			    "select email from auth_user where username='" + uploader +
			        "'");
			if (!sql.next()) {
				ServerUtils.log(
				    "User '" + uploader +
				    "' does not seem to be a registered user. No e-mail will be sent.");
				continue;
			}
			String email = sql.getString("email");
			// TODO check whether the user is subscribed to such notifications

			Map<String, List<TransifexIssue>> relevantIssues = perUploader.get(uploader);
			long total = 0;
			for (List l : relevantIssues.values()) total += l.size();

			File message = File.createTempFile("temp", null);
			PrintWriter write = new PrintWriter(message);
			write.println("From: noreply@widelands.org");
			write.println("Subject: Transifex String Issues");
			write.println();

			write.print(
			    "Dear " + uploader + ",\nthe translators have found " + total +
			    " new issue(s) in " + relevantIssues.size() +
			    " of your add-on(s). Below you may find a list of all new string issues.");
			for (String addon : relevantIssues.keySet()) {
				List<TransifexIssue> list = relevantIssues.get(addon);
				write.print(
				    "\n\n################################################################################\n " +
				    list.size() + " new issue(s) in add-on " + addon);
				for (TransifexIssue i : list) {
					write.print(
					    "\n --------------------------------------------------------------------------------"
					    + "\n  Issue ID      : " + i.issueID +
					    "\n  Source String : " + i.string +
					    "\n  String ID     : " + i.stringID +
					    "\n  Occurrences   : " + i.occurrence +
					    "\n  Issue message : " + i.message);
				}
				write.print(
				    "\n################################################################################");
			}

			write.print("\n\n-------------------------\n" +
					"To change how you receive notifications, please go to https://www.widelands.org/notification/.");
			write.close();
			Utils.bash("bash", "-c",
			           "ssmtp '" + email + "' < " + message.getAbsolutePath());
			message.delete();
		}
	}

	private static List<TransifexIssue> fetchIssues() throws Exception {
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

		List<TransifexIssue> result = new ArrayList<>();
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

			result.add(new TransifexIssue(
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
