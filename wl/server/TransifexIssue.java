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
