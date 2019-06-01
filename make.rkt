#lang rash
cd core/pure
racket gen.Makefile.rkt
make
cd ../../ununicode
racket tools-update.rkt
cd ../core/bootstrap-library
racket make.rkt
cd ../..
