#!/bin/bash
for dir in addons/*
do
  echo $dir
  addon=${dir##*/}
  echo $addon
  resource="${addon//./-}"
  resource="widelands-addons.po-$resource-$resource-pot--transifex"
  echo $resource
  tx config mapping --execute -r $resource --source-lang en --type PO --source-file "po/$addon/$addon.pot" --expression "po/$addon/<lang>.po"
done
