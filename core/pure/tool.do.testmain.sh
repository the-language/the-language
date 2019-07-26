#!/bin/sh
set -e

cd java/src
java testmain
cd ../..

./c/testmain

# 已經暫停
#cd go
#GOPATH="$PWD/deps:$PWD" go run testmain.go ||exit
#cd ..

cd php
php testmain.php
cd ..
