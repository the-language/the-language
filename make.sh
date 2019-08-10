#!/bin/sh
set -e
cd core/pure
./make.sh
cd ../bootstrap-library
./make.sh
cd ../..
