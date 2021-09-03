#!/bin/bash
set -e

compile=1
imports=1
javadoc=1
builddir="./build"
docdir="./javadoc"

while [ -n "$1" ]
do
  case $1 in
    -h|--help)
      echo "Available options are:"
      echo " -c --skip-compile  Skip code compilation"
      echo " -i --skip-imports  Skip imports checking"
      echo " -j --skip-javadoc  Skip generating documentation"
      echo " -b --build-dir     Directory for compilation [./build  ]"
      echo " -d --doc-dir       Directory for javadoc     [./javadoc]"
      exit 0
      ;;
    -c|--skip-compile)
      compile=0
      ;;
    -i|--skip-imports)
      imports=0
      ;;
    -j|--skip-javadoc)
      javadoc=0
      ;;
    -b|--build-dir)
      builddir="$2"
      shift
      ;;
    -d|--doc-dir)
      docdir="$2"
      shift
      ;;
    *)
      echo "Unknown option: $1"
      echo "Use -h or --help for list of available options"
      exit 1
  esac
  shift
done

if [ $compile -ge 1 ]
then
  echo "Compiling..."
  rm -r "$builddir" || true
  mkdir "$builddir"
  javac -cp ./json-simple-1.1.1.jar:. -encoding UTF8 -d "$builddir" wl/*/*.java
fi

if [ $imports -ge 1 ]
then
  echo "Checking includes..."
  ./check_includes.sh
fi

if [ $javadoc -ge 1 ]
then
  echo "Generating javadoc..."
  rm -r "$docdir" || true
  mkdir "$docdir"
  javadoc -cp ./json-simple-1.1.1.jar:. -encoding UTF8 -quiet -d "$docdir" wl.utils wl.server
fi
