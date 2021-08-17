#!/bin/bash

nrAdded=""
nrDeleted=""
revertme=()
anything_reverted=false
for entry in $(git diff --numstat po); do
  if [ -z "$nrAdded" ]
  then
    nrAdded=$entry
  elif [ -z "$nrDeleted" ]
  then
    nrDeleted=$entry
  else
    if [[ $nrAdded == 1 ]] && [[ $nrDeleted == 1 ]]
    then
      echo "Skipping changes to $entry"
      anything_reverted=true
      revertme+=("$entry")
    fi
    nrAdded=""
    nrDeleted=""
  fi
done
if [ $anything_reverted == true ]
then
  git checkout ${revertme[@]}
else
  echo "Nothing to do"
fi
