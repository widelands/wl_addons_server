#!/bin/bash
for dir in addons/*
do
  addon=${dir##*/}
  resource="widelands-addons.${addon//[._]/-}"
  tx config mapping --execute -r $resource --source-lang en --type PO --source-file "po/$addon/$addon.pot" --expression "po/$addon/<lang>.po"
done
