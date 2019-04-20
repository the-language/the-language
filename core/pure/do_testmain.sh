#!/bin/sh

cd java/src
java testmain
cd ../..

./c/testmain

cd go
GOPATH="$PWD/deps:$PWD" go run testmain.go
cd ..
