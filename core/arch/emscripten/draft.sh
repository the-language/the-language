#lang rash
;; in-dir is in the demo file still
(require rash/demo/setup)

(define (id x) x)

sh -c (id "[ -d emsdk ] || git clone --depth 1 https://github.com/emscripten-core/emsdk.git")

in-dir "emsdk" {
  ./emsdk install latest
  ./emsdk activate latest
  source ./emsdk_env.sh
}
