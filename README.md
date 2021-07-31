# wl_addons_server
Repository providing an add-ons server for [@widelands](https://github.com/widelands/widelands).
---

If you want to contribute a new add-on, [information how to create add-ons can be found here.](https://github.com/widelands/widelands/blob/master/doc/sphinx/source/add-ons.rst)

New add-ons, or upgrades for existing ones, as well as new or updated screenshots, can be uploaded to the server from the in-game add-ons manager (Widelands 1.1 or newer). Alternatively it is possible to submit them by creating a pull request here. If you do not wish to do this, it is also possible to submit add-ons and screenshots on the forum: https://www.widelands.org/forum/topic/5073

### Prerequisites

Before running the server or adding add-ons to this repository be sure a java development kit (JDK) is installed to compile the Java programs.

### The server

Before starting the server, ensure that a MySQL server is running somewhere with the following settings:
- There is a database with two tables in it:
    - `auth_user`: Contains at least an `int` column `id` and a `varchar` column `username`.
    - `wlggz_ggzauth`: Contains at least an `int` column `user_id`, a `varchar` column `password`, and an `int` column `permissions` (in which `7` means normal user and `127` means admin).
- There needs to be a user with read access to both tables.

Further, ensure that an ini-style config file called `config` exists in the working directory which contains the following keys:

Key                | Description                                                        | Example
------------------ | ------------------------------------------------------------------ | ------------------------------------------------------
`port`             | Port number for the server                                         | `7388`
`githubusername`   | User name for GitHub                                               | `bunnybot`
`githubtoken`      | Personal Access Token for GitHub                                   | `123456abcdef`
`uservotesdir`     | Directory where users’ votes are stored                            | `/home/bunnybot/addons_server/uservotes`
`databasename`     | Connection line for the database                                   | `jdbc:mysql://localhost:3306/widelands_addons_server`
`databaseuser`     | Database user name                                                 | `someuser`
`databasepassword` | Password of the database user                                      | `123456`
`deploy`           | Whether this server is the real thing, not just a test environment | `true` or `false`

Starting the add-ons webserver is as simple as typing `./server.sh`. This will launch the webserver on the specified port of your machine. In order to connect to this server from the game, run Widelands with the commandline parameters `--addon_server_ip=127.0.0.1 --addon_server_port=7388` (where you replace `127.0.0.1` with the IP of the machine on which you’re running the server and `7388` with the port number from the config file).
Note that the server runs as a daemon; that is, it is independent from your process and all output is redirected to a file called `server.log` which will be overwritten on every run. To terminate the server daemon, retrieve the PID of the process from the second line of the logfile and then type `kill <PID>`.

The server protocol is documented in `wl/server/Command.java`.

Widelands version 1.0 and older does not connect to the server. It instead downloads and parses the `list*` files in this repository and then downloads each file belonging to an add-on separately. Every change to an add-on must therefore be reflected in the `list*` files so that the full add-on selection is available also to Widelands 1.0 users.   
For this reason, the server automatically syncs its repo checkout with the GitHub repo every night. Normally, all required steps are done fully automatically. Occasionally, a merge conflict may arise which may prove too difficult for the server to handle on its own.   
Whenever an error that requires a maintainer’s attention occurs on the add-ons server, a notification will automatically be posted to https://github.com/widelands/wl_addons_server/issues/31. See there for instructions how to handle.

### Adding / updating an add-on

__This section explains how to add an add-on *manually* to this repository. It is strongly recommended to use the in-game add-ons manager instead, which will take care of everything automatically.__

#### Add-On

Just copy the folder from the widelands directory to the `addons/` folder in your branch.

#### Screenshots

If you want to provide some screenshots for your addon, add the screenshots to the subfolder `screenshots/name_of_addon.wad` and create a file called `descriptions`. Refer to the examples to get used to this file.

#### Apply changes

After adding the addon and probably some screenshots, run `./update_lists.sh` inside the base folder, then git add,commit,push. Then create a pull request here.

If you added a new add-on, the `UpdateList` program will prompt you to enter your uploader name.

#### Updating an add-on

Just replace the folder below `addons` with the new one.
Same applies to screenshots: Just replace or add new ones. Be sure to update the `descriptions` file.

After **any** change to an add-on’s contents (even very small ones), you need to increase the add-on’s version number.

After you have done run `./update_lists.sh`, then git add,commit,push.

#### Verifying add-ons

Verifying add-ons is done by a member of the widelands development team. Updating an add-on will automatically set it to Not Verified. It is not allowed to mark an add-on as verified during the update.

#### Issues

If you encounter any issues related to a specific add-on, please **do not report them against the official game**! Report them on this repository instead.

Keep in mind that currently some of the add-ons here are meant as proof-of-concept dummies. Please do not report any errors regarding those.

Issues related to the add-on system in general, or not related to add-ons at all, should be reported [against the official game](https://github.com/widelands/widelands/issues).

### Developers’ corner

#### Verify a new or updated add-on

Verification of **new** add-ons should be done **only** by a developer who is also a Transifex administrator!

To verify a new add-on (or an existing one after an update), read the code carefully and make sure it does not contain malicious code. Also check for potentially desync-prone code pieces and set the `sync_safe` key in the add-on’s `addon` file to the appropriate value. Then run `./update_lists.sh '/cool_feature.wad'` (don’t forget the '/' before the add-on’s name!), then git add,commit,push.

If the add-on was not up for translation on Transifex yet, you need to follow these steps afterwards to ensure that it can be translated:
- Run `./setup_tx.sh cool_feature.wad` (where `cool_feature.wad` is the name of the add-on), then git add,commit,push.
- Go to the repository’s Actions tab, select the ‘Update Translations’ action, and trigger a workflow run on the master branch.
- Wait until the workflow completed (should take only a few minutes).
- Head over to https://www.transifex.com/widelands/widelands-addons/content/ and wait until the new resource(s) is/are available.
- Edit each new resource’s name to match with the add-on’s name by clicking on the resource and choosing ··· → Settings. Only change the display name – **never, ever** modify the resource’s slug!
- Finally, set the Priority of all new resources. Add-ons officially provided by the Widelands Development Team get highest priority. Add-ons which have not been verified yet should not appear on Transifex in the first place, but if they do, they get the lowest priority. All other add-ons get medium priority. Also add appropriate category tags to the resources: Every resource gets the add-on’s category as a tag. The few official add-ons also get the "Official" tag and perhaps other tags as appropriate (e.g. "Tournament" for add-ons used in an official tournament).

#### Translations

Translating should be done on Transifex: https://www.transifex.com/widelands/widelands-addons/   
Do not modify any of the files in `po/` manually – your changes will be discarded during the automated translation updates.

A GitHub action periodically syncs the translations with Transifex and compiles them by running `buildcats.sh`. **Do not** run this script manually! If you have to do it anyway for some reason, do this **only** on the master branch.

#### Notes

If you want to submit a new add-on or update an existing one without using the in-game add-ons manager, open a pull request with this change and make sure you followed the steps described above. In particular, be sure to re-run `./update_lists.sh` after *every* change (even small ones!).

### License

This repository and its contents are published under the same license as Widelands: [The GNU General Public License (GPL) v2.](https://github.com/widelands/widelands/blob/master/COPYING)

The file `mysql-connector-java-8.0.23.jar` is third-party code which we use with great gratitude to the authors. It contains its own LICENSE file.
