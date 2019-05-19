#lang rash
(require "test.js.lib.rkt")
(require "test.lib.rkt")
(require racket)

echo (id "--- TS {{{")
(when (not (ts-run (js-test-compile test-main))) {false})
echo (id "}}} TS ---")
