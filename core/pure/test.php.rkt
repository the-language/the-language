#lang rash
(require "test.lib.rkt")
(require racket)

(define lisp-id->php-id lisp-id->js-id)
(define (php-expr-compile x)
  (match x
    [(? string?) (with-output-to-string (λ () (write x)))]
    [(? number?) (number->string x)]
    [(list (? string? f) xs ...) (++ "$"f"("(apply-++ (add-between (map (λ (x) (php-expr-compile x)) xs) ","))")")]
    [(list (? symbol? f) xs ...) (php-expr-compile (cons (lisp-id->php-id f) xs))]
    ))
(define (php-test-compile code)
  (match code
    [(list 'check-equal? v1 v2)
     (++ "echo \""(make-safe-string/double-quote (with-output-to-string (λ () (write code))))"\\n\";\nif("(php-expr-compile v1)" != "(php-expr-compile v2)") {\nthrow new Exception(\"failed\");\n}\n")]
    [(list 'begin xs ...)
     (apply ++ (map php-test-compile xs))]))
(define php-run (make-js-run "./repl.php.not_shell.sh"))

echo "[WIP][WARNING] PHP錯誤時不會自動發現及終止。"

|> assert-true-run-test "php" (delay (php-run (string-append "<?php\n" (php-test-compile test-main))))

