import java.io.*;
import java.net.*;
import java.nio.file.*;
import java.util.*;

public class Server {
	/*
	 * After the first contact, the client must send the following info:
	 *  - Protocol version
	 *  - \n
	 *  - Language name
	 *  - \n
	 *  - Username (or "" for no user)
	 *  - \n
	 *  - ENDOFSTREAM\n
	 * If the username is "", the server then replies ENDOFSTREAM\n.
	 * Otherwise:
	 *   - The server replies with a random number followed by \nENDOFSTREAM\n.
	 *   - The client calculates the hash of the password hash and the random number and sends the result followed by \nENDOFSTREAM\n.
	 *   - The server checks whether the result is correct and sends either ENDOFSTREAM\n or an error message.
	 *
	 * The only currently supported protocol version is 4. All documentation here refers to version 4.
	 *
	 * All arguments to commands are whitespace-terminated strings.
	 * The return value is a \n-terminated string.
	 */
	public static enum CMD {
		/**
		 * CMD_LIST
		 * List all available add-on names.
		 * Returns:
		 * - Number N of add-ons
		 * - For each add-on: \n followed by the add-on's internal name.
		 * - \n
		 * - ENDOFSTREAM\n
		 */
		CMD_LIST,

		/**
		 * CMD_INFO name
		 * Returns detailed info about a specific addon.
		 * Arg 1: Add-on name
		 * Returns:
		 *  - unlocalized name, \n
		 *  - localized name, \n
		 *  - unlocalized description, \n
		 *  - localized description, \n
		 *  - unlocalized author, \n
		 *  - localized author, \n
		 *  - uploader name, \n
		 *  - add-on version string, \n
		 *  - i18n version string, \n
		 *  - category string, \n
		 *  - comma-separated list of requirements, \n
		 *  - minimum Widelands version, \n
		 *  - maximum Widelands version, \n
		 *  - sync safety state ('true' if sync-safe), \n
		 *  - number of screenshots, \n
		 *  - for each screenshot: name, \n, localized description, \n
		 *  - total filesize, \n
		 *  - upload timestamp, \n
		 *  - download count, \n
		 *  - number of '1' votes, \n
		 *  - ...
		 *  - number of '10' votes, \n
		 *  - number of comments, \n
		 *  - for each comment:
		 *      - name, \n,
		 *      - timestamp, \n,
		 *      - version, \n,
		 *      - number of \n characters in the message, \n
		 *      - message, \n
		 *  - "verified" or "unchecked", \n
		 *  - icon checksum (0 for no icon), \n
		 *  - icon filesize (0 for no icon), \n
		 *  - icon file as a byte stream
		 *  - ENDOFSTREAM\n
		 */
		CMD_INFO,

		/**
		 * CMD_DOWNLOAD name
		 * Download an add-on as a binary stream.
		 * Arg 1: Add-on name
		 * Returns:
		 *   - Integer string denoting number D of directories
		 *   - \n
		 *   - D Directory names (with full paths), each followed by \n
		 *   - For each of the D directories:
		 *     - Number F of regular files in the directory
		 *     - \n
		 *     - For each of the F files in the directory:
		 *       - filename
		 *       - \n
		 *       - checksum
		 *       - \n
		 *       - filesize in bytes
		 *       - \n
		 *       - The content of the file as a byte stream
		 *   - ENDOFSTREAM\n
		 */
		CMD_DOWNLOAD,

		/**
		 * CMD_I18N name
		 * Download an add-on's translations as a binary stream.
		 * Arg 1: Add-on name
		 * Returns:
		 *   - Integer string denoting number T of translations
		 *   - \n
		 *   - For each of the T languages:
		 *     - <language_name>.mo
		 *     - \n
		 *     - checksum
		 *     - \n
		 *     - MO file size in bytes
		 *     - \n
		 *     - The content of the MO file as a byte stream
		 *   - \n
		 *   - ENDOFSTREAM\n
		 */
		CMD_I18N,

		/**
		 * CMD_SCREENSHOT addon screenie
		 * Download a screenshot.
		 * Arg 1: Add-on name
		 * Arg 2: Screenshot name
		 * Returns:
		 *   - checksum
		 *   - \n
		 *   - file size in bytes
		 *   - \n
		 *   - content of the image file as a byte stream
		 *   - ENDOFSTREAM\n
		 */
		CMD_SCREENSHOT,

		/**
		 * CMD_VOTE name vote
		 * Vote on an add-on.
		 * Arg 1: Add-on name
		 * Arg 2: Vote (as string) 1-10
		 * Returns: ENDOFSTREAM\n or an error message\n
		 */
		CMD_VOTE,

		/**
		 * CMD_GET_VOTE name
		 * How the user voted an add-on.
		 * Arg 1: Add-on name
		 * Returns: NOT_LOGGED_IN\n, or vote as string followed by \n and ENDOFSTREAM\n
		 */
		CMD_GET_VOTE,

		/**
		 * CMD_COMMENT name version whitespaces message
		 * Vote on an add-on.
		 * Arg 1: Add-on name
		 * Arg 2: Add-on version
		 * Arg 3: Number of whitespaces in the message
		 * Arg 4: Comment message (NOTE: use '\0' instead of \n for line breaks)
		 * Returns: ENDOFSTREAM\n or an error message\n
		 */
		CMD_COMMENT,

		/**
		 * CMD_SUBMIT name
		 * Upload an add-on.
		 * Arg 1: Add-on name
		 * Then, on the next line, the content of the add-on like the response for CMD_DOWNLOAD, terminated by ENDOFSTREAM\n.
		 * Returns: ENDOFSTREAM\n or an error message\n
		 */
		CMD_SUBMIT,

		/**
		 * CMD_SUBMIT_SCREENSHOT name filesize checksum whitespaces description
		 * Upload a screenshot.
		 * Arg 1: Add-on name
		 * Arg 2: Filesize in bytes
		 * Arg 3: The file's checksum
		 * Arg 4: Number of whitespaces in the description
		 * Arg 5: Screenshot description
		 * Then, on the next line, the content of the image file like for CMD_SCREENSHOT, terminated by ENDOFSTREAM\n.
		 * Returns: ENDOFSTREAM\n or an error message\n
		 */
		CMD_SUBMIT_SCREENSHOT,
	}

	public static class ProtocolException extends RuntimeException {
		public ProtocolException(String msg) {
			super("ProtocolException: " + msg);
		}
		@Override public String toString() { return getMessage(); }
	}

	public static String readLine(InputStream in) throws Exception { return readLine(in, true); }
	public static String readLine(InputStream in, boolean exceptionOnStreamEnd) throws Exception {
		String str = "";
		for (;;) {
			int c = in.read();
			if (c < 0) {
				if (exceptionOnStreamEnd) throw new ProtocolException("Stream ended unexpectedly during readLine");
				return null;
			}
			if (c == (char)'\n') return str;
			str += (char)c;
		}
	}

	private static class ThreadActivityAndGitHubSyncManager {
		public int run(String ... args) throws Exception {
			System.out.print("    $");
			for (String a : args) System.out.print(" " + a);
			System.out.println();

			Process p = Runtime.getRuntime().exec(args);
			p.waitFor();
			BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String str;
			while ((str = b.readLine()) != null) {
				System.out.println("    # " + str);
			}

			int e = p.exitValue();
			System.out.println("    = " + e);
			return e;
		}
		public synchronized void sync() throws Exception {
			run("bash", "-c", "git stash clear");
			if (run("bash", "-c", "git pull origin master") != 0) {
				run("bash", "-c", "git stash");
				run("bash", "-c", "git pull origin master");
				run("bash", "-c", "git stash apply");
				Process p = Runtime.getRuntime().exec(new String[]{ "bash", "-c", "git status -s" });
				BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
				String str;
				while ((str = b.readLine()) != null) {
					String file = str.substring(3);
					if (!file.startsWith("metadata/")) throw new Exception("Unable to resolve merge conflict in " + file);
					System.out.println("Resolving merge conflicts in '" + file + "'...");
					Utils.resolveMergeConflicts(new File(file));
				}
			}
			UpdateList.main();
			run("bash", "-c", "git add .");
			run("bash", "-c", "git commit -m 'Automated server sync'");
			run("bash", "-c", "git push origin master");
			run("bash", "-c", "git stash clear");
		}

		public static class Data {
			long lastActivity;
			Socket socket;
			Data(Socket s) {
				socket = s;
				lastActivity = System.currentTimeMillis();
			}
		}
		private final HashMap<Thread, Data> lastActivity = new HashMap<>();
		public synchronized void tick(Socket s) {
			lastActivity.put(Thread.currentThread(), new Data(s));
		}
		public synchronized void check() throws Exception {
			final long time = System.currentTimeMillis();
			List<Thread> kill = new ArrayList<>();
			for (Thread t : lastActivity.keySet()) {
				if (time - lastActivity.get(t).lastActivity > 12 * 60 * 60 * 1000) {
					kill.add(t);
				}
			}
			for (Thread t : kill) {
				System.out.println("Force-closing socket for [" + Thread.currentThread().getName() + "].");
				Socket s = lastActivity.remove(t).socket;
				s.close();
			}
		}
	}

	private static ThreadActivityAndGitHubSyncManager syncer = new ThreadActivityAndGitHubSyncManager();

	private static Random random = new Random(System.currentTimeMillis());
	public static void main(String[] args) throws Exception {
		System.out.println("Initializing SQL...");
		Properties connectionProps = new Properties();
		connectionProps.put("user", Utils.readProfile(new File("config"), null).get("databaseuser").value);
		connectionProps.put("password", Utils.readProfile(new File("config"), null).get("databasepassword").value);
		java.sql.Connection database = java.sql.DriverManager.getConnection​("jdbc:mysql://localhost:3306/" +
				Utils.readProfile(new File("config"), null).get("databasename").value, connectionProps);

		System.out.println("Server starting.");
		ServerSocket serverSocket = new ServerSocket(7399);
		new Thread() { public void run() {
			final long kOneDay = 1000 * 60 * 60 * 24;
			boolean errored = false;
			do try {
				Calendar nextSync = Calendar.getInstance();
				nextSync.set(Calendar.HOUR_OF_DAY, 3);
				nextSync.set(Calendar.MINUTE, 0);
				nextSync.set(Calendar.SECOND, 0);
				nextSync.set(Calendar.MILLISECOND, 0);
				long now = System.currentTimeMillis();
				long then = nextSync.getTimeInMillis();
				while (then < now + 60000) then += kOneDay;
				System.out.println("Next GitHub sync scheduled for " + then + " (" + (then - now) + " ms remaining).");
				Thread.sleep(then - now);
				System.out.println("Waking up for GitHub sync at " + System.currentTimeMillis());
				synchronized(syncer) {
					System.out.println("Cleaning up inactive threads at " + System.currentTimeMillis());
					syncer.check();
					if (errored) throw new Exception("You still have not resolved the merge conflicts. Please do so soon!");
					System.out.println("Performing GitHub sync at " + System.currentTimeMillis());
					Utils._staticprofiles.clear();
					syncer.sync();
				}
			} catch (Exception e) {
				errored = true;
				System.out.println("GitHub sync ERROR: " + e);
				try {
					String str;
					String msg = "@Noordfrees\n\n" +
								"The automated GitHub sync on the server has failed with the following error message:\n" +
								"```\n" + e + "\n```\n\n```\n$ git status";
					Process p = Runtime.getRuntime().exec(new String[] {"bash", "-c", "git status"});
					p.waitFor();
					BufferedReader b = new BufferedReader(new InputStreamReader(p.getInputStream()));
					while ((str = b.readLine()) != null) msg += "\n" + str;
					msg += "\n```\n\nThe automated syncs will discontinue until the server has been restarted. Please resolve the merge conflicts quickly." +
							"  \nThank you :)";

					msg = msg.replaceAll("\n", "\\\\n");
					msg = msg.replaceAll("\t", "\\\\t");
					msg = msg.replaceAll("\\$", "§");
					// msg = msg.replaceAll("\"", "\\\\\\\\\"");
					msg = msg.replaceAll("\"", "❞");
					msg = msg.replaceAll("'", "❜");

					syncer.run("bash", "-c", "git status");
					syncer.run("bash", "-c", "git restore --staged .");
					syncer.run("bash", "-c", "git checkout .");
					System.out.println("    Sending message: " + msg);

					p = Runtime.getRuntime().exec(new String[] {"bash", "-c",
						"curl -X POST -H \"Accept: application/vnd.github.v3+json\" -u " +
								Utils.readProfile(new File("config"), null).get("githubusername").value + ":" +
								Utils.readProfile(new File("config"), null).get("githubtoken").value +
							" https://api.github.com/repos/widelands/wl_addons_server/issues/31/comments -d '{\"body\":\"" + msg + "\"}'"});
					p.waitFor();
					b = new BufferedReader(new InputStreamReader(p.getInputStream()));
					boolean err = false;
					while ((str = b.readLine()) != null) {
						System.out.println("    # " + str);
						err |= str.contains("documentation_url");
					}
					System.out.println("    = " + p.exitValue());
					if (err) throw new Exception("CURL output looks like failure");
					if (p.exitValue() != 0) throw new Exception("CURL returned error code " + p.exitValue());
				} catch (Exception x) {
					System.out.println("#########################################################");
					System.out.println(" VERY FATAL ERROR – unable to send failure notification!");
					System.out.println("  " + x);
					System.out.println(" Something has gone seriously wrong here.");
					System.out.println(" Killing the server in the hope that the maintainers");
					System.out.println(" will hurry to resolve the problems.");
					System.out.println("#########################################################");
					System.exit(1);
				}
			} while (true);
		}}.start();
		while (true) {
			Socket s = serverSocket.accept();
			new Thread() { public void run() {
				synchronized(syncer) { syncer.tick(s); }
				PrintStream out = null;
				try {
					System.out.println("[" + Thread.currentThread().getName() + "] Connection received.");
					out = new PrintStream(s.getOutputStream(), true);
					InputStream in = s.getInputStream();

					final int protocolVersion = Integer.valueOf(readLine(in));
					if (protocolVersion != 4) {
						throw new ProtocolException("Unsupported version");
					}
					final String locale = readLine(in);
					final String username = readLine(in);
					if (!readLine(in).equals("ENDOFSTREAM")) {
						throw new ProtocolException("Stream continues past its end");
					}
					if (!username.isEmpty()) {
						final long r = random.nextLong();
						out.println(r);
						out.println("ENDOFSTREAM");

						java.sql.ResultSet sql = database.createStatement().executeQuery("select id from auth_user where username='" + username + "'");
						if (!sql.next()) throw new ProtocolException("User " + username + " is not registered");
						final long userID = sql.getLong​(1);
						sql = database.createStatement().executeQuery("select password from wlggz_ggzauth where user_id=" + userID);
						if (!sql.next()) throw new ProtocolException("User " + username + " did not set a password");
						final String passwordHash = sql.getString(1);

						Process p = Runtime.getRuntime().exec(new String[] {"md5sum"});
						PrintWriter md5 = new PrintWriter(p.getOutputStream());
						md5.println(passwordHash);
						md5.println(r);
						md5.close();
						final String expected = new BufferedReader(new InputStreamReader(p.getInputStream())).readLine().split(" ")[0];

						final String password = readLine(in);
						if (!readLine(in).equals("ENDOFSTREAM")) {
							throw new ProtocolException("Stream continues past its end");
						}
						if (!password.equals(expected)) {
							throw new ProtocolException("Wrong username or password");
						}
					}
					out.println("ENDOFSTREAM");

					String cmd;
					while ((cmd = readLine(in, false)) != null) { synchronized(syncer) {
						syncer.tick(s);
						handle(cmd.split(" "), out, in, protocolVersion, username, locale);
					}}
				} catch (Exception e) {
					System.out.println("[" + Thread.currentThread().getName() + "] ERROR: " + e);
					if (out != null) out.println(e);
				}
				System.out.println("[" + Thread.currentThread().getName() + "] Connection quit.");
				if (out != null) out.close();
			}}.start();
		}
	}

	public static File[] listSorted(File dir) {
		File[] files = dir.listFiles();
		Arrays.sort(files);
		return files;
	}

	public static void checkNameValid(String name, boolean directory) {
		if (name == null || (!directory && name.isEmpty())) throw new ProtocolException("Empty name");
		for (char c : name.toCharArray()) {
			if (
				(c >= 'a' && c <= 'z') ||
				(c >= 'A' && c <= 'Z') ||
				(c >= '1' && c <= '9') ||
				c == '0' || c == '.' || c == '_' || c == '-') continue;
			if (directory && c == '/') continue;
			throw new ProtocolException("Name '" + name + "' may not contain the character '" + c + "'");
		}
		if (name.contains("..")) throw new ProtocolException("Name '" + name + "' may not contain '..'");
	}

	private static void handle(String[] cmd, PrintStream out, InputStream in,
			int version, String username, String locale) throws Exception {
		switch (CMD.valueOf(cmd[0])) {
			case CMD_LIST: {  // Args: –
				File[] names = listSorted(new File("addons"));
				String str = "" + names.length;
				for (File s : names) str += "\n" + s.getName();
				out.println(str);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_INFO:  // Args: name
				checkNameValid(cmd[1], false);
				info(version, cmd[1], locale, out);
				return;
			case CMD_DOWNLOAD: {  // Args: name
				checkNameValid(cmd[1], false);
				DirInfo dir = new DirInfo(new File("addons", cmd[1]));
				Utils.registerDownload(cmd[1]);
				out.println(dir.totalDirs);
				dir.writeAllDirNames(out, "");
				dir.writeAllFileInfos(out);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_I18N: {  // Args: name
				checkNameValid(cmd[1], false);
				DirInfo dir = new DirInfo(new File("i18n", cmd[1]));
				dir.writeAllFileInfos(out);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_SCREENSHOT: {  // Args: addon screenie
				checkNameValid(cmd[1], false);
				checkNameValid(cmd[2], false);
				writeOneFile(new File("screenshots/" + cmd[1], cmd[2]), out);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_COMMENT: {  // Args: name version whitespaces message
				if (username.isEmpty()) {
					out.println("Please log in to comment");
					return;
				}
				checkNameValid(cmd[1], false);
				String msg = cmd[4];
				for (int i = 0; i < Integer.valueOf(cmd[3]); ++i) msg += " " + cmd[5 + i];
				Utils.comment(cmd[1], username, cmd[2], msg.replaceAll("\0", "\n"));
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_VOTE:  // Args: name vote
				if (username.isEmpty()) {
					throw new ProtocolException("Wrong username or password");
				} else {
					checkNameValid(cmd[1], false);
					Utils.registerVote(cmd[1], username, cmd[2]);
					out.println("ENDOFSTREAM");
				}
				return;
			case CMD_GET_VOTE: {  // Args: name
				if (username.isEmpty()) {
					out.println("NOT_LOGGED_IN");  // No exception here.
					return;
				}
				checkNameValid(cmd[1], false);
				Utils.Value vote = Utils.readProfile(new File("metadata", cmd[1]), cmd[1]).get("vote_" + username);
				out.println(vote == null ? "0" : vote.value);
				out.println("ENDOFSTREAM");
				return;
			}
			case CMD_SUBMIT_SCREENSHOT: {  // Args: name filesize checksum whitespaces description
				if (username.isEmpty()) {
					throw new ProtocolException("Wrong username or password");
				}
				checkNameValid(cmd[1], false);
				long size = Long.valueOf(cmd[2]);
				if (size > 4 * 1000 * 1000) throw new ProtocolException("Filesize " + size + " exceed the limit of 4 MB");
				File tempDir = Utils.createTempDir();

				try {
					String filename;
					for (int i = 1;; ++i) {
						filename = "image" + i + ".png";
						if (!new File("screenshots/" + cmd[1], filename).exists()) break;
					}
					File file = new File(tempDir, filename);
					PrintStream stream = new PrintStream(file);
					for (long l = 0; l < size; ++l) {
						int b = in.read();
						if (b < 0) throw new ProtocolException("Stream ended unexpectedly while reading file");
						stream.write(b);
					}
					stream.close();
					String checksum = UpdateList.checksum(file);
					if (!checksum.equals(cmd[3])) throw new ProtocolException("Checksum mismatch: expected " + cmd[3] + ", found " + checksum);
					if (!readLine(in).equals("ENDOFSTREAM")) throw new ProtocolException("Stream continues past its end");
					File result = new File("screenshots", cmd[1]);
					result.mkdirs();
					result = new File(result, filename);
					file.renameTo​(result);
					doDelete(tempDir);
					TreeMap<String, Utils.Value> ch = new TreeMap<>();
					int whitespaces = Integer.valueOf(cmd[4]);
					String msg = cmd[5];
					for (int w = 0; w < whitespaces; ++w) msg += " " + cmd[6 + w];
					ch.put(filename, new Utils.Value(filename, msg, cmd[1]));
					Utils.editProfile(new File("screenshots/" + cmd[1], "descriptions"), cmd[1], ch);
					out.println("ENDOFSTREAM");
				} catch (Exception e) {
					doDelete(tempDir);
					throw new ProtocolException(e.getMessage());
				}
				return;
			}
			case CMD_SUBMIT: {  // Args: name
				if (username.isEmpty()) {
					throw new ProtocolException("Wrong username or password");
				}
				checkNameValid(cmd[1], false);
				File tempDir = Utils.createTempDir();

				try {
					final int nrDirs = Integer.valueOf(readLine(in));
					File[] dirnames = new File[nrDirs];
					for (int i = 0; i < nrDirs; ++i) {
						String n = readLine(in);
						checkNameValid(n, true);
						dirnames[i] = new File(tempDir, n);
						dirnames[i].mkdirs();
					}

					long totalSize = 0;
					for (int i = 0; i < nrDirs; ++i) {
						final int nrFiles = Integer.valueOf(readLine(in));
						for (int j = 0; j < nrFiles; ++j) {
							final String filename = readLine(in);
							checkNameValid(filename, false);
							final String checksum = readLine(in);
							final long size = Long.valueOf(readLine(in));
							totalSize += size;
							if (totalSize > 200 * 1000 * 1000) throw new ProtocolException("Filesize limit of 200 MB exceeded");
							File file = new File(dirnames[i], filename);
							PrintStream stream = new PrintStream(file);
							for (long l = 0; l < size; ++l) {
								int b = in.read();
								if (b < 0) throw new ProtocolException("Stream ended unexpectedly while reading file");
								stream.write(b);
							}
							stream.close();
							String c = UpdateList.checksum(file);
							if (!checksum.equals(c)) throw new ProtocolException(
									"Checksum mismatch for " + dirnames[i].getPath() + "/" + filename + ": expected " + checksum + ", found " + c);
						}
					}

					if (!readLine(in).equals("ENDOFSTREAM")) throw new ProtocolException("Stream continues past its end");

					File addOnDir = new File("addons", cmd[1]);
					File addOnMain = new File(addOnDir, "addon");

					if (addOnDir.isDirectory()) {
						TreeMap<String, Utils.Value> oldProfile = Utils.readProfile(addOnMain, cmd[1]);
						TreeMap<String, Utils.Value> newProfile = Utils.readProfile(new File(tempDir, "addon"), cmd[1]);

						if (!oldProfile.get("category").value.equals(newProfile.get("category").value)) throw new ProtocolException(
								"An add-on with the same name and a different category already exists.");

						String[] oldVersion = oldProfile.get("version").value.split("\\.");
						String[] newVersion = newProfile.get("version").value.split("\\.");
						Boolean newer = null;
						for (int i = 0; i < oldVersion.length && i < newVersion.length; ++i) {
							if (!oldVersion[i].equals(newVersion[i])) {
								newer = (Integer.valueOf(oldVersion[i]) < Integer.valueOf(newVersion[i]));
								break;
							}
						}
						if (newer == null) newer = (oldVersion.length < newVersion.length);
						if (!newer) {
							throw new ProtocolException("An add-on with the same name and an equal or newer version already exists.");
						}

						doDelete(addOnDir);
						TreeMap<String, Utils.Value> edit = new TreeMap<>();
						edit.put("version", newProfile.get("version"));
						edit.put("security", new Utils.Value("security", "unchecked"));
						Utils.editMetadata(cmd[1], edit);
					} else {
						Utils.initMetadata(cmd[1], username);
					}
					tempDir.renameTo​(addOnDir);

					out.println("ENDOFSTREAM");
				} catch (Exception e) {
					doDelete(tempDir);
					throw new ProtocolException(e.getMessage());
				}
				return;
			}
			default: throw new ProtocolException("Invalid command " + cmd[0]);
		}
	}

	synchronized private static void doDelete(File f) {
		if (f.isDirectory()) for (File file : f.listFiles()) doDelete(file);
		f.delete();
	}

	public static void writeOneFile(File f, PrintStream out) throws Exception {
		out.println(UpdateList.checksum(f));
		long l = f.length();
		out.println(l);
		FileInputStream read = new FileInputStream(f);
		while (l > 0) {
			int len = (int)Math.min(l, Integer.MAX_VALUE - 1);
			byte[] buffer = new byte[len];
			int r = read.read(buffer, 0, len);
			if (r != len) throw new ProtocolException("Server-side error: Read " + r + " bytes but expected " + len);
			out.write(buffer);
			l -= len;
		}
	}

	private static class DirInfo {
		public final File file;
		public final ArrayList<File> regularFiles;
		public final ArrayList<DirInfo> subdirs;
		public final int totalDirs;
		public final int totalFiles;

		public DirInfo(File dir) {
			file = dir;
			regularFiles = new ArrayList<>();
			subdirs = new ArrayList<>();

			for (File f : listSorted(dir)) {
				if (f.isDirectory()) subdirs.add(new DirInfo(f));
				else regularFiles.add(f);
			}

			int t = 0;
			for (File f : regularFiles) t++;
			totalFiles = t;
			t = 0;
			for (DirInfo d : subdirs) t += d.totalDirs + 1;
			totalDirs = t;
		}

		public void writeAllDirNames(PrintStream out, String prefix) {
			for (DirInfo d : subdirs) {
				out.println(prefix + d.file.getName());
				d.writeAllDirNames(out, prefix + d.file.getName() + "/");
			}
		}
		public void writeAllFileInfos(PrintStream out) throws Exception {
			out.println(regularFiles.size());
			for (File f : regularFiles) {
				out.println(f.getName());
				writeOneFile(f, out);
			}
			for (DirInfo d : subdirs) d.writeAllFileInfos(out);
		}
	}

	synchronized public static void info(final int version, final String addon, final String locale, PrintStream out) throws Exception {
		switch (version) {
			case 4: {
				TreeMap<String, Utils.Value> profile = Utils.readProfile(new File("addons/" + addon, "addon"), addon);
				TreeMap<String, Utils.Value> metadata = Utils.readProfile(new File("metadata", addon), addon);
				TreeMap<String, Utils.Value> screenies = Utils.readProfile(new File("screenshots/" + addon, "descriptions"), addon);

				out.println(profile.get("name"         ).value        );
				out.println(profile.get("name"         ).value(locale));
				out.println(profile.get("description"  ).value        );
				out.println(profile.get("description"  ).value(locale));
				out.println(profile.get("author"       ).value        );
				out.println(profile.get("author"       ).value(locale));
				out.println(metadata.get("uploader"    ).value(locale));
				out.println(profile.get("version"      ).value);
				out.println(metadata.get("i18n_version").value);
				out.println(profile.get("category"     ).value);
				out.println(profile.get("requires"     ).value);
				out.println((profile.containsKey("min_wl_version") ? profile.get("min_wl_version").value : ""));
				out.println((profile.containsKey("max_wl_version") ? profile.get("max_wl_version").value : ""));
				out.println((profile.containsKey("sync_safe"     ) ? profile.get("sync_safe"     ).value : ""));

				out.println(screenies.size());
				for (String key : screenies.keySet()) out.println(key + "\n" + screenies.get(key).value(locale));

				out.println(Utils.filesize(new File("addons", addon)));
				out.println(metadata.get("timestamp").value);
				out.println(metadata.get("downloads").value);
				for (int i = 1; i <= 10; ++i) out.println(metadata.get("votes_" + i).value);

				int c = Integer.valueOf(metadata.get("comments").value);
				out.println(c);
				for (int i = 0; i < c; ++i) {
					out.println(metadata.get("comment_name_"      + i).value(locale));
					out.println(metadata.get("comment_timestamp_" + i).value);
					out.println(metadata.get("comment_version_"   + i).value);
					int l = Integer.valueOf(metadata.get("comment_" + i).value);
					out.println(l);
					for (int j = 0; j <= l; ++j) out.println(metadata.get("comment_" + i + "_" + j).value(locale));
				}
				out.println(metadata.get("security").value);

				File iconFile = new File("addons/" + addon, "icon.png");
				if (iconFile.isFile()) {
					writeOneFile(iconFile, out);
				} else {
					out.println("0\n0");
				}

				out.println("ENDOFSTREAM");
				return;
			}
			default: throw new ProtocolException("Wrong version " + version);
		}
	}
}
