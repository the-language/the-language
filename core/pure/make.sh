#!/bin/sh
set -e
racket gen.Makefile.rkt
exec do-make.rkt # 或 make -j8
