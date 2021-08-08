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

import java.io.*;
import java.net.*;

public class Munin {
	private static class SubGraph {
		public final String name, shortInfo, longInfo, type;
		public SubGraph(String n, String si, String li, String t) {
			name = n;
			shortInfo = si;
			longInfo = li;
			type = t;
		}
	};
	private static class MultiGraph {
		public final String name, descname, axisLabel;
		public final SubGraph[] subgraphs;
		public MultiGraph(String n, String d, String l, SubGraph... sg) {
			name = n;
			descname = d;
			axisLabel = l;
			subgraphs = sg;
		}
	};
	private static SubGraph cmdGraph(String cmd) {
		String descname = "CMD_" + cmd.toUpperCase();
		return new SubGraph(cmd, descname, "Counter of " + descname + " commands", "COUNTER");
	}
	private static final MultiGraph[] _graphs = new MultiGraph[] {
	    new MultiGraph("addons_uptime",
	                   "Add-Ons Server Uptime",
	                   "time",
	                   new SubGraph("time",
	                                "Uptime in ms",
	                                "Time in milliseconds since the last server restart",
	                                "GAUGE")),
	    new MultiGraph(
	        "addons_users",
	        "Add-Ons Server Users",
	        "count",
	        new SubGraph("registered",
	                     "Registered",
	                     "Number of currently connected registered users",
	                     "GAUGE"),
	        new SubGraph("unregistered",
	                     "Unregistered",
	                     "Number of currently connected unregistered users",
	                     "GAUGE"),
	        new SubGraph("unique", "Unique", "Counter of unique registered users", "COUNTER"),
	        new SubGraph("failed", "Failed", "Counter of failed connection attempts", "COUNTER")),
	    new MultiGraph(
	        "addons_commands",
	        "Add-Ons Commands",
	        "count",
	        // Keep the order in sync with the server's wl.server.Command constant ordering
	        cmdGraph("list"),
	        cmdGraph("info"),
	        cmdGraph("download"),
	        cmdGraph("i18n"),
	        cmdGraph("screenshot"),
	        cmdGraph("vote"),
	        cmdGraph("get_vote"),
	        cmdGraph("comment"),
	        cmdGraph("edit_comment"),
	        cmdGraph("submit"),
	        cmdGraph("submit_screenshot"),
	        cmdGraph("contact"),
	        cmdGraph("setup_tx"),
	        new SubGraph("failed", "Failed", "Counter of failed commands", "COUNTER")),
	};
	private static final String HOST = "127.0.0.1";
	private static final String PASSWORD = "Odin";
	private static final int PORT = 7388;

	public static void main(String[] args) {
		if (args.length > 0 && args[0].equals("config")) {
			for (MultiGraph g : _graphs) {
				System.out.println("multigraph " + g.name);
				System.out.println("graph_title " + g.descname);
				System.out.println("graph_args -l 0");
				System.out.println("graph_vlabel " + g.axisLabel);
				System.out.println("graph_category widelands");

				System.out.print("graph_order");
				for (SubGraph s : g.subgraphs) System.out.print(" " + s.name);
				System.out.println();

				for (SubGraph s : g.subgraphs) {
					System.out.println(s.name + ".label " + s.shortInfo);
					System.out.println(s.name + ".info " + s.longInfo);
					System.out.println(s.name + ".type " + s.type);
					System.out.println(s.name + ".draw LINE1");
				}
			}
			return;
		}

		String[][] output = new String[_graphs.length][];
		for (int i = 0; i < output.length; i++) {
			output[i] = new String[_graphs[i].subgraphs.length];
			for (int j = 0; j < output[i].length; j++) output[i][j] = "U";
		}
		try {
			Socket socket = new Socket(HOST, PORT);
			PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
			BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));

			out.println("munin");
			out.println("1");

			out.println("ENDOFSTREAM");
			final long r = Long.valueOf(in.readLine());
			in.readLine();
			Process p = Runtime.getRuntime().exec(new String[] {"md5sum"});
			PrintWriter md5 = new PrintWriter(p.getOutputStream());
			md5.println(PASSWORD);
			md5.println(r);
			md5.close();
			out.println(new BufferedReader(new InputStreamReader(p.getInputStream()))
			                .readLine()
			                .split(" ")[0]);
			out.println("ENDOFSTREAM");

			for (String[] s : output)
				for (int i = 0; i < s.length; i++) s[i] = in.readLine();
		} catch (Exception e) {
			System.err.println(e);
		} finally {
			for (int i = 0; i < output.length; i++) {
				System.out.println("multigraph " + _graphs[i].name);
				for (int j = 0; j < output[i].length; j++)
					System.out.println(_graphs[i].subgraphs[j].name + ".value " + output[i][j]);
			}
		}
	}
}
