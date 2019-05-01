#lang racket
(require "make.rkt")
(pre-do-make)
(do-make (current-command-line-arguments))
