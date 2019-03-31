#!/bin/bash
#deps: golang 1.9+
mkdir -p deps
mkdir -p ./deps/src/golang.org/x/
export GOPATH="$PWD/deps"
[ -d ./deps/src/golang.org/x/tools ] || (pushd ./deps/src/golang.org/x && git clone --depth 1 https://github.com/golang/tools.git && popd)
[ -d ./deps/src/github.com/elliotchance/c2go/ ] || (pushd ./deps/src/github.com && git clone --depth 1 https://github.com/elliotchance/c2go.git && popd)
[ -f ./deps/bin/c2go ] || go get github.com/elliotchance/c2go
./deps/bin/c2go transpile ../c/lang.c
