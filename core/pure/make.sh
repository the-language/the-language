#!/bin/sh
set -e
racket gen.Makefile.rkt
exec make -j8
