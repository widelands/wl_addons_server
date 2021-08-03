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

	public static void main(String[] args) throws Exception {  // NOCOM for testing only
		for (TransifexIssue i : checkIssues())
			System.out.println("Add-On     : " + i.addon + "\n"
			                   + "String ID  : " + i.stringID + "\n"
			                   + "String     : " + i.string + "\n"
			                   + "Occurrence : " + i.occurrence + "\n"
			                   + "Message    : " + i.message + "\n"
			                   + "Issue ID   : " + i.issueID + "\n");
	}

	public static List<TransifexIssue> checkIssues() throws Exception {
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
