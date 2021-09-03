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

// clang-format off
/**
 * This enum lists all commands that can be sent from clients to the server.
 * <p>
 * After the first contact, the client must send the following info:
 * <ul>
 *  <li> Protocol version, <code>\n</code>
 *  <li> Language name (e.g. "nds"), <code>\n</code>
 *  <li> {@literal Protocol version >= 5}: Widelands version (e.g. "1.1~git34567"), <code>\n</code>
 *  <li> Username (or "" for no user), <code>\n</code>
 *  <li> <code>ENDOFSTREAM\n</code>
 * </ul>
 * If the username is "", the server then replies <code>ENDOFSTREAM\n</code>.
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
 * </ul></ul>
 *
 * <p>
 * The currently supported protocol versions are 4 to 5. All documentation here refers to these
 * versions. Note that compatibility for <strong>all</strong> versions <strong>ever introduced</strong> needs to be maintained
 * <strong>indefinitely</strong>. The first supported version is 4; the version numbers 1-3 are used by the legacy
 * "GitHub Repo List" format.
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
 *   <li> {@literal Protocol version >= 2}: Average client lifetime in seconds, <code>\n</code>
 *   <li> Protocol version 1:
 *       <ul><li> Number of current registered users, <code>\n</code>
 *       <li> Number of current unregistered users, <code>\n</code>
 *       </ul>
 *   <li> Protocol version 2:
 *       <ul><li> Counter of registered users, <code>\n</code>
 *       <li> Counter of unregistered users, <code>\n</code>
 *       </ul>
 *   <li> Counter of unique registered users, <code>\n</code>
 *   <li> {@literal Protocol version <= 1}: Counter of successful connection attempts, <code>\n</code>
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
 *   <li> {@literal Protocol version >= 2}: Counter of <code>CMD_ADMIN_DELETE    </code> requests, <code>\n</code>
 *   <li> {@literal Protocol version >= 2}: Counter of <code>CMD_ADMIN_VERIFY    </code> requests, <code>\n</code>
 *   <li> {@literal Protocol version >= 2}: Counter of <code>CMD_ADMIN_QUALITY   </code> requests, <code>\n</code>
 *   <li> {@literal Protocol version >= 2}: Counter of <code>CMD_ADMIN_SYNC_SAFE </code> requests, <code>\n</code>
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
	 * <code>CMD_LIST [5+: all]</code>
	 *
	 * <p>
	 * List all available add-on names.
	 *
	 * <p>
	 * In version 4, no arguments are accepted.
	 * In version 5, a boolean argument is required to indicate whether to list
	 * all add-ons or only add-ons compatible with the Widelands version.
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
	 * Returns detailed info about a specific addon.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
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
	 *  <li> {@literal Protocol version <= 4}: name of the main uploader, <code>\n</code>
	 *  <li> {@literal Protocol version >= 5}: comma-separated list of uploaders, <code>\n</code>
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
	 *      <li> {@literal Protocol version >= 5}: Comment ID, <code>\n</code>
	 *      <li> name, <code>\n</code>,
	 *      <li> timestamp, <code>\n</code>,
	 *      <li> last editor name (may be empty), <code>\n</code>,
	 *      <li> last edit timestamp, <code>\n</code>,
	 *      <li> version, <code>\n</code>,
	 *      <li> number of <code>\n</code> characters in the message, <code>\n</code>
	 *      <li> message, <code>\n</code>
	 * </ul>
	 *  <li> "verified" or "unchecked", <code>\n</code>
	 *  <li> {@literal Protocol version >= 5}: Code quality rating (1-3) <code>\n</code>
	 *  <li> icon checksum (0 for no icon), <code>\n</code>
	 *  <li> icon filesize (0 for no icon), <code>\n</code>
	 *  <li> icon file as a byte stream
	 *  <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 */
	CMD_INFO,

	/**
	 * <code>CMD_DOWNLOAD name</code>
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
	 *     <li> Number <var>F</var> of regular files in the directory, <code>\n</code>
	 *     <li> For each of the <var>F</var> files in the directory:
	 *       <li> filename, <code>\n</code>
	 *       <li> checksum, <code>\n</code>
	 *       <li> filesize in bytes, <code>\n</code>
	 *       <li> The content of the file as a byte stream
	 *   <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 */
	CMD_DOWNLOAD,

	/**
	 * <code>CMD_I18N name</code>
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
	 *     <li> <var>{@literal<language_name>}</var>.mo, <code>\n</code>
	 *     <li> checksum, <code>\n</code>
	 *     <li> MO file size in bytes, <code>\n</code>
	 *     <li> The content of the MO file as a byte stream, <code>\n</code>
	 *   <li> <code>ENDOFSTREAM\n</code>
	 * </ul>
	 */
	CMD_I18N,

	/**
	 * <code>CMD_SCREENSHOT addon screenshot</code>
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
	 * <code>CMD_EDIT_COMMENT [4: name] index lines</code>
	 *
	 * <p>
	 * Edit an existing comment.
	 *
	 * <p> Parameters:
	 * <ul>
	 * <li> Protocol version 4:
	 * <ol>
	 *     <li> Add-on name
	 *     <li> Index of the comment.
	 *     <li> Number of lines in the message
	 * </ol>
	 * <li> Protocol version 5:
	 * <ol>
	 *     <li> Database ID of the comment.
	 *     <li> Number of lines in the message
	 * </ol>
	 * </ul>
	 * Then, on separate lines, the actual message; then <code>ENDOFSTREAM\n</code>.
	 *
	 * <p>
	 * In {@literal protocol version >= 5}, 0 lines denote deletion of the comment.
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_EDIT_COMMENT,

	/**
	 * <code>CMD_SUBMIT name</code>
	 *
	 * <p>
	 * Upload an add-on.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * </ol>
	 * Then, on the next line, the content of the add-on like the response for <code>CMD_DOWNLOAD</code>,
	 * terminated by <code>ENDOFSTREAM\n</code>.
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_SUBMIT,

	/**
	 * <code>CMD_SUBMIT_SCREENSHOT name filesize checksum whitespaces description</code>
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
	 * Set up transifex integration for an add-on. Only admins may do this.
	 *
	 * <p> Parameters:
	 * <ol>
	 * <li> Add-on name
	 * </ol>
	 *
	 * <p>
	 * Returns: <code>ENDOFSTREAM\n</code> or an error message followed by <code>\n</code>
	 */
	CMD_SETUP_TX,

	/**
	 * <code>CMD_ADMIN_DELETE name lines</code>
	 *
	 * <p>
	 * Added in protocol version 5.
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
	 * Added in protocol version 5.
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
	 * Added in protocol version 5.
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
	 * Added in protocol version 5.
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
