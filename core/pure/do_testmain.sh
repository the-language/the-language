#!/bin/sh

cd java/src
java testmain ||exit
cd ../..

./c/testmain ||exit

cd go
GOPATH="$PWD/deps:$PWD" go run testmain.go ||exit
cd ..

cd php
php testmain.php
cd ..
