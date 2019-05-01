#lang racket
(require "make.rkt")
(pre-make)
(do-make (current-command-line-arguments))
