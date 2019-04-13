#|
    The Language
    Copyright (C) 2019  Zaoqi <zaomir@outlook.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
|#
#lang racket
(require rackunit)


(define (assert-value p? x)
  (match x
    [(? p?) x]))

(define (safe-string/single-quote? x)
  (and (string? x) (andmap (λ (c) (and (char? c) (not (equal? c #\')))) (string->list x))))
(define (assert-safe-string/single-quote x) (assert-value safe-string/single-quote? x))
(define (make-safe-string/single-quote x)
  (apply-++ (map (λ (c) (if (equal? c #\') "\\'" (string c))) (string->list x))))

(define (safe-string/double-quote? x)
  (and (string? x) (andmap (λ (c) (and (char? c) (not (equal? c #\")))) (string->list x))))
(define (assert-safe-string/double-quote x) (assert-value safe-string/double-quote? x))
(define (make-safe-string/double-quote x)
  (apply-++ (map (λ (c) (if (equal? c #\") "\\\"" (string c))) (string->list x))))

(define ++ string-append)
(define (apply-++ x) (apply ++ x))

(define (lisp-id->js-id x)
  (apply-++ (map (λ (c) (assert-value char? c) (if (equal? c #\-) "_" (string c))) (string->list (symbol->string x)))))
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
     (++ "console.log(\""(make-safe-string/double-quote (with-output-to-string (λ () (write code))))"\");\nassert.strictEqual("(js-expr-compile v1)","(js-expr-compile v2)");\n")]
    [(list 'begin xs ...)
     (apply ++ (map js-test-compile xs))]))
(define (js-run x) (system (string-append "node -e 'const L=require(\"./ecmascript/lang.js\");"(assert-safe-string/single-quote x)"'")))

(define lisp-id->py3-id lisp-id->js-id)
(define (py3-expr-compile x)
  (match x
    [(? string?) (with-output-to-string (λ () (write x)))]
    [(? number?) (number->string x)]
    [(list (? string? f) xs ...) (++ "L."f"("(apply-++ (add-between (map (λ (x) (py3-expr-compile x)) xs) ","))")")]
    [(list (? symbol? f) xs ...) (py3-expr-compile (cons (lisp-id->py3-id f) xs))]
    ))
(define (py3-test-compile code)
  (match code
    [(list 'check-equal? v1 v2)
     (++ "print(\""(make-safe-string/double-quote (with-output-to-string (λ () (write code))))"\")\nassert("(py3-expr-compile v1)" == "(py3-expr-compile v2)")\n")]
    [(list 'begin xs ...)
     (apply ++ (map py3-test-compile xs))]))
(define (py3-run x) (system (string-append "echo 'import python3.lang as L\n"(assert-safe-string/single-quote x)"' | python3")))

(define test-main
  `(begin
     ,@(map
        (λ (x) `(check-equal? (simple-print (simple-parse ,x)) ,x))
        '("(A B)"
          "!(#(A B) . C)"
          "((A) . #(B C C))"
          "(k 0 9 8 . o)"
          "(() ((((())))) . k)"
          "$(#(映表 ((h g))) h)"
          "^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))"))
     ,@(map
        (λ (x) `(check-equal? (complex-print (complex-parse ,x)) ,x))
        '("&+式形"
          "[[_:構]?]?"
          "[[[_:[_:構]]?]?]@h"
          "^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))"
          ":>構"
          "#(式形 #(化滅 (:映表 參形 :物) (&+化滅 :>構 (&+式形 引用:式形 化滅) (&+化滅 :>連 參形 (&+化滅 :>連 (&+化滅 :>連 (&+式形 引用:式形 &+化滅) (&+化滅 :>連 (&+式形 引用:式形 解算:化滅) (&+化滅 :>連 (&+化滅 :>連 (&+式形 引用:式形 &+式形) (&+化滅 :>連 (&+式形 引用:式形 引用:式形) (&+化滅 :>連 :映表 ()))) (&+化滅 :>連 (&+化滅 :>連 (&+式形 引用:式形 &+式形) (&+化滅 :>連 (&+式形 引用:式形 引用:式形) (&+化滅 :>連 :物 ()))) ())))) ())))))"
          "(&+化滅 :>連 (&+式形 引用:式形 &+式形) (&+化滅 :>連 (&+式形 引用:式形 引用:式形) (&+化滅 :>連 (&+式形 引用:式形 A) ())))"
          "#(化滅 (甲:化滅) ((&+式形 引用:式形 #(化滅 (自:化滅 甲:化滅) (甲:化滅 (自:化滅 自:化滅 甲:化滅)))) (&+式形 引用:式形 #(化滅 (自:化滅 甲:化滅) (甲:化滅 (自:化滅 自:化滅 甲:化滅)))) 甲:化滅))"
          "a/b/c/d"
          "a/b"
          "a/[_:b]/[c/d]"))
     ,@(map
        (match-lambda [(list in out) `(check-equal? (complex-print (force-all-rec (complex-parse ,in))) ,out)])
        '(("$(#(映表 ((h g))) h)" "g")
          ("%([_:連]? (^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))))" "#(陰)")
          ("%(若:化滅 (#(陰) A B))" "B")
          ("%(若:化滅 (#(陽) A B))" "A")
          ("%(若:化滅 (%([_:連]? (^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲)))))) A B))" "B")
          ("^($(#(映表 ()) (&+式形 :&>化滅 () ())) ())" "()")
          ("$(#(映表 ()) ((&+式形 :&>化滅 (X) X) ()))" "()")
          ("$(#(映表 ()) ((&+式形 :&>化滅 (X) X) (&+式形 引用:式形 H)))" "H")
          ("$(#(映表 ((X G))) ((&+式形 :&>化滅 () X)))" "G")
          ("$(#(映表 ((X G))) ((&+式形 :&>化滅 (A) (&+化滅 :>連 A X)) (&+式形 引用:式形 J)))" "(J . G)")
          ("$(#(映表 ((X G))) ((&+式形 :&>化滅 (A F) (&+化滅 :>連 A F)) (&+式形 引用:式形 J) X))" "(J . G)")
          ("$(#(映表 ()) (&+化滅 等同? () ()))" "#(陽)")
          ("$(#(映表 ()) (&+化滅 等同? (&+式形 引用:式形 (((&+式形 引用:式形 A) B))) (&+式形 引用:式形 (((&+式形 引用:式形 A) B)))))" "#(陽)")
          ("$(#(映表 ()) (&+化滅 等同? (&+式形 引用:式形 (((&+式形 引用:式形 A) B))) (&+式形 引用:式形 (((&+式形 引用:式形 A) C)))))" "#(陰)")
          ))
     ,@(map
        (λ (x) `(check-equal? (simple-print (complex-parse ,x)) ,x))
        '("^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))"))
     ))

(void (and
 (begin
   (displayln "-- JS --")
   (js-run (js-test-compile test-main)))
 (begin
   (displayln "-- PY3 --")
   (py3-run (py3-test-compile test-main)))))
 