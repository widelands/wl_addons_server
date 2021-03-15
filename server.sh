#!/bin/bash
javac *.java && \
java -cp ./mysql-connector-java-8.0.23.jar:. Server
