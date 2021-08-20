#!/bin/bash
set -e
./compile.sh
java -cp ./mysql-connector-java-8.0.23.jar:./build wl.utils.UpdateList $@
