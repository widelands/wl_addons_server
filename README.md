# wl_addons_server
Repository faking an add-ons server for [@widelands](https://github.com/widelands/widelands). Contains a handful of example add-ons for Widelands.

I don’t know how long this "server" will be in use, so I’d better write some brief documentation about maintenance here.

### Adding a new add-on

Just add it to the `addons/` folder, then run `buildcats.sh`, then git add,commit,push.

### Updating an add-on

Just replace the add-on’s entry in the `addons/` folder with the new one, then run `buildcats.sh`, then git add,commit,push.

### Updating translations

When you updated any of the files in `po/` or added new ones, run `buildcats.sh`, then git add,commit,push.

### Verifying add-ons

Run `java UpdateList §cool_feature.wad` (don’t forget the '§' before the add-on’s name!), then run `buildcats.sh`, then git add,commit,push.

### Notes

Updating an add-on will automatically set it to Not Verified. It is not allowed to mark an add-on as verified during the update.

`buildcats.sh` and `java UpdateList` need to be run from the base folder. Run `javac UpdateList.java` before using either command the first time.

`buildcats.sh` usually prints some errors which are false alarms. Sometimes it may create new files called `"*.po"` (yes, with an asterisk in the filename!) in the `po/` folder which need to be deleted manually before `git add`ing. This script is not clever enough to catch translatable strings in config scripts (such as a map’s `elemental` file), except for the `addon` file.

[Further info about add-ons can be found here.](https://github.com/Noordfrees/widelands/blob/addons/doc/sphinx/source/add-ons.rst)

### Issues

If you encounter any issues related to add-ons, please **do not report them against the official game**! Report them on this repository instead.

Keep in mind that currently some of the add-ons here are meant as proof-of-concept dummies. Please do not report any errors regarding those. Also don’t forget that the add-ons feature is still under development and not even part of the official game yet.

Issues not directly related to add-ons should be reported [against the official game](https://github.com/widelands/widelands/issues).

### Contributing

If you want to contribute a new add-on, update an existing one, or submit new or updated translations, open a pull request with this change and make sure you followed the steps described above.

### License

This repository and its contents are published under the same license as Widelands: [The GNU General Public License (GPL) v2.](https://github.com/widelands/widelands/blob/master/COPYING)
