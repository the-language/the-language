#lang rash
;; in-dir is in the demo file still
(require rash/demo/setup)

(define (id x) x)

sh -c (id "[ -d emsdk ] || git clone --depth 1 https://github.com/emscripten-core/emsdk.git")

in-dir "emsdk" {
  mkdir -p zips
  in-dir "zips" {
    sh -c (id "[ -d ../clang/e1.38.30_64bit ] || { [ -f emscripten-llvm-e1.38.30.tar.gz ]&&[ ! -f emscripten-llvm-e1.38.30.tar.gz.aria2 ];} || aria2c -s 10 -j 10 -x 10 -k 1M https://s3.amazonaws.com/mozilla-games/emscripten/packages/llvm/tag/linux_64bit/emscripten-llvm-e1.38.30.tar.gz")
  }
  ./emsdk install latest
  ./emsdk activate latest
}
