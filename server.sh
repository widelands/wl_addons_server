#!/bin/bash
javac *.java && \
setsid java -cp ./mysql-connector-java-8.0.23.jar:. Server \
  > server.log 2>&1 < /dev/null &
