#!/bin/sh
set -e
cd core/pure
racket gen.Makefile.rkt
make -j8
cd ../bootstrap-library
./make.sh
cd ../..
