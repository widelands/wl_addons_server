#!/bin/bash

# Update catalogs
java Buildcats

# Synchronize and compile translations
cd po
for addon in *
do
  cd $addon
  for translation in *.po
  do
    msgmerge $translation $addon.pot -o $translation
    mkdir -p ../../i18n/$addon
    msgfmt $translation -o ../../i18n/$addon/${translation%.po}.mo
  done
  cd ..
done

# Now check which translations have changed
cd ../i18n
changed=()
skipnext=true
for modification in $(git status -s ./*)
do
  if [[ $skipnext == false ]]
  then
    changed+=(+${modification%%/*})
    skipnext=true
  else
    skipnext=false
  fi
done
cd ..
java UpdateList ${changed[*]}
