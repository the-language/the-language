#lang rash
(require racket)
(require "test.lib.rkt")
(provide (all-defined-out))

(define (js-expr-compile x)
  (match x
    [(? string?) (with-output-to-string (λ () (write x)))]
    [(? number?) (number->string x)]
    [(list (? string? f) xs ...) (++ "L."f"("(apply-++ (add-between (map (λ (x) (js-expr-compile x)) xs) ","))")")]
    [(list (? symbol? f) xs ...) (js-expr-compile (cons (lisp-id->js-id f) xs))]
    ))
(define (js-test-compile code)
  (match code
    [(list 'check-equal? v1 v2)
     (++ "console.log(\""(make-safe-string/double-quote (with-output-to-string (λ () (write code))))"\");\nrequire('assert').strict.equal("(js-expr-compile v1)","(js-expr-compile v2)");\n")]
    [(list 'begin xs ...)
     (apply ++ (map js-test-compile xs))]))
(define js-run (make-js-run "./repl.js.sh"))
(define ts-run (make-js-run "./repl.ts.sh"))

