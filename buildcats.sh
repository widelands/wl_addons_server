#!/bin/bash

./compile.sh

# Update catalogs
java -cp ./build wl.utils.Buildcats
if ! [ $? -eq 0 ]
then
  echo "Error generating catalogues"
  exit 1
fi

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

# We need to store MO files in two different locations for backwards compatibility
cd ../i18n
for addon in *.wad
do
  cd $addon
  for lang in *
  do
    out=../${lang%.mo}/LC_MESSAGES
    mkdir -p $out
    cp $lang $out/$addon.mo
  done
  cd ..
done

# Now check which translations have changed
changed=()
skipnext=true
git add .
for modification in $(git status -s ./*.wad)
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
java -cp ./build wl.utils.UpdateList ${changed[*]}
if ! [ $? -eq 0 ]
then
  echo "Error updating lists"
  exit 1
fi
