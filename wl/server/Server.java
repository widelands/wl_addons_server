package wl.server;

import java.io.*;
import java.net.*;
import java.util.*;
import wl.utils.*;

public class Server {
	public static void main(String[] args) throws Exception {
		Utils.bash("bash", "-c", "echo $PPID");  // Print our PID to the logfile so the maintainer
		                                         // knows how to kill the server process.
		ServerUtils.log("Initializing SQL...");
		Properties connectionProps = new Properties();
		connectionProps.put("user", Utils.config("databaseuser"));
		connectionProps.put("password", Utils.config("databasepassword"));
		java.sql.Connection database =
		    java.sql.DriverManager.getConnection​(Utils.config("databasename"), connectionProps);

		ServerUtils.log("Server starting...");
		ServerSocket serverSocket = new ServerSocket(Integer.valueOf(Utils.config("port")));
		new Thread(new SyncThread(), "Syncer").start();
		ServerUtils.log("Ready.");
		long n = 0;
		while (true) {
			Socket s = serverSocket.accept();
			new Thread(new ClientThread(s, database), String.format("Client#%06d", ++n)).start();
		}
	}

	public static void handle(String[] cmd,
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
				throw new ServerUtils.WLProtocolException("Invalid command " + cmd[0]);
		}
	}
}
