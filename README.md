# wl_addons_server
Repository faking an add-ons server for [@widelands](https://github.com/widelands/widelands). Contains a handful of example add-ons for Widelands.

I don’t know how long this "server" will be in use, so I’d better write some brief documentation about maintenance here.

---

If you want to contribute a new add-on, [information how to create add-ons can be found here.](https://github.com/widelands/widelands/blob/master/doc/sphinx/source/add-ons.rst)

If you do not wish to create a pull request for a new add-on here, it is also possible to submit add-ons on the forum: https://www.widelands.org/forum/topic/5073

### Prerequisites

Before adding add-ons to this repository be sure a java development kit (JDK) is installed to compile the UpdateList.java script.

After the installation of the JDK run `javac *.java` in the base folder.

### Adding / updating an add-on

#### Add-On

Just copy the folder from the widelands directory to the `addons/` folder in your branch.

#### Screenshots

If you want to provide some screenshots for your addon, add the screenshots to the subfolder `screenshots/name_of_addon.wad` and create a file called `descriptions`. Refer to the examples to get used to this file.

#### Apply changes

After adding the addon and probably some screenshots, run `java UpdateList` inside the base folder, then git add,commit,push. Then create a pull request here.

If you added a new add-on, the `UpdateList` program will prompt you to enter your uploader name.

#### Updating an add-on

Just replace the folder below `addons` with the new one.
Same applies to screenshots: Just replace or add new ones. Be sure to update the `descriptions` file.

After **any** change to an add-on’s contents (even very small ones), you need to increase the add-on’s version number.

After you have done run `java UpdateList`, then git add,commit,push.

#### Verifying add-ons

Verifying add-ons is done by a member of the widelands development team. Updating an add-on will automatically set it to Not Verified. It is not allowed to mark an add-on as verified during the update.

#### Issues

If you encounter any issues related to a specific add-on, please **do not report them against the official game**! Report them on this repository instead.

Keep in mind that currently some of the add-ons here are meant as proof-of-concept dummies. Please do not report any errors regarding those.

Issues related to the add-on system in general, or not related to add-ons at all, should be reported [against the official game](https://github.com/widelands/widelands/issues).

### Developers’ corner

#### Verify a new or updated add-on

Verification of **new** add-ons should be done **only** by a developer who is also a Transifex administrator!

To verify a new add-on (or an existing one after an update), read the code carefully and make sure it does not contain malicious code. Also check for potentially desync-prone code pieces and set the `sync_safe` key in the add-on’s `addon` file to the appropriate value. Then run `java UpdateList '/cool_feature.wad'` (don’t forget the '/' before the add-on’s name!), then git add,commit,push.

If the add-on was not up for translation on Transifex yet, you need to follow these steps afterwards to ensure that it can be translated:
- Run `buildcats.sh` and then `setup_tx.sh cool_feature.wad` (where `cool_feature.wad` is the name of the add-on), then git add,commit,push.
- Go to the repository’s Actions tab, select the 'Update Translations' action, and trigger a workflow run on the master branch.
- Wait until the workflow completed (should take only a few minutes).
- Head over to https://www.transifex.com/widelands/widelands-addons/content/ and wait until the new resource(s) is/are available.
- Edit each new resource’s name to match with the add-on’s name by clicking on the resource and choosing ··· → Settings. Only change the display name – **never, ever** modify the resource’s slug!
- Finally, set the Priority of all new resources. Add-ons officially provided by the Widelands Development Team get highest priority. Add-ons which have not been verified yet should not appear on Transifex in the first place, but if they do, they get the lowest priority. All other add-ons get medium priority. Also add appropriate category tags to the resources: Every resource gets the add-on’s category as a tag. The few official add-ons also get the "Official" tag and perhaps other tags as appropriate (e.g. "Tournament" for add-ons used in an official tournament).

#### Translations

Translating should be done on Transifex: https://www.transifex.com/widelands/widelands-addons/   
Do not modify any of the files in `po/` manually – your changes will be discarded during the automated translation updates.

A GitHub action periodically syncs the translations with Transifex and compiles them by running `buildcats.sh`. **Do not** run this script manually! If you have to do it anyway for some reason, do this **only** on the master branch.

#### Notes

If you want to update an existing add-on, or submit new or updated translations, open a pull request with this change and make sure you followed the steps described above. In particular, be sure to re-run `java UpdateList` after *every* change (even small ones!).

### License

This repository and its contents are published under the same license as Widelands: [The GNU General Public License (GPL) v2.](https://github.com/widelands/widelands/blob/master/COPYING)
