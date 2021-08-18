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
import wl.utils.*;

// clang-format off

/* Tool to migrate the metadata to a database.
 *
 * Step 1: Prepare the databases in MySQL
 *     create table addons ( id int primary key auto_increment, name varchar(255), timestamp bigint, i18n_version int, security varchar(128), quality varchar(128), downloads int );
 *     create table usercomments ( id int primary key auto_increment, addon int, user int, timestamp bigint, editor int, edit_timestamp bigint, version varchar(128), message varchar(1024));
 *     create table uploaders(addon int, user int, primary key(addon, user));
 *     select * from uservotes;
 *     drop table uservotes;
 *     create table uservotes(addon int, user int, vote int, primary key(addon, user));
 *
 * Step 2: Add an entry in the website database's `auth_user` table for every uploader and every commenter.
 *
 * Step 3:
 *     ./compile.sh
 *     java -cp ./mysql-connector-java-8.0.23.jar:./json-simple-1.1.1.jar:./build wl.server.MetadataToDatabase
 *
 * Step 4: Manually re-insert all uservotes.
 *
 * Step 5:
 *     After the migration, delete this file and the whole `metadata` folder.
 */

// clang-format on

public class MetadataToDatabase {
	private static long UID(String name) throws Exception {
		ResultSet sql = ServerUtils.sqlQuery(ServerUtils.Databases.kWebsite, "select id from auth_user where username='" + name + "'");
		if (sql.next()) return sql.getLong​("id");
		ServerUtils.log("WARNING: User '" + name + "' is not registered, assigning ID -1");
		return -1;
	}

	public static void main(String[] args) throws Exception {
		ServerUtils.initDatabases();

		for (File addon : Utils.listSorted(new File("addons"))) {
			ServerUtils.log("Converting: " + addon.getName());
			TreeMap<String, Utils.Value> mdS = Utils.readProfile(new File("metadata", addon.getName() + ".server"  ), addon.getName());
			TreeMap<String, Utils.Value> mdM = Utils.readProfile(new File("metadata", addon.getName() + ".maintain"), addon.getName());

			ServerUtils.sqlCmd(ServerUtils.Databases.kAddOns,
				"insert into addons (name,timestamp,i18n_version,security,quality,downloads) value ("
				+ "'" + addon.getName()         + "',"
				+       mdM.get("timestamp"   ).value + ","
				+       mdM.get("i18n_version").value + ","
				+ "'" + mdM.get("security"    ).value + "',"
				+       "2,"
				+       mdS.get("downloads"   ).value + ")"
			);

			ResultSet sql = ServerUtils.sqlQuery(ServerUtils.Databases.kAddOns, "select id from addons where name='" + addon.getName() + "'");
			sql.next();
			final long addonID = sql.getLong​("id");

			final long uid = UID(mdM.get("uploader").value);
			if (uid >= 0) {
				ServerUtils.sqlCmd(ServerUtils.Databases.kAddOns,
					"insert into uploaders (addon,user) value(" + addonID + "," + uid + ")");
			}

			final int nrComments = Integer.valueOf(mdS.get("comments").value);
			for (int i = 0; i < nrComments; ++i) {
				ServerUtils.log("Converting comment #" + i);
				final int nrLines = Integer.valueOf(mdS.get("comment_" + i).value);
				String message = "";
				for (int j = 0; j <= nrLines; ++j) {
					if (j > 0) message += "\n";
					message += mdS.get("comment_" + i + "_" + j).value;
				}

				Utils.Value vEditor = mdS.get("comment_editor_" + i);
				Utils.Value vEditTS = mdS.get("comment_edit_timestamp_" + i);

				String command = "insert into usercomments(addon,user,timestamp,";
				if (vEditor != null) command += "editor,";
				if (vEditTS != null) command += "edit_timestamp,";
				command += "version,message) value(";
				command += addonID + ",";
				command += UID(mdS.get("comment_name_" + i).value) + ",";
				command += mdS.get("comment_timestamp_" + i).value + ",";
				if (vEditor != null) command += vEditor.value + ",";
				if (vEditTS != null) command += vEditTS.value + ",";
				command += "'" + mdS.get("comment_version_" + i).value + "',";
				command += "'" + message + "')";

				ServerUtils.sqlCmd(ServerUtils.Databases.kAddOns, command);
			}
		}
	}
}
