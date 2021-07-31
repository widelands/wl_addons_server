#!/bin/bash
set -e
rm -r build || true
mkdir build
javac -encoding UTF8 -d ./build wl/*/*.java
