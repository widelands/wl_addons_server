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

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Calendar;
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

	private static File getWebsiteMapsTranslationsFile() {
		return new File("website_maps_i18n_version");
	}

	private long websiteMapTranslationsVersion;

	private TransifexIntegration() {
		try (BufferedReader reader =
		         new BufferedReader(new FileReader(getWebsiteMapsTranslationsFile()));) {
			websiteMapTranslationsVersion = Long.valueOf(reader.readLine());
		} catch (Exception e) {
			Utils.log("Could not read website maps translation version: " + e);
			websiteMapTranslationsVersion = 0;
		}
	}

	/**
	 * Get the current version of website map translations.
	 * @return The version number, or 0 if not known.
	 */
	public long getWebsiteMapTranslationsVersion() { return websiteMapTranslationsVersion; }

	private void incrementWebsiteMapTranslationsVersion() {
		if (websiteMapTranslationsVersion == 0) {
			Utils.log("Refusing to update website maps translation version because it is zero.");
			return;
		}

		++websiteMapTranslationsVersion;

		try (PrintWriter writer =
		         new PrintWriter(new FileWriter(getWebsiteMapsTranslationsFile()));) {
			writer.println(websiteMapTranslationsVersion);
		} catch (Exception e) {
			Utils.log("Could not save new website maps translation version: " + e);
		}
	}

	/**
	 * Perform a full translations sync.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public synchronized void fullSync() throws Exception {
		pull();
		buildCatalogues();
		push();

		if (!Utils.bashOutput("bash", "-c", "git status -s po/websitemaps/*.po").isEmpty()) {
			incrementWebsiteMapTranslationsVersion();
		}

		Utils.clearTranslationsCache();
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
		Utils.bash("tx", "push", "-s", "-r", "*");
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

					Utils.bash("msgmerge", poFile.getAbsolutePath(),
					           new File(poDir, poDir.getName() + ".pot").getAbsolutePath(), "-o",
					           poFile.getAbsolutePath());
					new File("i18n", poDir.getName()).mkdirs();
					new File("i18n/" + lang, "LC_MESSAGES").mkdirs();
					Utils.bash("msgfmt", poFile.getAbsolutePath(), "-o", outFile);
					// We permanently need to store MO files in two different
					// locations for backwards compatibility.
					Files.copy(new File(outFile).toPath(),
					           new File("i18n/" + lang + "/LC_MESSAGES", poDir.getName() + ".mo")
					               .toPath());
				}
			}
		}

		Utils.log("Gathering translation changes...");
		Utils.bash("git", "add", "i18n");
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

			try (Utils.QueryResult sql =
			         Utils.sqlQuery(Utils.Databases.kAddOns,
			                        "select id,i18n_version from addons where name=?", changed);) {
				if (!sql.rs.next())
					throw new Exception("Add-on '" + changed + "' is not in the database");
				Utils.sqlCall(Utils.Databases.kAddOns,
				              "update addons set i18n_version=? where id=?",
				              sql.rs.getLong("i18n_version") + 1, sql.rs.getLong("id"));
			}
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

			addon = issueID.split(":")[5];
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
		List<Issue> oldIssuesToSend = new ArrayList<>();
		final boolean shouldSendOldIssues = Calendar.getInstance().get(Calendar.DAY_OF_MONTH) == 1;

		for (Issue i : allIssues) {
			try (Utils.QueryResult sql = Utils.sqlQuery(
			         Utils.Databases.kAddOns, "select * from txissues where id=?", i.issueID);) {
				if (!sql.rs.next()) {
					newIssues.add(i);
					Utils.sqlCall(
					    Utils.Databases.kAddOns, "insert into txissues (id) value (?)", i.issueID);
				} else if (shouldSendOldIssues) {
					oldIssuesToSend.add(i);
				}
			}
		}

		Utils.log("Found " + newIssues.size() + " new issue(s) (" + allIssues.size() +
		          " total). Sending " + oldIssuesToSend.size() + " old issues.");
		if (newIssues.isEmpty() && oldIssuesToSend.isEmpty()) return;

		Map<String, List[]> perAddOn = new LinkedHashMap<>();
		for (Issue i : newIssues) {
			if (!perAddOn.containsKey(i.addon))
				perAddOn.put(i.addon, new List[] {new ArrayList<>(), new ArrayList<>()});
			perAddOn.get(i.addon)[0].add(i);
		}
		for (Issue i : oldIssuesToSend) {
			if (!perAddOn.containsKey(i.addon))
				perAddOn.put(i.addon, new List[] {new ArrayList<>(), new ArrayList<>()});
			perAddOn.get(i.addon)[1].add(i);
		}

		Map<Long, Map<String, List[]>> perUploader = new LinkedHashMap<>();
		for (String addon : perAddOn.keySet()) {
			try (Utils.QueryResult sql = Utils.sqlQuery(Utils.Databases.kAddOns,
			                                            "select user from uploaders where addon=?",
			                                            Utils.getAddOnID(addon));) {
				while (sql.rs.next()) {
					Long uploader = sql.rs.getLong("user");
					if (!perUploader.containsKey(uploader)) {
						perUploader.put(uploader, new LinkedHashMap<>());
					}
					perUploader.get(uploader).put(addon, perAddOn.get(addon));
				}
			}
		}

		Set<Long> subscribed =
		    ServerUtils.getNotificationSubscribers("transifex-issues", perUploader.keySet());

		for (Long uploader : perUploader.keySet()) {
			try (Utils.QueryResult sql =
			         Utils.sqlQuery(Utils.Databases.kWebsite,
			                        "select email,username from auth_user where id=?", uploader);) {
				sql.rs.next();
				final String username = sql.rs.getString("username");
				if (!subscribed.contains(uploader)) continue;

				Map<String, List[]> relevantIssues = perUploader.get(uploader);
				long totalNew = 0;
				long totalOld = 0;
				for (List[] l : relevantIssues.values()) {
					totalNew += l[0].size();
					totalOld += l[1].size();
				}

				String text = "Dear " + username + ",\n";
				if (totalNew > 0 && totalOld > 0) {
					text += "the translators have found " + totalNew +
					        " new issue(s) in your add-on(s). Additionally, " + totalOld +
					        " issue(s) in your add-on(s) reported"
					        + " by the translators are still unresolved. This"
					        + " affects a total of " + relevantIssues.size() +
					        " of your add-ons.";
				} else if (totalNew > 0) {
					text += "the translators have found " + totalNew + " new issue(s) in " +
					        relevantIssues.size() + " of your add-on(s).";
				} else {
					text += "this is your monthly reminder that " + totalOld + " issue(s) in " +
					        relevantIssues.size() + " of your add-on(s) reported by the"
					        + " translators are still unresolved.";
				}
				text += " Below you may find a list of the string issues.";
				for (String addon : relevantIssues.keySet()) {
					for (int index = 0; index <= 1; ++index) {
						List<Issue> list = (List<Issue>)relevantIssues.get(addon)[index];
						if (list.isEmpty()) continue;
						text +=
						    "\n\n################################################################"
						    + "################\n " + list.size() + " " +
						    (index == 0 ? "new" : "existing") + " issue(s) in add-on " + addon;
						for (Issue i : list) {
							text +=
							    "\n "
							    + "----------------------------------------------------------------"
							    + "----------------"
							    // linebreak comment
							    + "\n  Issue ID      : " + i.issueID       // linebreak comment
							    + "\n  Source String : " + i.string      // linebreak comment
							    + "\n  String ID     : " + i.stringID    // linebreak comment
							    + "\n  Occurrences   : " + i.occurrence  // linebreak comment
							    +
							    "\n  Last modified : " + i.datetime_modified  // linebreak comment
							    + "\n  Priority      : " + i.priority         // linebreak comment
							    + "\n  Issue message : " + i.message;
						}
						text +=
						    "\n##################################################################"
						    + "##############";
					}
				}
				Utils.sendEMail(sql.rs.getString("email"), "Transifex String Issues", text, true);
			}
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
