# wl_addons_server
Repository faking an add-ons server for @widelands. Contains a handful of example add-ons for Widelands.

I don't know how long this "server" will be in use, so I'd better write some brief documentation about maintenance here.

### Adding a new add-on

Just add it to the `addons/` folder, then run `buildcats.sh`, then git add,commit,push.

### Updating a new add-on

Just replace the add-on's entry in the `addons/` folder with the new one, then run `buildcats.sh`, then git add,commit,push.

### Updating translations

When you updated any of the files in `po/` or added new ones, run `buildcats.sh`, then git add,commit,push.

### Verifying add-ons

Run `java UpdateList §cool_feature.wad` (don't forget the '§' before the add-on's name!), then run `buildcats.sh`, then git add,commit,push.

### Notes

Updating an add-on will automatically set it to Not Verified. It is not allowed to mark an add-on as verified during the update.

`buildcats.sh` and `java UpdateList` need to be run from the base folder. Run `javac UpdateList.java` before using either command the first time.

`buildcats.sh` usually prints some errors which are false alarms. Sometimes it may create new files called `"*.po"` (yes, with an asterisk in the filename!) in the `po/` folder which need to be deleted manually before `git add`ing. This script is not clever enough to catch translatable strings in config scripts (such as a map's `elemental` file), except for the `addon` file.
