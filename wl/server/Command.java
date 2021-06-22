package wl.server;

/**
 * After the first contact, the client must send the following info:
 *  - Protocol version
 *  - \n
 *  - Language name (e.g. "nds")
 *  - \n
 *  - Username (or "" for no user)
 *  - \n
 *  - ENDOFSTREAM\n
 * If the username is "", the server then replies ENDOFSTREAM\n.
 * Otherwise:
 *   - The server replies with a random number followed by \nENDOFSTREAM\n.
 *   - The client calculates the hash of the password hash and the random number and sends the
 *     result followed by \nENDOFSTREAM\n.
 *   - The server checks whether the result is correct and sends one of these:
 *     - SUCCESS\n for accepted standard user
 *     - ADMIN\n for accepted superuser
 *     - an error message for incorrect username or password
 *
 * The only currently supported protocol version is 4. All documentation here refers to version 4.
 * Note that compatibility for *all* versions *ever introduced* needs to be maintained
 * *indefinitely*. The first supported version is 4; the version numbers 1-3 are used by the legacy
 * "GitHub Repo List" format.
 *
 * All arguments to commands are whitespace-terminated strings.
 * The return value is a \n-terminated string.
 */
public enum Command {
	/**
	 * CMD_LIST
	 * List all available add-on names.
	 * Returns:
	 * - Number N of add-ons
	 * - \n
	 * - For each add-on: the add-on's internal name followed by \n
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
	 *      - last editor name (may be empty), \n,
	 *      - last edit timestamp, \n,
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
	 * Download an add-on as a byte stream.
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
	 * Download an add-on's translations as a byte stream.
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
	 * CMD_COMMENT name version lines
	 * Comment on an add-on.
	 * Arg 1: Add-on name
	 * Arg 2: Add-on version
	 * Arg 3: Number of lines in the message
	 * Then, on separate lines, the actual message; then ENDOFSTREAM\n.
	 * Returns: ENDOFSTREAM\n or an error message\n
	 */
	CMD_COMMENT,

	/**
	 * CMD_EDIT_COMMENT name index lines
	 * Edit an existing comment.
	 * Arg 1: Add-on name
	 * Arg 2: Index of the comment.
	 * Arg 3: Number of lines in the message
	 * Then, on separate lines, the actual message; then ENDOFSTREAM\n.
	 * Returns: ENDOFSTREAM\n or an error message\n
	 */
	CMD_EDIT_COMMENT,

	/**
	 * CMD_SUBMIT name
	 * Upload an add-on.
	 * Arg 1: Add-on name
	 * Then, on the next line, the content of the add-on like the response for CMD_DOWNLOAD,
	 * terminated by ENDOFSTREAM\n.
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
	 * Then, on the next line, the content of the image file like for CMD_SCREENSHOT, terminated by
	 * ENDOFSTREAM\n.
	 * Returns: ENDOFSTREAM\n or an error message\n
	 */
	CMD_SUBMIT_SCREENSHOT,

	/**
	 * CMD_CONTACT lines
	 * Send an enquiry to the Widelands Development Team.
	 * Arg 1: Number of lines in the message
	 * Then, on separate lines, the actual message; then ENDOFSTREAM\n.
	 * Returns: ENDOFSTREAM\n or an error message\n
	 */
	CMD_CONTACT,
}
