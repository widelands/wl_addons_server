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

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

/**
 * Miscellaneous utility functions.
 */
public class Utils {
	private Utils() {}

	private static class ChecksummedFile {
		public final File file;
		public final String cachedChecksum;

		public ChecksummedFile(File f) {
			file = f;
			cachedChecksum = cs();
		}

		private String cs() { return file.isFile() ? checksum(file) : ""; }

		@Override
		public boolean equals(Object o) {
			if (!(o instanceof ChecksummedFile)) return false;

			ChecksummedFile c = (ChecksummedFile)o;
			if (!c.file.equals(file)) return false;

			String newCS = cs();
			return cachedChecksum.equals(newCS) && c.cachedChecksum.equals(newCS);
		}
	}

	/**
	 * Print log output to standard output.
	 * Output is formatted with a timestamp and the thread name.
	 * @param msg Text to print.
	 */
	public static void log(String msg) {
		System.out.println("[" + new Date() + " @ " + Thread.currentThread().getName() + "] " +
		                   msg);
	}

	/**
	 * Which database to use for an SQL command.
	 */
	public static enum Databases {

		/**
		 * The read-only website database, which contains details about registered users.
		 */
		kWebsite("website_database", "website_db_user", "website_db_password"),

		/**
		 * The add-ons database, which contains moddable metadata about all add-ons.
		 */
		kAddOns("addons_database", "addons_db_user", "addons_db_password");

		/** The key in the config file that is mapped to this database name. */
		public final String dbName;

		/** The key in the config file that is mapped to this database user. */
		public final String user;

		/** The key in the config file that is mapped to this database password. */
		public final String password;

		private Databases(String db, String user, String password) {
			this.dbName = db;
			this.user = user;
			this.password = password;
		}
	}
	private static final Connection[] _databases = new Connection[Databases.values().length];

	/**
	 * Initialize the databases. Call this only on startup.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void initDatabases() throws Exception {
		log("Initializing SQL...");

		for (Databases db : Databases.values()) {
			_databases[db.ordinal()] =
			    DriverManager.getConnection("jdbc:mysql://" + config("databasehost") + ":" +
			                                    config("databaseport") + "/" + config(db.dbName),
			                                config(db.user), config(db.password));
		}
	}

	/**
	 * Execute an SQL statement. Use placeholders for all parameters to prevent SQL injection.
	 * @param db Database to use.
	 * @param query Statement to execute. Use '?' for placeholders.
	 * @param values Values to substitute for the placeholders.
	 * @return The result of the query for SELECT statements; null for other statements.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static ResultSet sql(Databases db, String query, Object... values) throws Exception {
		Connection c = _databases[db.ordinal()];
		synchronized (c) {
			PreparedStatement s = c.prepareStatement(query);
			for (int i = 0; i < values.length; i++) s.setObject(i + 1, values[i]);
			return s.execute() ? s.getResultSet() : null;
		}
	}

	/**
	 * Retrieve the name of a user from the database.
	 * @param id The user's ID.
	 * @return The user's name.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static String getUsername(long id) throws Exception {
		ResultSet r = sql(Databases.kWebsite, "select username from auth_user where id=?", id);
		if (!r.next()) return null;
		return r.getString("username");
	}

	/**
	 * Retrieve the ID of a user from the database.
	 * @param name The user's name.
	 * @return The user's ID.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static Long getUserID(String name) throws Exception {
		ResultSet r = sql(Databases.kWebsite, "select id from auth_user where username=?", name);
		if (!r.next()) return null;
		return r.getLong("id");
	}

	/**
	 * Check if a user disabled e-mail notifications in their website settings.
	 * @param user The user's ID.
	 * @param notice The notice type ID.
	 * @return The user disabled this type of notification.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static boolean checkUserDisabledNotifications(long user, long notice) throws Exception {
		ResultSet sql = sql(
		    Databases.kWebsite,
		    "select send from notification_noticesetting where user_id=? and medium=1 and notice_type_id=?",
		    user, notice);
		return sql.next() && sql.getShort("send") < 1;
	}

	/**
	 * Retrieve the ID of an add-on from the database.
	 * @param name The add-on's name.
	 * @return The add-on's ID.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static Long getAddOnID(String name) throws Exception {
		ResultSet r = sql(Databases.kAddOns, "select id from addons where name=?", name);
		if (!r.next()) return null;
		return r.getLong("id");
	}

	/**
	 * Retrieve the name of an add-on from the database.
	 * @param id The add-on's ID.
	 * @return The add-on's name.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static String getAddOnName(long id) throws Exception {
		ResultSet r = sql(Databases.kAddOns, "select name from addons where id=?", id);
		if (!r.next()) return null;
		return r.getString("name");
	}

	/**
	 * Check whether a given user is one of the uploaders for a given add-on.
	 * If the add-on does not exist, the user is assumed to have permission to create it.
	 * @param addon The add-on's name.
	 * @param userID The user's ID.
	 * @return The user has write access to the add-on.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static boolean isUploader(String addon, long userID) throws Exception {
		ResultSet sql =
		    sql(Databases.kAddOns, "select user from uploaders where addon=?", getAddOnID(addon));
		boolean noUploaders = true;
		while (sql.next()) {
			if (sql.getLong("user") == userID) {
				return true;
			}
			noUploaders = false;
		}
		return noUploaders;
	}

	/**
	 * Retrieve the voting statistics of an add-on from the database.
	 * @param addon The add-on's ID.
	 * @return An array of size 10 with the number of i votes in index i-1.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static long[] getVotes(long addon) throws Exception {
		ResultSet sql = sql(Databases.kAddOns, "select vote from uservotes where addon=?", addon);
		long[] votes = new long[10];
		for (int i = 0; i < votes.length; i++) votes[i] = 0;
		while (sql.next()) votes[sql.getInt("vote") - 1]++;
		return votes;
	}

	/**
	 * Retrieve the list of uploaders of an add-on from the database.
	 * @param addon The add-on's ID.
	 * @param onlyFirst List at most one uploader in the result.
	 * @return Comma-separated of the uploaders.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static String getUploadersString(long addon, boolean onlyFirst) throws Exception {
		ResultSet sql = sql(Databases.kAddOns, "select user from uploaders where addon=?", addon);
		String uploaders = "";
		while (sql.next()) {
			if (!uploaders.isEmpty()) uploaders += ",";
			uploaders += getUsername(sql.getLong("user"));
			if (onlyFirst) break;
		}
		return uploaders;
	}

	/**
	 * List all files in a directory, sorted alphabetically.
	 * @param dir Directory to list.
	 * @return Sorted array (never null).
	 */
	public static File[] listSorted(File dir) {
		File[] files = dir.listFiles();
		if (files == null) return new File[0];
		Arrays.sort(files);
		return files;
	}

	/**
	 * Compute the md5 checksum of a regular file.
	 * @param f File to checksum.
	 * @return The checksum as string, or "" in case of an error.
	 */
	public static String checksum(File f) {
		try {
			Runtime rt = Runtime.getRuntime();
			Process pr = rt.exec(new String[] {"md5sum", f.getPath()});
			BufferedReader reader = new BufferedReader(new InputStreamReader(pr.getInputStream()));
			pr.waitFor();
			String md5 = reader.readLine();
			return md5.split(" ")[0];
		} catch (Exception e) {
			log("ERROR checksumming '" + (f == null ? "(null)" : f.getPath()) + "': " + e);
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * Run a shell script, and echo the whole script and its output to standard output.
	 * @param args The command and its arguments.
	 * @return The exit status of the command.
	 * @throws Exception If the shell can't be accessed.
	 */
	public static int bash(String... args) throws Exception {
		String logString = "    $";
		for (String a : args) logString += " " + a;
		log(logString);

		ProcessBuilder pb = new ProcessBuilder(args);
		pb.redirectErrorStream(true);
		Process p = pb.start();

		BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
		String str;
		while ((str = b.readLine()) != null) log("    # " + str);

		p.waitFor();
		int e = p.exitValue();
		log("    = " + e);
		return e;
	}

	/**
	 * Run a shell script and return its standard output.
	 * The standard error and exit value are discarded.
	 * @param args The command and its arguments.
	 * @return The output.
	 * @throws Exception If the shell can't be accessed.
	 */
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

	/**
	 * Format a time string.
	 * @param millis Number of milliseconds.
	 * @return Formatted time string.
	 */
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

	/**
	 * Class to represent a user's comment on an add-on.
	 */
	public static class AddOnComment {

		/** This comment's unique ID. */
		public final long commentID;

		/** The ID of the user who created this comment. */
		public final long userID;

		/** The timestamp when this comment was created. */
		public final long timestamp;

		/** The ID of the user who last edited this comment (may be null). */
		public final Long editorID;

		/** The timestamp when this comment was last edited (may be null). */
		public final Long editTimestamp;

		/** Version of the add-on about which the comment was written. */
		public final String version;

		/** Text of the comment. */
		public final String message;

		/**
		 * Constructor.
		 * @param commentID This comment's unique ID.
		 * @param userID ID of the comment author.
		 * @param timestamp Timestamp when the comment was created.
		 * @param editorID ID of the last person who edited the comment (may be null).
		 * @param editTimestamp Timestamp when the comment was last edited (may be null).
		 * @param version Version of the add-on about which the comment was written.
		 * @param message Text of the comment.
		 */
		public AddOnComment(long commentID,
		                    long userID,
		                    long timestamp,
		                    Long editorID,
		                    Long editTimestamp,
		                    String version,
		                    String message) {
			this.commentID = commentID;
			this.userID = userID;
			this.timestamp = timestamp;
			this.editorID = editorID;
			this.editTimestamp = editTimestamp;
			this.version = version;
			this.message = message;
		}
	}

	/**
	 * Class to represent a key-value pair of an ini-style file.
	 */
	public static class Value {

		/** The key to which this value is mapped. */
		public final String key;

		/** The raw, untranslated value. */
		public final String value;

		/** The textdomain to use for translating (null for non-translatable strings). */
		public final String textdomain;

		/**
		 * Return the localized value. If this Value is not localizable, returns the raw value.
		 * @param locale Locale to use.
		 * @return Localized value.
		 */
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
				log("WARNING: gettext error for '" + key + "'='" + value + "' @ '" + textdomain +
				    "' / '" + locale + "': " + e);
				e.printStackTrace();
				return value;
			}
		}

		/**
		 * Constructor for a non-translatable value.
		 * @param k ini file key.
		 * @param v Raw value.
		 */
		public Value(String k, String v) { this(k, v, null); }

		/**
		 * Constructor for a translatable value.
		 * @param k ini file key.
		 * @param v Raw value.
		 * @param t Textdomain for translation.
		 */
		public Value(String k, String v, String t) {
			key = k;
			value = v;
			textdomain = t;
		}
	}

	/** Wrapper around the contents of an ini-style file. */
	public static class Profile {

		/** The name of the global section in an add-ons main file. */
		public static final String kGlobalSection = "[global]";

		/** A section in a Profile. */
		public static class Section {

			/** The name of this section (may be "" for files without section divisions). */
			public final String name;

			/** The actual contents of the file. */
			public final Map<String, Value> contents;

			/**
			 * Constructor.
			 * @param n Name of the section.
			 */
			public Section(String n) {
				name = n;
				contents = new TreeMap<>();
			}
		}

		private final Map<String, Section> sections;

		/** Default constructor. */
		public Profile() { sections = new TreeMap<>(); }

		/**
		 * Add a new section to the profile.
		 * @param s The section to add.
		 */
		public void add(Section s) { sections.put(s.name, s); }

		/**
		 * Dump this profile to a file.
		 * @param out Stream to print to.
		 */
		public void write(PrintStream out) {
			out.println("# Automatically created by the Widelands Add-Ons Server.");
			for (Section s : sections.values()) {
				out.println();
				if (!s.name.isEmpty()) out.println(s.name);
				for (String key : s.contents.keySet()) {
					out.print(key);
					out.print("=");
					Value v = s.contents.get(key);
					if (v == null || v.value == null || v.value.isEmpty()) {
						out.println();
						continue;
					}
					if (v.textdomain != null) out.print("_");
					out.print("\"");
					out.print(v.value);
					out.println("\"");
				}
			}
		}

		/**
		 * Look up a value in this profile.
		 * @param section The name of the section in which to look
		 *                (needs to be enclosed in square brackets).
		 * @param key The key of the entry.
		 * @return The value, or null if it is not present.
		 */
		public Value get(String section, String key) {
			Section s = sections.get(section);
			if (s == null) return null;
			return s.contents.get(key);
		}

		/**
		 * Look up a value in this profile's global section.
		 * @param key The key of the entry.
		 * @return The value, or null if it is not present.
		 */
		public Value get(String key) {
			Value v = get("", key);
			if (v != null) return v;
			return get(kGlobalSection, key);
		}

		/**
		 * Look up a section in this profile. Creates the section if it doesn't exist yet.
		 * @param name The name of the section.
		 * @return The section, or null if it is not present.
		 */
		public Section getSection(String name) {
			if (sections.containsKey(name)) return sections.get(name);
			Section s = new Section(name);
			add(s);
			return s;
		}
	}
	private static final Map<ChecksummedFile, Profile> _staticprofiles = new HashMap<>();

	/**
	 * Parse an ini-style file and return its contents as a map of key-value pairs.
	 * @param f File to parse.
	 * @param textdomain Textdomain for translatable strings in the file
	 *                   (may be null if the file is not meant to be translated).
	 * @return The key-value pairs.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	synchronized public static Profile readProfile(File f, String textdomain) throws Exception {
		ChecksummedFile key = new ChecksummedFile(f);
		if (_staticprofiles.containsKey(key)) return _staticprofiles.get(key);

		for (ChecksummedFile cf : _staticprofiles.keySet()) {
			if (cf.file.equals(f)) {
				_staticprofiles.remove(cf);
				break;
			}
		}

		Profile profile = new Profile();
		if (!f.isFile()) {
			_staticprofiles.put(key, profile);
			return profile;
		}

		Profile.Section section = new Profile.Section("");
		for (String line : Files.readAllLines(f.toPath())) {
			line = line.trim();
			if (line.isEmpty() || line.startsWith("#")) continue;
			if (line.startsWith("[") && line.endsWith("]")) {
				if (!section.contents.isEmpty()) profile.add(section);
				section = new Profile.Section(line);
				continue;
			}
			String[] str = line.split("=");
			for (int i = 0; i < str.length; i++) str[i] = str[i].trim();

			if (str.length < 2) {
				if (str.length == 1) section.contents.put(str[0], new Value(str[0], ""));
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
			section.contents.put(
			    str[0],
			    new Value(str[0], arg, localize ? textdomain == null ? "" : textdomain : null));
		}
		profile.add(section);

		_staticprofiles.put(key, profile);
		return profile;
	}

	/**
	 * Overwrite an ini-style file.
	 * @param f File to use.
	 * @param profile New profile to write.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	synchronized public static void editProfile(File f, Profile profile) throws Exception {
		f.getParentFile().mkdirs();
		PrintStream out = new PrintStream(f);
		profile.write(out);
		out.close();
	}

	/**
	 * Retrieve a value from the server config file.
	 * @param key Key to look up.
	 * @return The configured value.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static String config(String key) throws Exception {
		return readProfile(new File("config"), null).get(key).value;
	}

	/**
	 * Recursively calculate the total file size of a directory.
	 * @param dir Directory to iterate.
	 * @return The total size in bytes.
	 */
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

	/**
	 * Send an e-mail.
	 * @param email E-Mail address of the recipient.
	 * @param subject Subject line of the mail.
	 * @param body Message text to send.
	 * @param footer Whether to append a footer with a link to the notifications settings.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void sendEMail(String email, String subject, String body, boolean footer)
	    throws Exception {
		File message = Files.createTempFile(null, null).toFile();
		PrintWriter write = new PrintWriter(message);
		write.println("From: noreply@widelands.org");
		write.println("Subject: " + subject);
		write.println();
		write.println(body);
		if (footer) {
			write.print(
			    "\n-------------------------\n"
			    +
			    "To change how you receive notifications, please go to https://www.widelands.org/addons/.");
		}
		write.close();
		bash("bash", "-c", "ssmtp '" + email + "' < " + message.getAbsolutePath());
		message.delete();
	}

	/** Denotes that an e-mail notification is of critical importance. */
	public static final int kEMailVerbosityCritical = 1;

	/** Denotes that an e-mail notification is of low importance. */
	public static final int kEMailVerbosityFYI = 2;

	/**
	 * Send a notification to all subscribed admins.
	 * @param verbosity {@link #kEMailVerbosityCritical} or {@link #kEMailVerbosityFYI}.
	 * @param subject Subject line of the mail.
	 * @param msg Message text to send.
	 * @throws Exception If anything at all goes wrong, throw an Exception.
	 */
	public static void sendEMailToSubscribedAdmins(int verbosity, String subject, String msg)
	    throws Exception {
		ResultSet sql = sql(Databases.kAddOns, "select email,level from notifyadmins");
		while (sql.next()) {
			if (sql.getInt("level") >= verbosity) {
				sendEMail(sql.getString("email"), subject, msg, false);
			}
		}
	}
}
