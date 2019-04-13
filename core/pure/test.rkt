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

(define test-main
  `(begin
     ,@(map
       (λ (x) `(check-equal? (simple-print (complex-parse ,x)) ,x))
       '("^(#(化滅 (甲) (甲 甲)) (#(化滅 (甲) (甲 甲))))"))
     ))
(js-run (js-test-compile test-main))
