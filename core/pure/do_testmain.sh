#!/bin/sh

cd java/src
java testmain ||exit
cd ../..

./c/testmain ||exit

# 已經暫停
#cd go
#GOPATH="$PWD/deps:$PWD" go run testmain.go ||exit
#cd ..

cd php
php testmain.php
cd ..
