#!/bin/bash
set -e
./compile.sh
java -cp ./build wl.utils.UpdateList $@
