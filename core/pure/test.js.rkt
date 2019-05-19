#lang rash
(require "test.js.lib.rkt")
(require "test.lib.rkt")
(require racket)

echo (id "--- JS {{{")
(when (not (js-run (js-test-compile test-main))) {false})
echo (id "}}} JS ---")
