# wl_addons_server
Repository faking an add-ons server for [@widelands](https://github.com/widelands/widelands). Contains a handful of example add-ons for Widelands.

I don’t know how long this "server" will be in use, so I’d better write some brief documentation about maintenance here.

If you want to contribute a new add-on, [information how to create add-ons can be found here.](https://github.com/widelands/widelands/blob/master/doc/sphinx/source/add-ons.rst)

If you do not wish to create a pull request for a new add-on here, it is also possible to submit add-ons on the forum: https://www.widelands.org/forum/topic/5073

### Prerequisites

Before adding add-ons to this repository be sure a java development kit (JDK) is installed to compile the UpdateList.java script.

After the installation of the JDK run `javac UpdateList.java` in the base folder.

### Adding updating a new add-on

#### Addon

Just copy the folder from the widelands directory to the `addons/` folder in your branch.

#### Screenshots

If you want to provide some screenshots for your addon, add the screenshots to the subfolder `screenshots/name_of_addon.wad` and create a file called `descriptions`. Refer to the examples to get used to this file.

#### Apply changes

After adding the addon and probably some screenshots, run `java UpdateList` inside the base folder, then git add,commit,push. Then create a pull request here.

#### Updating an add-on

Just replace the folder below `addons` with the new one.
Same applies to screenshots: Just replace or add new ones. Be sure to update the `descriptions` file.

After you have done run `java UpdateList`, then git add,commit,push.

#### Name of Uploader

The name of the uploader of a new add-on is automatically set to `"Nordfriese"` – if you are not me, consider editing the files `list` and `list_2` manually after running `java UpdateList` to replace it with your name. (Each add-on's uploader is listed directly below the author's name.)

#### Verifying add-ons

Verifying add-ons is done by a member of the widelands development team. Updating an add-on will automatically set it to Not Verified. It is not allowed to mark an add-on as verified during the update.

#### Issues

If you encounter any issues related to add-ons, please **do not report them against the official game**! Report them on this repository instead.

Keep in mind that currently some of the add-ons here are meant as proof-of-concept dummies. Please do not report any errors regarding those.

Issues not directly related to add-ons should be reported [against the official game](https://github.com/widelands/widelands/issues).

### Developers’ corner

#### Verify a new add-on

To verify a new add-on, read the code carefully and make sure it does not contain malicious code. Then run `java UpdateList '/cool_feature.wad'` (don’t forget the '/' before the add-on’s name!), then run `java UpdateList`, then git add,commit,push.

#### Translations

Translating should be done on Transifex: https://www.transifex.com/widelands/widelands-addons/
Note that Transifex's automated translations sync will only send the translations to this repo when a resource is 100% translated in a language.

Do not modify any of the files in `po/` manually.

A GitHub action periodically syncs the translations with Transifex and compiles them by running `buildcats.sh`. **Do not** run this script manually! If you have to do it anyway for some reason, do this **only** on the master branch.

#### Notes

`buildcats.sh` usually prints some errors which are false alarms. This script is not clever enough to catch translatable strings in config scripts (such as a map’s `elemental` file), except for the `addon` file.

If you want to update an existing add-on, or submit new or updated translations, open a pull request with this change and make sure you followed the steps described above.

After adding or deleting add-ons, the Transifex resource info needs to be updated by a Transifex admin. See https://github.com/widelands/wl_addons_server/issues/1 for more information.

### License

This repository and its contents are published under the same license as Widelands: [The GNU General Public License (GPL) v2.](https://github.com/widelands/widelands/blob/master/COPYING)
