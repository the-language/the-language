#lang racket
(require "test.lib.rkt")

(define lisp-id->rust-id lisp-id->js-id)
(define (rust-expr-compile x)
  (match x
    [(? string?) (++ "String::from("(with-output-to-string (λ () (write x)))")")]
    [(? number?) (number->string x)]
    [(list (? string? f) xs ...) (++ "l."f"("(apply-++ (add-between (map (λ (x) (++ "&"(rust-expr-compile x))) xs) ","))")")]
    [(list (? symbol? f) xs ...) (rust-expr-compile (cons (lisp-id->rust-id f) xs))]
    ))
(define (rust-test-compile code)
  (match code
    [(list 'check-equal? v1 v2)
     (++ "    println!(\""(make-safe-string/double-quote (with-output-to-string (λ () (write code))))"\");\n    assert_eq!("(rust-expr-compile v1)", "(rust-expr-compile v2)");\n")]
    [(list 'begin xs ...)
     (apply ++ (map rust-test-compile xs))]))

(displayln "use the_lang::*;\n\n#[test]\nfn generated_tests() {\n    let l = Lang::new();")
(display (rust-test-compile test-main))
(displayln "}")
