#lang rash
(require "test.js.lib.rkt")
(require "test.lib.rkt")
(require racket)

|> assert-true-run-test "ecmascript" (delay (js-run (js-test-compile test-main)))
