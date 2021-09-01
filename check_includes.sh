#!/bin/bash
set -f
IFS='
'
GREEN="\033[0;32m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
NC="\033[0m"
errors=0

last_filename=
last_line=
last_import=
last_import_line=
last_import_class=
for f in $(grep -rwHn 'import' wl)
do
  filename="${f%%:*}"
  line="${f#*:}"
  line="${line%%:*}"
  file_and_line="$PURPLE$filename$NC:$BLUE$line$NC"

  if [ "$filename" = "$last_filename" ]
  then
    if [[ "$last_line"+1 -ne "$line" ]]
    then
      echo -e "Gap in $PURPLE$filename$NC between import lines $BLUE$last_line$NC and $BLUE$line$NC"
      ((errors++))
    fi
  fi

  if [[ "$f" =~ ^wl/(utils|server)/[A-Za-z]+.java:[0-9]+:import\ [A-Za-z0-9.]+\;$ ]]
  then
    class="${f#*:}"
    class="${class%;}"
    fullimport="${class#*import }"
    class="${class##*.}"

    if [ "$filename" = "$last_filename" ]
    then
      package1="${last_import%.*}"
      package2="${fullimport%.*}"
      if [[ "$package1" > "$package2" ]] || ( [[ "$package1" = "$package2" ]] && ! [[ "$last_import_class" < "$class" ]] )
      then
        echo -e "Unordered imports in $PURPLE$filename$NC between import lines $BLUE$last_import_line$NC ($GREEN$last_import$NC) and $BLUE$line$NC ($GREEN$fullimport$NC)"
        ((errors++))
      fi
    fi

    if [ $(grep -w "$class" "$filename" | wc -l) -le 1 ]
    then
      echo -e "Unused  import in $file_and_line:  $GREEN$class$NC ($GREEN$fullimport$NC)"
      ((errors++))
    fi

    last_import="$fullimport"
    last_import_line="$line"
    last_import_class="$class"
  else
    echo -e "Invalid import in $file_and_line: '${f#*:*:}'"
    ((errors++))
  fi

  last_filename="$filename"
  last_line="$line"
done

if [ $errors -gt 0 ]
then
  echo
  echo "You have $errors import error(s), please fix."
  exit 1
fi
