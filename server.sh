#!/bin/bash
set -e
./compile.sh
setsid ./do_run_server.sh > server.log 2>&1 < /dev/null &
