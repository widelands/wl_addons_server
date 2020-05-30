#!/bin/bash
cd addons

# Update catalogs
for a in *
do
  out=../po/$a
  mkdir -p $out
  out=$out/$a.pot

  # TODO(Nordfriese): Pretty silly dummy that does not catch all strings. When we have
  # an add-on server someone will probably want to write a python script similar to
  # the official utils/buildcat.py to handle translations properly.

  xgettext --language=Lua -k_ --from-code=UTF-8 --output=$out \
      --copyright-holder="Widelands Development Team" \
      --msgid-bugs-address="https://www.widelands.org/wiki/ReportingBugs/" \
      $a/addon

  find $a -name "*.lua" | xargs xgettext -k \
      --keyword=_ --flag=_:1:pass-lua-format \
      --keyword=ngettext:1,2 --flag=ngettext:1:pass-lua-format --flag=ngettext:2:pass-lua-format \
      --keyword=pgettext:1c,2 --flag=pgettext:2:pass-lua-format \
      --keyword=npgettext:1c,2,3 --flag=npgettext:2:pass-lua-format --flag=npgettext:3:pass-lua-format \
      --language=Lua --from-code=UTF-8 -F \
      --join-existing --output=$out
done

# Synchronize and compile translations
cd ../po
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
echo ${changed[*]}
java UpdateList ${changed[*]}
