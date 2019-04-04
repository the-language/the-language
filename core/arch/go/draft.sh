#!/bin/bash
#deps: golang 1.10+
mkdir -p deps
#mkdir -p ./deps/src/golang.org/x/
export GOPATH="$PWD/deps"
#[ -d ./deps/src/golang.org/x/tools ] || (pushd ./deps/src/golang.org/x && git clone --depth 1 https://github.com/golang/tools.git && popd)
[ -d ./deps/src/github.com/Konstantin8105/c4go/ ] || (mkdir -p ./deps/src/github.com/Konstantin8105 && pushd ./deps/src/github.com/Konstantin8105 && git clone --depth 1 https://github.com/Konstantin8105/c4go.git && popd)
[ -f ./deps/bin/c4go ] || go get github.com/Konstantin8105/c4go
#./deps/bin/c4go transpile ../c/lang.c
