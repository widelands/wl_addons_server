#!/bin/bash
set -e
rm -r build || true
mkdir build
javac -d ./build wl/*/*.java
