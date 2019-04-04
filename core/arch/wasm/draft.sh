#!/bin/bash
[ -d emsdk ] || git clone --depth 1 https://github.com/emscripten-core/emsdk.git

pushd "emsdk"
  mkdir -p zips
  pushd "zips"
    [ -d ../clang/e1.38.30_64bit ] || { [ -f emscripten-llvm-e1.38.30.tar.gz ]&&[ ! -f emscripten-llvm-e1.38.30.tar.gz.aria2 ];} || aria2c -s 10 -j 10 -x 10 -k 1M https://s3.amazonaws.com/mozilla-games/emscripten/packages/llvm/tag/linux_64bit/emscripten-llvm-e1.38.30.tar.gz
  popd
  ./emsdk install latest
  ./emsdk activate latest
popd
. ./emsdk/emsdk_env.sh
emcc -O3 -Oz ../c/lang.c ../c/testmain.c -o lang.js
./emsdk/clang/e1.38.30_64bit/binaryen/bin/wasm-dis lang.wasm > lang.wat
