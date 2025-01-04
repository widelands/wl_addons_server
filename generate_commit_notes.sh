#!/bin/bash

# Header
echo "Automated server sync"
echo

strip_key() {
	name="$1"
	name="${name%\"}"
	name="${name#$2}"
	name="${name#=}"
	name="${name#_}"
	name="${name#\"}"
	echo "$name"
}

# New and updated add-ons
for file in $(git --no-pager diff --name-status --no-color --cached addons/*/addon | awk '$1 != "D" { print $NF}')
do
	name="${file%/addon}"
	name="${name#addons/}"

	versionold="$(git diff --cached "$file" | grep -P -- '^-version=')"
	versionold="$(strip_key "$versionold" "-version")"

	if [ -n "$versionold" ]
	then
		versionnew="$(grep -P -- '^version=' "$file")"
		versionnew="$(strip_key "$versionnew" "version")"
		echo "- Updated $name from $versionold to $versionnew"
	else
		echo "- New add-on $name"
	fi
done

# Updated translations
find_updated_translations() {
	for file in $(git --no-pager diff --name-status --no-color --cached i18n/*.wad | awk '$1 != "D" { print $NF}')
	do
		file="${file#i18n/}"
		file="${file%/*.mo}"
		echo "$file"
	done
}

for addon in $(find_updated_translations | sort --unique)
do
	echo "- Updated translations for $addon"
done

# Website map versions
if [ -n "$(git diff --cached website_maps_i18n_version)" ]
then
	echo "- Updated website map translations"
fi

