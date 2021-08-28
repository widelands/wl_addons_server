#!/bin/bash
set -e
rm -r build javadoc || true
mkdir build javadoc
javac -cp ./json-simple-1.1.1.jar:. -encoding UTF8 -d ./build wl/*/*.java
javadoc -cp ./json-simple-1.1.1.jar:. -encoding UTF8 -quiet -d ./javadoc wl.utils wl.server
