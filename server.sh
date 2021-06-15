#!/bin/bash
set -e
./compile.sh
setsid java -cp ./mysql-connector-java-8.0.23.jar:./build wl.server.Server \
  > server.log 2>&1 < /dev/null &
