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

import java.io.File;
import java.nio.file.Files;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.simple.parser.ContainerFactory;
import org.json.simple.parser.JSONParser;
import wl.utils.Buildcats;
import wl.utils.UpdateList;
import wl.utils.Utils;

/**
 * Class to handle all integration with Transifex.
 */
public class TransifexIntegration {

	/**
	 * The singleton instance of this class.
	 */
	public static TransifexIntegration TX = new TransifexIntegration();

	private TransifexIntegration() {}

	/**
	 * Perform a full translations sync.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public synchronized void fullSync() throws Exception {
		pull();
		buildCatalogues();
		push();
	}

	/**
	 * Pull translation files from Transifex. Does not perform any further processing.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public synchronized void pull() throws Exception {
		Utils.log("Pulling translations from Transifex...");
		Utils.bash("tx", "pull", "-f", "-a");
	}

	/**
	 * Push the current POT files to Transifex.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public synchronized void push() throws Exception {
		Utils.log("Pushing POT files to Transifex...");
		Utils.bash("tx", "push", "-s");
	}

	/**
	 * Update the POT files, synchronize the current PO files with them, and recompile all MO files.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public synchronized void buildCatalogues() throws Exception {
		Utils.log("Rebuilding catalogues...");
		Buildcats.buildCatalogues();

		Utils.log("Updating PO and MO files...");
		ServerUtils.doDelete(new File("i18n"));
		for (File poDir : Utils.listSorted(new File("po"))) {
			for (File poFile : Utils.listSorted(poDir)) {
				if (poFile.getName().endsWith(".po")) {
					final String lang =
					    poFile.getName().substring(0, poFile.getName().length() - 3);
					final String outFile = "i18n/" + poDir.getName() + "/" + lang + ".mo";

					Utils.bashOutput("msgmerge", poFile.getAbsolutePath(),
					                 new File(poDir, poDir.getName() + ".pot").getAbsolutePath(),
					                 "-o", poFile.getAbsolutePath());
					new File("i18n", poDir.getName()).mkdirs();
					new File("i18n/" + lang, "LC_MESSAGES").mkdirs();
					Utils.bashOutput("msgfmt", poFile.getAbsolutePath(), "-o", outFile);
					// We permanently need to store MO files in two different
					// locations for backwards compatibility.
					Files.copy(new File(outFile).toPath(),
					           new File("i18n/" + lang + "/LC_MESSAGES", poDir.getName() + ".mo")
					               .toPath());
				}
			}
		}

		Utils.log("Gathering translation changes...");
		Utils.bashOutput("git", "add", "i18n");
		HashSet<String> increasedMO = new HashSet<>();
		for (String changed :
		     Utils.bashOutput("bash", "-c", "git status -s i18n/*.wad").split("\n")) {
			if (changed.trim().isEmpty()) continue;

			String[] split = changed.split(" ");  // "", "M", "i18n/fishy.wad/nds.mo"
			changed = split[split.length - 1];    // "i18n/fishy.wad/nds.mo"
			split = changed.split("/");           // "i18n", "fishy.wad", "nds.mo"
			changed = split[1];                   // "fishy.wad"

			if (increasedMO.contains(changed)) continue;
			increasedMO.add(changed);

			ResultSet sql = Utils.sql(Utils.Databases.kAddOns,
			                          "select id,i18n_version from addons where name=?", changed);
			if (!sql.next()) throw new Exception("Add-on '" + changed + "' is not in the database");
			Utils.sql(Utils.Databases.kAddOns, "update addons set i18n_version=? where id=?",
			          sql.getLong("i18n_version") + 1, sql.getLong("id"));
		}
		UpdateList.rebuildLists();
		Utils.bashOutput("./skip_timestamp_only_po_changes.sh");
	}

	private static class Issue {
		public final String issueID, message, priority, datetime_modified, string, stringID,
		    occurrence, addon;

		public Issue(String issueID,
		             String message,
		             String priority,
		             String datetime_modified,
		             String string,
		             String stringID,
		             String occurrence) {
			this.issueID = issueID;
			this.message = message;
			this.priority = priority;
			this.datetime_modified = datetime_modified;
			this.string = string;
			this.stringID = stringID;
			this.occurrence = occurrence;

			addon = occurrence.split("/")[1];
		}
	}

	/**
	 * Retrieve the list of open issues from Transifex
	 * and send e-mails to add-on authors about any new ones.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public synchronized void checkIssues() throws Exception {
		Utils.log("Checking Transifex issues...");
		List<Issue> allIssues = fetchIssues();
		List<Issue> newIssues = new ArrayList<>();

		for (Issue i : allIssues) {
			ResultSet sql =
			    Utils.sql(Utils.Databases.kAddOns, "select * from txissues where id=?", i.issueID);
			if (!sql.next()) {
				newIssues.add(i);
				Utils.sql(
				    Utils.Databases.kAddOns, "insert into txissues (id) value (?)", i.issueID);
			}
		}

		Utils.log("Found " + newIssues.size() + " new issue(s) (" + allIssues.size() + " total).");
		if (newIssues.isEmpty()) return;

		Map<String, List<Issue>> perAddOn = new LinkedHashMap<>();
		for (Issue i : newIssues) {
			if (!perAddOn.containsKey(i.addon)) perAddOn.put(i.addon, new ArrayList<>());
			perAddOn.get(i.addon).add(i);
		}

		Map<Long, Map<String, List<Issue>>> perUploader = new LinkedHashMap<>();
		for (String addon : perAddOn.keySet()) {
			ResultSet sql =
			    Utils.sql(Utils.Databases.kAddOns, "select user from uploaders where addon=?",
			              Utils.getAddOnID(addon));
			while (sql.next()) {
				Long uploader = sql.getLong("user");
				if (!perUploader.containsKey(uploader))
					perUploader.put(uploader, new LinkedHashMap<>());
				perUploader.get(uploader).put(addon, perAddOn.get(addon));
			}
		}

		Set<Long> subscribed =
		    ServerUtils.getNotificationSubscribers("transifex-issues", perUploader.keySet());

		for (Long uploader : perUploader.keySet()) {
			ResultSet sql = Utils.sql(Utils.Databases.kWebsite,
			                          "select email,username from auth_user where id=?", uploader);
			sql.next();
			final String username = sql.getString("username");
			if (!subscribed.contains(uploader)) continue;

			Map<String, List<Issue>> relevantIssues = perUploader.get(uploader);
			long total = 0;
			for (List l : relevantIssues.values()) total += l.size();

			String text = "Dear " + username + ",\nthe translators have found " + total +
			              " new issue(s) in " + relevantIssues.size() +
			              " of your add-on(s). Below you may find a list of all new string issues.";
			for (String addon : relevantIssues.keySet()) {
				List<Issue> list = relevantIssues.get(addon);
				text +=
				    "\n\n################################################################################\n " +
				    list.size() + " new issue(s) in add-on " + addon;
				for (Issue i : list) {
					text +=
					    "\n --------------------------------------------------------------------------------"
					    // anti-linebreak comment
					    + "\n  Issue ID      : " + i.issueID            // anti-linebreak comment
					    + "\n  Source String : " + i.string             // anti-linebreak comment
					    + "\n  String ID     : " + i.stringID           // anti-linebreak comment
					    + "\n  Occurrences   : " + i.occurrence         // anti-linebreak comment
					    + "\n  Last modified : " + i.datetime_modified  // anti-linebreak comment
					    + "\n  Priority      : " + i.priority           // anti-linebreak comment
					    + "\n  Issue message : " + i.message;
				}
				text +=
				    "\n################################################################################";
			}
			Utils.sendEMail(sql.getString("email"), "Transifex String Issues", text, true);
		}
	}

	private static class CustomMap extends LinkedHashMap {
		public CustomMap map(Object key) { return (CustomMap)get(key); }
	}

	private synchronized List<Issue> fetchIssues() throws Exception {
		ContainerFactory cf = new ContainerFactory() {
			public List creatArrayContainer() { return new LinkedList(); }
			public Map createObjectContainer() { return new CustomMap(); }
		};

		JSONParser parser = new JSONParser();
		CustomMap json = (CustomMap)parser.parse(
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
			CustomMap i = (CustomMap)oneIssue;
			String sourceStringURL = i.map("relationships")
			                             .map("resource_string")
			                             .map("links")
			                             .get("related")
			                             .toString();
			CustomMap sourceStringQuery = (CustomMap)parser.parse(
			    Utils.bashOutput("curl", "-g", "-H",
			                     "Authorization: Bearer " + Utils.config("transifextoken"),
			                     sourceStringURL),
			    cf);

			result.add(new Issue(
			    i.get("id").toString(), i.map("attributes").get("message").toString(),
			    i.map("attributes").get("priority").toString(),
			    i.map("attributes").get("datetime_modified").toString(),
			    sourceStringQuery.map("data").map("attributes").get("key").toString(),
			    sourceStringQuery.map("data").map("attributes").get("appearance_order").toString(),
			    sourceStringQuery.map("data").map("attributes").get("occurrences").toString()));
		}
		return result;
	}
}
