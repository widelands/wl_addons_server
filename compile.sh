#!/bin/bash
set -e
rm -r build || true
mkdir build
JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 javac -d ./build wl/*/*.java
