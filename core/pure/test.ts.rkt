#lang rash
(require "test.js.lib.rkt")
(require "test.lib.rkt")
(require racket)

|> assert-true-run-test "typescript" (delay (ts-run (js-test-compile test-main)))
