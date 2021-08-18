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

package wl.utils;

import java.io.*;
import java.nio.file.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.*;

public abstract class Utils {
	public static final TreeMap<File, TreeMap<String, Value>> _staticprofiles = new TreeMap<>();

	public static void log(String msg) {
		System.out.println("[" + new Date() + " @ " + Thread.currentThread().getName() + "] " +
		                   msg);
	}

	public static enum Databases {
		kWebsite("websitedatabase"),
		kAddOns("addonsdatabase");

		public final String configKey;
		private Databases(String k) { configKey = k; }
	}
	private static final Connection[] _databases = new Connection[Databases.values().length];

	public static void initDatabases() throws Exception {
		log("Initializing SQL...");

		Properties connectionProps = new Properties();
		connectionProps.put("user", Utils.config("databaseuser"));
		connectionProps.put("password", Utils.config("databasepassword"));

		for (Databases db : Databases.values()) {
			_databases[db.ordinal()] = DriverManager.getConnection​(
			    "jdbc:mysql://" + Utils.config("databasehost") + ":" +
			        Utils.config("databaseport") + "/" + Utils.config(db.configKey),
			    connectionProps);
		}
	}

	public static ResultSet sqlQuery(Databases db, String query) throws Exception {
		Connection c = _databases[db.ordinal()];
		synchronized (c) { return c.createStatement().executeQuery(query); }
	}
	public static void sqlCmd(Databases db, String cmd) throws Exception {
		Connection c = _databases[db.ordinal()];
		synchronized (c) { c.createStatement().execute(cmd); }
	}

	public static String getUsername(long id) throws Exception {
		ResultSet r = sqlQuery(Databases.kWebsite, "select username from auth_user where id=" + id);
		if (!r.next()) return null;
		return r.getString("username");
	}
	public static Long getUserID(String name) throws Exception {
		ResultSet r =
		    sqlQuery(Databases.kWebsite, "select id from auth_user where username='" + name + "'");
		if (!r.next()) return null;
		return r.getLong("id");
	}
	public static Long getAddOnID(String name) throws Exception {
		ResultSet r =
		    sqlQuery(Databases.kAddOns, "select id from addons where name='" + name + "'");
		if (!r.next()) return null;
		return r.getLong("id");
	}

	public static boolean isUploader(String addon, long userID) throws Exception {
		ResultSet sql = sqlQuery(
		    Databases.kAddOns, "select user from uploaders where addon=" + getAddOnID(addon));
		boolean noUploaders = true;
		while (sql.next()) {
			if (sql.getLong("user") == userID) {
				return true;
			}
			noUploaders = false;
		}
		return noUploaders;
	}

	public static long[] getVotes(long addon) throws Exception {
		ResultSet sql =
		    sqlQuery(Databases.kAddOns, "select vote from uservotes where addon=" + addon);
		long[] votes = new long[10];
		for (int i = 0; i < votes.length; i++) votes[i] = 0;
		while (sql.next()) votes[sql.getInt("vote") - 1]++;
		return votes;
	}

	public static String getUploadersString(long addon, boolean onlyFirst) throws Exception {
		ResultSet sql = Utils.sqlQuery(
		    Utils.Databases.kAddOns, "select user from uploaders where addon=" + addon);
		String uploaders = "";
		while (sql.next()) {
			if (!uploaders.isEmpty()) uploaders += ",";
			uploaders += getUsername(sql.getLong("user"));
			if (onlyFirst) break;
		}
		return uploaders;
	}

	public static File[] listSorted(File dir) {
		File[] files = dir.listFiles();
		if (files == null) return new File[0];
		Arrays.sort(files);
		return files;
	}

	public static String checksum(File f) {
		try {
			Runtime rt = Runtime.getRuntime();
			Process pr = rt.exec(new String[] {"md5sum", f.getPath()});
			BufferedReader reader = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			pr.waitFor();
			String md5 = reader.readLine();
			return md5.split(" ")[0];
		} catch (Exception e) {
			System.err.println("checksumming error: " + e);
		}
		return "";
	}

	synchronized public static File createTempDir() {
		File d;
		do {
			d = new File("temp", "temp_" + System.currentTimeMillis());
		} while (d.exists());
		d.mkdirs();
		return d;
	}

	public static int bash(String... args) throws Exception {
		System.out.print("    $");
		for (String a : args) System.out.print(" " + a);
		System.out.println();

		ProcessBuilder pb = new ProcessBuilder(args);
		pb.redirectErrorStream​(true);
		Process p = pb.start();

		BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
		String str;
		while ((str = b.readLine()) != null) System.out.println("    # " + str);

		p.waitFor();
		int e = p.exitValue();
		System.out.println("    = " + e);
		return e;
	}

	public static String bashOutput(String... args) throws Exception {
		Process p = new ProcessBuilder(args).start();
		BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
		String str, result = null;
		while ((str = b.readLine()) != null) {
			if (result == null) {
				result = str;
			} else {
				result += "\n";
				result += str;
			}
		}
		return (result == null ? "" : result);
	}

	public static String durationString(long millis) {
		long hours = millis / (1000 * 60 * 60);
		millis -= hours * 1000 * 60 * 60;
		long minutes = millis / (1000 * 60);
		millis -= minutes * 1000 * 60;
		long seconds = millis / 1000;
		millis -= seconds * 1000;
		String str = millis + "ms";
		if (seconds == 0) return str;
		str = seconds + "s " + str;
		if (minutes == 0) return str;
		str = minutes + "min " + str;
		if (hours == 0) return str;
		return hours + "h " + str;
	}

	public static class AddOnComment {
		public final long userID, timestamp;
		public final Long editorID, editTimestamp;
		public final String version, message;
		public AddOnComment(long userID,
		                    long timestamp,
		                    Long editorID,
		                    Long editTimestamp,
		                    String version,
		                    String message) {
			this.userID = userID;
			this.timestamp = timestamp;
			this.editorID = editorID;
			this.editTimestamp = editTimestamp;
			this.version = version;
			this.message = message;
		}
	}

	public static class Value {
		public final String key, value, textdomain;
		public String value(String locale) {
			if (textdomain == null || textdomain.isEmpty()) return value;
			try {
				return new BufferedReader(
				           new InputStreamReader(
				               Runtime.getRuntime()
				                   .exec(new String[] {
				                       "bash", "-c",
				                       "TEXTDOMAINDIR=./i18n/ TEXTDOMAIN=" + textdomain +
				                           " LANGUAGE=" + locale + " gettext -s \"" +
				                           value.replaceAll("\"", "\\\"") + "\""})
				                   .getInputStream()))
				    .readLine();
			} catch (Exception e) {
				System.out.println("[" + Thread.currentThread().getName() +
				                   "] WARNING: gettext error for '" + key + "'='" + value +
				                   "' @ '" + textdomain + "' / '" + locale + "': " + e);
				return value;
			}
		}
		public Value(String k, String v) { this(k, v, null); }
		public Value(String k, String v, String t) {
			key = k;
			value = v;
			textdomain = t;
		}
	}

	synchronized public static TreeMap<String, Value> readProfile(File f, String textdomain)
	    throws Exception {
		if (_staticprofiles.containsKey(f)) return _staticprofiles.get(f);

		TreeMap<String, Value> profile = new TreeMap<>();
		if (!f.isFile()) {
			_staticprofiles.put(f, profile);
			return profile;
		}

		for (String line : Files.readAllLines(f.toPath())) {
			line = line.trim();
			if (line.startsWith("#")) continue;
			String[] str = line.split("=");
			for (int i = 0; i < str.length; i++) str[i] = str[i].trim();

			if (str.length < 2) {
				if (str.length == 1) profile.put(str[0], new Value(str[0], ""));
				continue;
			}

			String arg = str[1];
			for (int i = 2; i < str.length; ++i) arg += "=" + str[i];
			boolean localize = false;
			if (arg.startsWith("_")) {
				arg = arg.substring(1).trim();
				localize = true;
			}
			if (arg.startsWith("\"")) {
				arg = arg.substring(1);
				if (arg.endsWith("\"")) arg = arg.substring(0, arg.length() - 1);
			}
			profile.put(str[0], new Value(str[0], arg,
			                              localize ? textdomain == null ? "" : textdomain : null));
		}

		_staticprofiles.put(f, profile);
		return profile;
	}

	synchronized public static void
	editProfile(File f, String textdomain, TreeMap<String, Value> changes) throws Exception {
		TreeMap<String, Value> profile = readProfile(f, textdomain);
		profile.putAll(changes);
		f.getParentFile().mkdirs();
		PrintStream out = new PrintStream(f);
		for (String key : profile.keySet()) {
			out.print(key);
			out.print("=");
			if (profile.get(key).textdomain != null) out.print("_");
			out.print("\"");
			out.print(profile.get(key).value);
			out.print("\"\n");
		}
		out.close();
	}

	public static String config(String key) throws Exception {
		return readProfile(new File("config"), null).get(key).value;
	}

	public static long filesize(File dir) {
		long l = 0;
		for (File f : listSorted(dir)) {
			if (f.isDirectory())
				l += filesize(f);
			else
				l += f.length();
		}
		return l;
	}

	public static void fatalError(String str, Exception x) {
		System.out.println("#########################################################");
		System.out.println(" VERY FATAL ERROR: " + str);
		System.out.println("  " + x);
		System.out.println(" Something has gone seriously wrong here.");
		System.out.println(" Killing the server in the hope that the maintainers");
		System.out.println(" will hurry to resolve the problems.");
		System.out.println("#########################################################");
		System.exit(1);
	}

	public static void sendNotificationToGitHubThread(String msg) throws Exception {
		msg = msg.replaceAll("\n", "\\\\n");
		msg = msg.replaceAll("\t", "\\\\t");
		msg = msg.replaceAll("\\$", "§");
		msg = msg.replaceAll("\"", "❞");
		msg = msg.replaceAll("'", "❜");

		if (!Boolean.parseBoolean(config("deploy"))) {
			System.out.println("    SKIPPING message: " + msg);
			return;
		}

		System.out.println("    Sending message: " + msg);

		Process p = Runtime.getRuntime().exec(new String[] {
		    "bash", "-c",
		    "curl -X POST -H \"Accept: application/vnd.github.v3+json\" -u " +
		        config("githubusername") + ":" + config("githubtoken") +
		        " https://api.github.com/repos/widelands/wl_addons_server/issues/31/comments "
		        + "-d '{\"body\":\"" + msg + "\"}'"});
		p.waitFor();
		BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
		boolean err = false;
		String str;
		while ((str = b.readLine()) != null) {
			System.out.println("    # " + str);
			err |= str.contains("documentation_url");
		}
		System.out.println("    = " + p.exitValue());
		if (err) throw new Exception("CURL output looks like failure");
		if (p.exitValue() != 0) throw new Exception("CURL returned error code " + p.exitValue());
	}
}
