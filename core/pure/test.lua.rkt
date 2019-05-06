#lang racket
(require "test.rkt")

(define lisp-id->lua-id lisp-id->js-id)
(define (lua-expr-compile x)
  (match x
    [(? string?) (with-output-to-string (λ () (write x)))]
    [(? number?) (number->string x)]
    [(list (? string? f) xs ...) (++ "L."f"("(apply-++ (add-between (map (λ (x) (lua-expr-compile x)) xs) ","))")")]
    [(list (? symbol? f) xs ...) (lua-expr-compile (cons (lisp-id->lua-id f) xs))]
    ))
(define (lua-test-compile code)
  (match code
    [(list 'check-equal? v1 v2)
     (++ "print(\""(make-safe-string/double-quote (with-output-to-string (λ () (write code))))"\")\nassert("(lua-expr-compile v1)" == "(lua-expr-compile v2)")\n")]
    [(list 'begin xs ...)
     (apply ++ (map lua-test-compile xs))]))
(define (lua-run x) (system (string-append "./c/lua-5.1.5/src/lua -e 'local L=require(\"./lua/lang\")\n"(assert-safe-string/single-quote x)"'")))

(check-equal?
 (begin
   (displayln "-- Lua --")
   (lua-run (lua-test-compile test-main)))
 #t)