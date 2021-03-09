#!/bin/bash
if [ -z "$1" ]
then
  echo "Usage: setup_tx name.wad ..."
  echo "Add a resource for each of the given add-ons to the Transifex client configuration if they were not configured yet."
  exit 1
fi

while [ -n "$1" ]
do
  resource="widelands-addons.${1//[._]/-}"
  tx config mapping --execute -r $resource --source-lang en --type PO --source-file "po/$1/$1.pot" --expression "po/$1/<lang>.po"
  shift
done
