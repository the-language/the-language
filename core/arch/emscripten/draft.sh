#lang rash

(define (id x) x)

sh -c (id "[ -d emsdk ] || git clone --depth 1 https://github.com/emscripten-core/emsdk.git")
