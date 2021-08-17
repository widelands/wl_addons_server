#!/bin/bash
set -e
rm -r build || true
mkdir build
javac -cp ./json-simple-1.1.1.jar:. -encoding UTF8 -d ./build wl/*/*.java
