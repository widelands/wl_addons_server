# wl_addons_server
Repository providing an add-ons server for [@widelands](https://github.com/widelands/widelands).
---

If you want to contribute a new add-on, [information how to create add-ons can be found here.](https://github.com/widelands/widelands/blob/master/doc/sphinx/source/add-ons.rst)

New add-ons, or upgrades for existing ones, as well as new or updated screenshots, can be uploaded to the server from the in-game add-ons manager (Widelands 1.1 or newer). It is also possible to submit add-ons and screenshots on the forum: https://www.widelands.org/forum/topic/5073

## Prerequisites

Before running the server, be sure a Java Development Kit (JDK) is installed to compile the Java programs.

## The Server

Before starting the server, ensure that a MySQL server is running somewhere, and that an ini-style config file called `config` exists in the working directory. The setup is detailed below.

### Usage

Starting the add-ons webserver is as simple as typing `./server.sh`. This will launch the webserver on the specified port of your machine. In order to connect to this server from the game, run Widelands with the commandline parameters `--addon_server_ip=127.0.0.1 --addon_server_port=7388` (where you replace `127.0.0.1` with the IP of the machine on which you’re running the server and `7388` with the port number from the config file).
Note that the server runs as a daemon; that is, it is independent from your process and all output is redirected to a file called `server.log` which will be overwritten on every run. To terminate the server daemon, retrieve the PID of the process from the second line of the logfile and then type `kill <PID>`.

The server protocol is documented in `wl/server/Command.java`.

Widelands version 1.0 and older does not connect to the server. It instead downloads and parses the `list*` files in this repository and then downloads each file belonging to an add-on separately. Every change to an add-on must therefore be reflected in the `list*` files so that the full add-on selection is available also to Widelands 1.0 users.   
For this reason, the server automatically syncs its repo checkout with the GitHub repo every night. Normally, all required steps are done fully automatically. Occasionally, a merge conflict may arise which may prove too difficult for the server to handle on its own.   
Whenever an error that requires a maintainer’s attention occurs on the add-ons server, an e-mail notification will automatically be posted to all subscribed maintainers.

### The `config` File

Key                           | Description                                                                 | Example
----------------------------- | --------------------------------------------------------------------------- | -----------------------------
`port`                        | Port number for the server                                                  | `7388`
`githubusername`              | User name for GitHub                                                        | `bunnybot`
`githubtoken`                 | Personal Access Token for GitHub                                            | `123456abcdef`
`transifextoken`              | Bearer token for Transifex                                                  | `1/abcdef123456`
`muninpassword`               | Arbitrary password for munin integration scripts                            | `123456`
`databasehost`                | IP address of the MySQL server                                              | `127.0.0.1`
`databaseport`                | Port number of the MySQL server                                             | `3306`
`website_database`            | Name of the website database                                                | `wl_addons_server_website`
`website_db_user`             | The database user of the websitedatabase                                    | `websiteuser`
`website_db_password`         | Password for the website database user                                      | `123456`
`addons_database`             | Name of the add-ons database                                                | `wl_addons_server_addons`
`addons_db_user`              | The database user of the addons database                                    | `addonuser`
`addons_db_password`          | Password of the addons database user                                        | `123456`
`noticetype_new`              | Name of the notice type for new add-ons in the website database             | `new`
`noticetype_deleted`          | Name of the notice type for add-on deletion in the website database         | `deleted`
`noticetype_transifex-issues` | Name of the notice type for Transifex string issues in the website database | `transifex-issues`
`noticetype_comment-added`    | Name of the notice type for new comments in the website database            | `comment-added`
`noticetype_comment-mention`  | Name of the notice type for @mentions in comments in the website database   | `comment-mention`
`deploy`                      | Whether this server is the real thing, not just a test environment          | `true` or `false`

### The Database

The MySQL server needs to have two databases called the *website database* and the *add-ons database*. You can also use just one database which meets the specifications of both, but it is recommended to keep them separate. There needs to be a MySQL user with `SELECT` access to the website database and (`SELECT`, `INSERT`, `DELETE`) access to the add-ons database.

#### The Website Database

Table                        | Column Names                                              | Column Types                                       | Comment
---------------------------- | ----------------------------------------------------------| -------------------------------------------------- | -------
`auth_user`                  | `id`      <br> `username`       <br> `email`              | `int` <br> `varchar` <br> `varchar`                | 
`wlggz_ggzauth`              | `user_id` <br> `password`       <br> `permissions` <br>   | `int` <br> `varchar` <br> `int` <br>               | -<br>-<br> `7` means normal user,<br>`127` means admin
`wladdons_settings_addonnoticetype` | `id`      <br> `slug` <br> `send_default` <br> `author_related_default` | `int` <br> `varchar` <br> `tinyint` <br> `tinyint` | 
`wladdons_settings_addonnoticeuser` | `user_id` <br> `notice_type_id`           <br> `shouldsend`             | `int` <br> `int`                    <br> `tinyint` | 

#### The Add-Ons Database

Table          | Column Names                                              | Column Types                                       | Comment
-------------- | ----------------------------------------------------------| -------------------------------------------------- | -------
`txissues`     | `id`                                                      | `varchar`                                          |
`addons`       | `id` <br> `name` <br> `timestamp` <br> `edit_timestamp` <br> `i18n_version` <br> `security` <br> `quality` <br> `downloads` | `int` <br> `varchar` <br> `bigint` <br> `bigint` <br> `int` <br> `tinyint` <br> `int` <br> `int` | Unique add-on ID<br>-<br>-<br>-<br>-<br> `0` means unchecked, `1` means verified <br> `0` means unchecked, `1`/`2`/`3` means Poor/Good/Excellent <br>-
`uploaders`    | `addon` <br> `user`                                       | `int` <br> `int`                                   | An add-on can have multiple uploaders.<br>Each uploader goes on a separate row.
`uservotes`    | `addon` <br> `user` <br> `vote`                           | `int` <br> `int` <br> `int`                        |
`usercomments` | `id` <br> `addon` <br> `user` <br> `timestamp` <br> `editor` <br> `edit_timestamp` <br> `version` <br> `message` | `int` <br> `int` <br> `int` <br> `bigint` <br> `int` <br> `bigint` <br> `varchar` <br> `varchar` | Unique comment ID<br>-<br>-<br>-<br> May be `NULL` <br> May be `NULL` <br>-<br>-
`notifyadmins` | `email` <br> `level` | `varchar` <br> `int` | -<br> `0` means disabled, `1` critical only, `2` all notices

## Developers’ Corner

### Verify a New or Updated Add-On

To verify a new add-on (or an existing one after an update), read the code carefully and make sure it does not contain malicious code. Also check for potentially desync-prone code pieces. Then, in the Widelands add-on manager, select the add-on in the Browse tab, go to the Comments & Votes window, and use the admin interface to set the add-on’s security, sync-safety, and quality properties as appropriate.

If the add-on was not up for translation on Transifex yet, additionally enable Transifex integration for the add-on via the admin interface. You will need to set the Display Name (which should match the add-on’s name) and the Priority of the new resource. Add-ons officially provided by the Widelands Development Team get highest priority. Add-ons which have not been verified yet should not appear on Transifex in the first place, but if they do, they get the lowest priority. All other add-ons get medium priority. Also add appropriate category tags to the resources: Every resource gets the add-on’s category as a tag. The few official add-ons also get the "Official" tag and perhaps other tags as appropriate (e.g. "Tournament" for add-ons used in an official tournament).

### Maintainer E-Mail Subscriptions

Anyone who wants to be dropped a notification about important events such as server sync errors or add-on submissions should add themselves to the `notifyadmins` table. Use subscription level `1` to subscribe only to critical events, or any higher number to subscribe to all numbers; `0` disables notifications.
```
insert into notifyadmins (email, level) value ('my.address@example.com', 2);
```

### Translations

Translating should be done on Transifex: https://www.transifex.com/widelands/widelands-addons/   
Do not modify any of the files in `po/` manually – your changes will be discarded during the automated translation updates.

The server periodically syncs the translations with Transifex and compiles them for download.

### Issues

If you encounter any issues related to a specific add-on, please **do not report them against the official game**! Report them on this repository instead.

Issues related to the add-on system in general, or not related to add-ons at all, should be reported [against the official game](https://github.com/widelands/widelands/issues).

Keep in mind that some of the add-ons here (only the ‘Dummy Campaign’ currently) are meant as proof-of-concept dummies. Please do not report any errors regarding those.

## License

This repository and its contents are published under the same license as Widelands: [The GNU General Public License (GPL) v2.](https://github.com/widelands/widelands/blob/master/COPYING)

The file `mysql-connector-java-8.0.23.jar` is third-party code which we use with great gratitude to the authors. It contains its own LICENSE file.
The file `json-simple-1.1.1.jar` is third-party code which we use with great gratitude to the authors. It is licensed under the [Apache License 2.0](https://code.google.com/archive/p/json-simple/).
