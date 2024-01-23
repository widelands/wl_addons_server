/*
 * Copyright (C) 2021-2023 by the Widelands Development Team
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

// clang-format off
/**
 * This enum lists all commands that can be sent from clients to the server.
 * <ul>
 * <li> After the first contact, the client must send the following info:
 * <ul>
 *  <li> Protocol version (PV), <code>\n</code>
 *  <li> Language name (e.g. "nds"), <code>\n</code>
 *  <li> PV 5+: Widelands version (e.g. "1.1~git34567"), <code>\n</code>
 *  <li> Username (or "" for no user), <code>\n</code>
 *  <li> <code>ENDOFSTREAM\n</code>
 * </ul>
 * <li> In PV 7+, the server then sends the server's display name followed by <code>\n</code>.
 * <li> If the username is "", the server then replies <code>ENDOFSTREAM\n</code>.
 * Otherwise:
 * <ul>
 *   <li> The server replies with a random number followed by <code>\nENDOFSTREAM\n</code>.
 *   <li> The client calculates the hash of the password hash and the random number and sends the
 *     result followed by <code>\nENDOFSTREAM\n</code>.
 *   <li> The server checks whether the result is correct and sends one of these:
 *     <ul>
 *     <li> <code>SUCCESS\n</code> for accepted standard user
 *     <li> <code>ADMIN\n</code> for accepted superuser
 *     <li> an error message for incorrect username or password
 * </ul></ul></ul>
 *
 * <p>
 * The currently supported protocol versions are 4 to 7. All documentation here refers to these
 * versions. Note that compatibility for <strong>all</strong> versions <strong>ever introduced</strong> needs to be maintained
 * <strong>indefinitely</strong>. The first supported version is 4; the version numbers 1-3 are used by the legacy
 * "GitHub Repo List" format.
 *
 * <p>
 * After the initial contact, the client may send any number of commands before closing the connection.
 * A command consists of one line with the command name and the command's arguments separated by whitespaces,
 * terminated by \n. The command line is followed by any number of argument lines if defined in the command's
 * specification. In PV 6 and newer, the command name is prefixed by the command version (CV)
 * followed by a colon; in older PVs the default command version as stated for each command
 * individually is assumed.
 *
 * <p>
 * All arguments to commands are whitespace-terminated strings.
 * The return value is a <code>\n</code>-terminated string.
 *
 * <p>
 * The following "protocol version" string has a very special meaning:
 * <ul>
 * <li> munin: <br>
 *   The "munin" protocol is used to print statistics about the server.
 *   In the initial contact, language and username are skipped; instead the munin protocol
 *   version is printed (only currently supported version is 2).
 *   The password authentication is then performed like for registered users.
 *   If the password is correct, the server replies not <code>ADMIN</code>/<code>SUCCESS</code> but instead
 *   prints out server statistics in the following format:
 *   <ul>
 *   <li> Time in [1: milliseconds | 2+: hours] since the server was started, <code>\n</code>
 *   <li> PV 2+: Average client lifetime in seconds, <code>\n</code>
 *   <li> PV 1:
 *       <ul><li> Number of current registered users, <code>\n</code>
 *       <li> Number of current unregistered users, <code>\n</code>
 *       </ul>
 *   <li> PV 2:
 *       <ul><li> Counter of registered users, <code>\n</code>
 *       <li> Counter of unregistered users, <code>\n</code>
 *       </ul>
 *   <li> Counter of unique registered users, <code>\n</code>
 *   <li> PV 1: Counter of successful connection attempts, <code>\n</code>
 *   <li> Counter of unsuccessful connection attempts, <code>\n</code>
 *   <li> Counter of <code>CMD_LIST              </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_INFO              </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_DOWNLOAD          </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_I18N              </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_SCREENSHOT        </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_VOTE              </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_GET_VOTE          </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_COMMENT           </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_EDIT_COMMENT      </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_SUBMIT            </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_SUBMIT_SCREENSHOT </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_CONTACT           </code> requests, <code>\n</code>
 *   <li> Counter of <code>CMD_SETUP_TX          </code> requests, <code>\n</code>
 *   <li> PV 2+: Counter of <code>CMD_ADMIN_DELETE    </code> requests, <code>\n</code>
 *   <li> PV 2+: Counter of <code>CMD_ADMIN_VERIFY    </code> requests, <code>\n</code>
 *   <li> PV 2+: Counter of <code>CMD_ADMIN_QUALITY   </code> requests, <code>\n</code>
 *   <li> PV 2+: Counter of <code>CMD_ADMIN_SYNC_SAFE </code> requests, <code>\n</code>
 *   <li> Counter of unsuccessful commands, <code>\n</code>
 *   <li> <code>ENDOFSTREAM\n</code>
 *   </ul>
 *   The connection is then closed by the server.
 *   Counters refer to the total amount since the server was last started.
 *   After a <code>CMD_LIST</code> command, the next <var>N</var> <code>CMD_INFO</code> commands are counted only
 *   once total (where <var>N</var> is the number of add-ons listed by the <code>CMD_LIST</code>).
 * </ul>
 */
public enum Command {
	/**
	 * <code>CMD_LIST [2+: control]</code>
	 *
	 * <p>
	 * Supported command versions: 1-3 (default: 4/1, 5/2)
	 *
	 * <p>
	 * List all available add-on names.
	 *
	 * <p>
	 * In CV 3+, website maps are also listed.
	 *
	 * <p> Parameters:
	 * <ul>
	 * <li> CV 1: No arguments.
	 * <li> CV 2+: A "control" argument is required to finetune the behaviour.
	 * Supported values (case-insensitive) are:
	 * <ul>
	 * <li> true – List all add-ons.
	 * <li> false – List add-ons compatible with the Widelands version.
	 * <li> showall – List all add-ons, and append the response for a
	 *                CMD_INFO for each add-on to the reply.
	 * <li> showcompatible – List add-ons compatible with the Widelands version, and append
	 *                       the response for a CMD_INFO for each add-on to the reply.
	 * </ul>
	 * </ul>
	 *
	 * <p>
	 * If CMD_INFOs are appended, they use the CV for the CMD_INFO as for this CMD_LIST.
	 *
	 * <p>
	 * Returns:
	 * <ul>
	 * <li> Number <var>N</var> of add-ons, <code>\n</code>
	 * <li> For each add-on: the add-on's internal name followed by <code>\n</code>
	 * <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 */
	CMD_LIST,

	/**
	 * <code>CMD_INFO name</code>
	 *
	 * <p>
	 * Supported command versions: 1-3 (default: 4/1, 5/2)
	 *
	 * <p>
	 * Returns detailed info about a specific addon or in CV3+ a map.
	 *
	 * <p>
	 * In CV3+, a map set add-on containing a single map map receive a .map response.
	 * In this case, the category string will be changed accordingly.
	 * For maps, the icon is the map's minimap.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name (.wad) or map slug (pseudo-extension .map; only in CV3+)
	 * </ol>
	 *
	 * <p>
	 * Returns:
	 * <ul>
	 *  <li> unlocalized name, <code>\n</code>
	 *  <li> localized name, <code>\n</code>
	 *  <li> unlocalized description, <code>\n</code>
	 *  <li> localized description, <code>\n</code>
	 *  <li> unlocalized author, <code>\n</code>
	 *  <li> localized author, <code>\n</code>
	 *  <li> CV 1: name of the main uploader, <code>\n</code>
	 *  <li> CV 2+: comma-separated list of uploaders, <code>\n</code>
	 *  <li> add-on version string, <code>\n</code>
	 *  <li> i18n version string, <code>\n</code>
	 *  <li> category string, <code>\n</code>
	 *  <li> comma-separated list of requirements, <code>\n</code>
	 *  <li> minimum Widelands version, <code>\n</code>
	 *  <li> maximum Widelands version, <code>\n</code>
	 *  <li> sync safety state (true/false), <code>\n</code>
	 *  <li> number of screenshots, <code>\n</code>
	 *  <li> for each screenshot: name, <code>\n</code>, localized description, <code>\n</code>
	 *  <li> total filesize, <code>\n</code>
	 *  <li> upload timestamp, <code>\n</code>
	 *  <li> download count, <code>\n</code>
	 *  <li> number of 1 votes, <code>\n</code>
	 *  <li> ...
	 *  <li> number of 10 votes, <code>\n</code>
	 *  <li> number of comments, <code>\n</code>
	 *  <li> for each comment:
	 * <ul>
	 *      <li> CV 2+: Comment ID, <code>\n</code>
	 *      <li> name, <code>\n</code>,
	 *      <li> timestamp, <code>\n</code>,
	 *      <li> last editor name (may be empty), <code>\n</code>,
	 *      <li> last edit timestamp, <code>\n</code>,
	 *      <li> version, <code>\n</code>,
	 *      <li> number of <code>\n</code> characters in the message, <code>\n</code>
	 *      <li> message, <code>\n</code>
	 * </ul>
	 *  <li> "verified" or "unchecked", <code>\n</code>
	 *  <li> CV 2+: Code quality rating (1-3) <code>\n</code>
	 *  <li> icon checksum (0 for no icon), <code>\n</code>
	 *  <li> icon filesize (0 for no icon), <code>\n</code>
	 *  <li> icon file as a byte stream
	 *  <li> .map only: map file name, <code>\n</code>
	 *  <li> .map only: unlocalized hint, <code>\n</code>
	 *  <li> .map only: localized hint, <code>\n</code>
	 *  <li> .map only: unlocalized uploader comment, <code>\n</code>
	 *  <li> .map only: localized uploader comment, <code>\n</code>
	 *  <li> .map only: map width, <code>\n</code>
	 *  <li> .map only: map height, <code>\n</code>
	 *  <li> .map only: number of players, <code>\n</code>
	 *  <li> .map only: world name, <code>\n</code>
	 *  <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 */
	CMD_INFO,

	/**
	 * <code>CMD_DOWNLOAD name</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Download an add-on as a byte stream.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * </ol>
	 *
	 * <p>
	 * Returns:
	 * <ul>
	 *   <li> Integer string denoting number <var>D</var> of directories, <code>\n</code>
	 *   <li> <var>D</var> Directory names (with full paths), each followed by <code>\n</code>
	 *   <li> For each of the <var>D</var> directories:
	 *   <ul>
	 *     <li> Number <var>F</var> of regular files in the directory, <code>\n</code>
	 *     <li> For each of the <var>F</var> files in the directory:
	 *     <ul>
	 *       <li> filename, <code>\n</code>
	 *       <li> checksum, <code>\n</code>
	 *       <li> filesize in bytes, <code>\n</code>
	 *       <li> The content of the file as a byte stream
	 *     </ul>
	 *   </ul>
	 *   <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 */
	CMD_DOWNLOAD,

	/**
	 * <code>CMD_I18N name</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Download an add-on's translations as a byte stream.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * </ol>
	 *
	 * <p>
	 * Returns:
	 * <ul>
	 *   <li> Integer string denoting number <var>T</var> of translations, <code>\n</code>
	 *   <li> For each of the <var>T</var> languages:
	 *   <ul>
	 *     <li> <var>{@literal<language_name>}</var>.mo, <code>\n</code>
	 *     <li> checksum, <code>\n</code>
	 *     <li> MO file size in bytes, <code>\n</code>
	 *     <li> The content of the MO file as a byte stream, <code>\n</code>
	 *   </ul>
	 *   <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 */
	CMD_I18N,

	/**
	 * <code>CMD_SCREENSHOT addon screenshot</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Download a screenshot.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * <li> Screenshot name
	 * </ol>
	 *
	 * <p>
	 * Returns:
	 * <ul>
	 *   <li> checksum, <code>\n</code>
	 *   <li> file size in bytes, <code>\n</code>
	 *   <li> content of the image file as a byte stream
	 *   <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 */
	CMD_SCREENSHOT,

	/**
	 * <code>CMD_VOTE name vote</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Vote on an add-on.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * <li> Vote (as string) 1-10
	 * </ol>
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_VOTE,

	/**
	 * <code>CMD_GET_VOTE name</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * How the user voted an add-on.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * </ol>
	 *
	 * <p>
	 * Returns: <code>NOT_LOGGED_IN\n</code>, or vote as string followed by <code>\nENDOFSTREAM\n</code>
	 */
	CMD_GET_VOTE,

	/**
	 * <code>CMD_COMMENT name version lines</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Comment on an add-on.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * <li> Add-on version
	 * <li> Number of lines in the message
	 * </ol>
	 * Then, on separate lines, the actual message; then <code>ENDOFSTREAM\n</code>.
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_COMMENT,

	/**
	 * <code>CMD_EDIT_COMMENT [CV 1: name] index lines</code>
	 *
	 * <p>
	 * Supported command versions: 1-2 (default: 4/1, 5/2)
	 *
	 * <p>
	 * Edit an existing comment.
	 *
	 * <p> Parameters:
	 * <ul>
	 * <li> CV 1:
	 * <ol>
	 *     <li> Add-on name
	 *     <li> Index of the comment.
	 *     <li> Number of lines in the message
	 * </ol>
	 * <li> CV 2+:
	 * <ol>
	 *     <li> Database ID of the comment.
	 *     <li> Number of lines in the message
	 * </ol>
	 * </ul>
	 * Then, on separate lines, the actual message; then <code>ENDOFSTREAM\n</code>.
	 *
	 * <p>
	 * In CV 2+, 0 lines denote deletion of the comment.
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_EDIT_COMMENT,

	/**
	 * <code>CMD_SUBMIT name</code>
	 *
	 * <p>
	 * Supported command versions: 1-2 (default: 1)
	 *
	 * <p>
	 * Upload an add-on.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * </ol>
	 *
	 * <p> In CV 1:
	 * Then, on the next line, the content of the add-on like the response for <code>CMD_DOWNLOAD</code>,
	 * terminated by <code>ENDOFSTREAM\n</code>.
	 *
	 * <p> In CV 2+:
	 * Then, on the next lines:
	 * <ul>
	 *   <li> Integer string denoting number <var>D</var> of directories, <code>\n</code>
	 *   <li> For each of the <var>D</var> directories:
	 *   <ul>
	 *     <li> Directory name with full path, <code>\n</code>
	 *     <li> Number <var>F</var> of regular files in the directory, <code>\n</code>
	 *     <li> For each of the <var>F</var> files in the directory:
	 *     <ul>
	 *       <li> filename, <code>\n</code>
	 *       <li> checksum, <code>\n</code>
	 *       <li> filesize in bytes, <code>\n</code>
	 *     </ul>
	 *   </ul>
	 *   <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 * The server then uses the checksums to determine which files the server needs to send and replies:
	 * <ul>
	 *   <li> Integer string denoting number <var>N</var> of files to send, <code>\n</code>
	 *   <li> For each of the <var>N</var> files:
	 *   <ul>
	 *     <li> The file's directory, <code>\n</code>
	 *     <li> The file's filename, <code>\n</code>
	 *   </ul>
	 *   <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 * The client then sends the content of each file as a byte stream with no
	 * separators between them, terminated by <code>ENDOFSTREAM\n</code>.
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_SUBMIT,

	/**
	 * <code>CMD_SUBMIT_SCREENSHOT name filesize checksum whitespaces description</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Upload a screenshot.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * <li> Filesize in bytes
	 * <li> The file's checksum
	 * <li> Number of whitespaces in the description
	 * <li> Screenshot description
	 * </ol>
	 * Then, on the next line, the content of the image file like for <code>CMD_SCREENSHOT</code>, terminated by
	 * <code>ENDOFSTREAM\n</code>.
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_SUBMIT_SCREENSHOT,

	/**
	 * <code>CMD_CONTACT lines</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Send an enquiry to the Widelands Development Team.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Number of lines in the message
	 * </ol>
	 * Then, on separate lines, the actual message; then <code>ENDOFSTREAM\n</code>.
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_CONTACT,

	/**
	 * <code>CMD_SETUP_TX name</code>
	 *
	 * <p>
	 * Supported command versions: 1-2 (default: 1)
	 *
	 * <p>
	 * Set up transifex integration for an add-on. Only admins may do this.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * </ol>
	 * In CV 2+, then on separate lines:
	 * <ul>
	 * <li> Priority (one of "normal", "high", "urgent")
	 * <li> Display Name
	 * <li> Categories (a JSON list of 1 or more strings)
	 * <li> ENDOFSTREAM
	 * </ul>
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_SETUP_TX,

	/**
	 * <code>CMD_ADMIN_DELETE name lines</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Added in PV 5.
	 * Irrevocably delete an add-on and all its metadata and translations from
	 * the server and from Transifex. Only admins may do this.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * <li> Number of lines in the reason
	 * </ol>
	 * Then, on separate lines, the human-readable message explaining why the add-on was deleted,
	 * then <code>ENDOFSTREAM\n</code>.
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_ADMIN_DELETE,

	/**
	 * <code>CMD_ADMIN_VERIFY name verify</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Added in PV 5.
	 * Change the verification status of an add-on. Only admins may do this.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * <li> 1 to verify the add-on, 0 to mark it unsafe
	 * </ol>
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_ADMIN_VERIFY,

	/**
	 * <code>CMD_ADMIN_QUALITY name quality</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Added in PV 5.
	 * Change the quality rating of an add-on. Only admins may do this.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * <li> New quality rating (1-3), 0 for not assessed
	 * </ol>
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_ADMIN_QUALITY,

	/**
	 * <code>CMD_ADMIN_SYNC_SAFE name state</code>
	 *
	 * <p>
	 * Supported command versions: 1 (default: 1)
	 *
	 * <p>
	 * Added in PV 5.
	 * Change the sync safety status of an add-on. Only admins may do this.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * <li> 1 to mark the add-on sync-safe, 0 to mark it as desyncing
	 * </ol>
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_ADMIN_SYNC_SAFE,
}
// clang-format on
