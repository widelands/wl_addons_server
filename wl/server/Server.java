package wl.server;

import java.io.*;
import java.net.*;
import java.util.*;
import wl.utils.*;

public class Server {
	private static ThreadActivityAndGitHubSyncManager syncer =
	    new ThreadActivityAndGitHubSyncManager();
	private static Random random = new Random(System.currentTimeMillis());

	public static void main(String[] args) throws Exception {
		Utils.bash("bash", "-c", "echo $PPID");  // Print our PID to the logfile so the maintainer
		                                         // knows how to kill the server process.
		System.out.println("[" + new Date() + "] Initializing SQL...");
		Properties connectionProps = new Properties();
		connectionProps.put("user", Utils.config("databaseuser"));
		connectionProps.put("password", Utils.config("databasepassword"));
		java.sql.Connection database =
		    java.sql.DriverManager.getConnection​(Utils.config("databasename"), connectionProps);

		System.out.println("[" + new Date() + "] Server starting...");
		ServerSocket serverSocket = new ServerSocket(Integer.valueOf(Utils.config("port")));
		new Thread() {
			public void run() {
				boolean errored = false;
				do try {
						Calendar nextSync = Calendar.getInstance();
						nextSync.set(Calendar.HOUR_OF_DAY, 3);
						nextSync.set(Calendar.MINUTE, 0);
						nextSync.set(Calendar.SECOND, 0);
						nextSync.set(Calendar.MILLISECOND, 0);
						long now = System.currentTimeMillis();
						long then = nextSync.getTimeInMillis();
						while (then < now + 60000) then += 1000 * 60 * 60 * 24;
						System.out.println("Next GitHub sync scheduled for " + new Date(then) +
						                   " (" + Utils.durationString(then - now) +
						                   " remaining).");
						Thread.sleep(then - now);
						System.out.println("Waking up for GitHub sync at " + new Date());
						synchronized (syncer) {
							System.out.println("Cleaning up inactive threads at " + new Date());
							syncer.check();
							if (errored)
								throw new Exception(
								    "You still have not resolved the merge conflicts. "
								    + "Please do so soon!");
							System.out.println("Performing GitHub sync at " + new Date());
							Utils._staticprofiles.clear();
							syncer.sync();
						}
					} catch (Exception e) {
						errored = true;
						System.out.println("GitHub sync ERROR: " + e);
						try {
							String str;
							String msg = "@Noordfrees\n\n"
							             + "The automated GitHub sync on the server "
							             + "has failed with the following error message:\n"
							             + "```\n" + e + "\n```\n\n```\n$ git status";
							Process p = Runtime.getRuntime().exec(
							    new String[] {"bash", "-c", "git status"});
							p.waitFor();
							BufferedReader b =
							    new BufferedReader(new InputStreamReader(p.getInputStream()));
							while ((str = b.readLine()) != null) msg += "\n" + str;
							msg += "\n```\n\nThe automated syncs will discontinue until the server "
							       +
							       "has been restarted. Please resolve the merge conflicts quickly."
							       + "  \nThank you :)";

							Utils.bash("bash", "-c", "git status");
							Utils.bash("bash", "-c", "git restore --staged .");
							Utils.bash("bash", "-c", "git checkout .");

							Utils.sendNotificationToGitHubThread(msg);
						} catch (Exception x) {
							Utils.fatalError("unable to send failure notification!", x);
						}
					}
				while (true);
			}
		}.start();
		System.out.println("[" + new Date() + "] Ready.");
		while (true) {
			Socket s = serverSocket.accept();
			new Thread() {
				public void run() {
					synchronized (syncer) { syncer.tick(s); }
					PrintStream out = null;
					try {
						System.out.println(
						    "[" + new Date() + " @ " + Thread.currentThread().getName() +
						    "] Connection received from " + s.getInetAddress() + " : " +
						    s.getPort() + " on " + s.getLocalSocketAddress() + " (" +
						    s.getLocalAddress() + " : " + s.getLocalPort() + ").");
						out = new PrintStream(s.getOutputStream(), true);
						InputStream in = s.getInputStream();

						final int protocolVersion = Integer.valueOf(ServerUtils.readLine(in));
						System.out.println("[" + new Date() + " @ " +
						                   Thread.currentThread().getName() +
						                   "] Version: " + protocolVersion);
						if (protocolVersion != 4) {
							throw new ProtocolException("Unsupported version '" + protocolVersion +
							                            "' (only supported version is '4')");
						}
						final String locale = ServerUtils.readLine(in);
						System.out.println("[" + new Date() + " @ " +
						                   Thread.currentThread().getName() +
						                   "] Locale: " + locale);
						final String username = ServerUtils.readLine(in);
						System.out.println("[" + new Date() + " @ " +
						                   Thread.currentThread().getName() +
						                   "] Username: " + username);
						if (!ServerUtils.readLine(in).equals("ENDOFSTREAM")) {
							throw new ProtocolException("Stream continues past its end");
						}
						boolean admin = false;
						if (username.isEmpty()) {
							out.println("ENDOFSTREAM");
						} else {
							final long r = random.nextLong();
							out.println(r);
							out.println("ENDOFSTREAM");

							java.sql.ResultSet sql = database.createStatement().executeQuery(
							    "select id from auth_user where username='" + username + "'");
							if (!sql.next())
								throw new ProtocolException("User " + username +
								                            " is not registered");
							final long userID = sql.getLong​(1);

							sql = database.createStatement().executeQuery(
							    "select permissions from wlggz_ggzauth where user_id=" + userID);
							if (!sql.next())
								throw new ProtocolException("User " + username +
								                            " has no permissions at all");
							final long permissions = sql.getLong(1);
							if (permissions != 7 && permissions != 127)
								throw new ProtocolException("User " + username +
								                            " has invalid permissions code " +
								                            permissions);
							admin = (permissions == 127);

							sql = database.createStatement().executeQuery(
							    "select password from wlggz_ggzauth where user_id=" + userID);
							if (!sql.next())
								throw new ProtocolException("User " + username +
								                            " did not set a password");
							final String passwordHash = sql.getString(1);

							Process p = Runtime.getRuntime().exec(new String[] {"md5sum"});
							PrintWriter md5 = new PrintWriter(p.getOutputStream());
							md5.println(passwordHash);
							md5.println(r);
							md5.close();
							final String expected =
							    new BufferedReader(new InputStreamReader(p.getInputStream()))
							        .readLine()
							        .split(" ")[0];

							final String password = ServerUtils.readLine(in);
							if (!ServerUtils.readLine(in).equals("ENDOFSTREAM")) {
								throw new ProtocolException("Stream continues past its end");
							}
							if (!password.equals(expected)) {
								throw new ProtocolException("Wrong username or password");
							}

							out.println(admin ? "ADMIN" : "SUCCESS");
						}

						String cmd;
						while ((cmd = ServerUtils.readLine(in, false)) != null) {
							synchronized (syncer) {
								syncer.tick(s);
								System.out.println("[" + new Date() + " @ " +
								                   Thread.currentThread().getName() +
								                   "] Received command: " + cmd);
							}
							handle(
							    cmd.split(" "), out, in, protocolVersion, username, admin, locale);
						}
					} catch (Exception e) {
						System.out.println("[" + new Date() + " @ " +
						                   Thread.currentThread().getName() + "] ERROR: " + e);
						if (out != null) out.println(e);
					}
					System.out.println("[" + new Date() + " @ " + Thread.currentThread().getName() +
					                   "] Connection quit.");
					if (out != null) out.close();
				}
			}.start();
		}
	}

	private static void handle(String[] cmd,
	                           PrintStream out,
	                           InputStream in,
	                           int version,
	                           String username,
	                           boolean admin,
	                           String locale) throws Exception {
		// String method = null;
		HandleCommand h = new HandleCommand(cmd, out, in, version, username, admin, locale);
		switch (Command.valueOf(cmd[0])) {
			case CMD_LIST:
				h.handleCmdList();
				break;
			case CMD_INFO:
				h.handleCmdInfo();
				break;
			case CMD_DOWNLOAD:
				h.handleCmdDownload();
				break;
			case CMD_I18N:
				h.handleCmdI18n();
				break;
			case CMD_SCREENSHOT:
				h.handleCmdScreenshot();
				break;
			case CMD_COMMENT:
				h.handleCmdComment();
				break;
			case CMD_EDIT_COMMENT:
				h.handleCmdEditComment();
				break;
			case CMD_VOTE:
				h.handleCmdVote();
				break;
			case CMD_GET_VOTE:
				h.handleCmdGetVote();
				break;
			case CMD_SUBMIT_SCREENSHOT:
				h.handleCmdSubmitScreenshot();
				break;
			case CMD_SUBMIT:
				h.handleCmdSubmit();
				break;
			case CMD_CONTACT:
				h.handleCmdContact();
				break;
			default:
				throw new ProtocolException("Invalid command " + cmd[0]);
		}
	}
}
