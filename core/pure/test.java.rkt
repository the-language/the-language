#lang rash
(require "test.lib.rkt")
(require racket)

(define lisp-id->java-id lisp-id->js-id)
(define (java-expr-compile x)
  (match x
    [(? string?) (with-output-to-string (λ () (write x)))]
    [(? number?) (number->string x)]
    [(list (? string? f) xs ...) (++ "Lang."f"("(apply-++ (add-between (map (λ (x) (java-expr-compile x)) xs) ","))")")]
    [(list (? symbol? f) xs ...) (java-expr-compile (cons (lisp-id->java-id f) xs))]
    ))
(define (java-test-compile code)
  (match code
    [(list 'check-equal? v1 v2)
     (++ "System.out.println(\""(make-safe-string/double-quote (with-output-to-string (λ () (write code))))"\");if(!"(java-expr-compile v1)".equals("(java-expr-compile v2)")) {throw new Exception(\"failed\");}")]
    [(list 'begin xs ...)
     (apply ++ (map java-test-compile xs))]))
(define java-run (make-js-run "./repl.java.sh"))

echo "[WIP][WARNING] Java錯誤時不會自動發現及終止。"

|> assert-true-run-test "java" (delay (java-run (java-test-compile test-main)))

