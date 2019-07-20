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
#lang rash
(require racket)
(require rackunit)
(provide (all-defined-out) (all-from-out rackunit))

(define (id x) x)

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

(define ((make-js-run repl) x)
  (define tmpfile (make-temporary-file))
  (display-to-file x tmpfile #:exists 'replace)
  (define ret (system* repl tmpfile))
  (delete-file tmpfile)
  ret)

(define (assert-true-run-test name x)
  {
   echo (string-append "--- "name" {{{")
   (when (not (force x)) {false})
   echo (string-append "}}} "name" ---")
   })

(define test-main
  `(begin
     ,@(map
        (λ (x) `(check-equal? (simple-print (complex-parse ,x)) ,x))
        '("(A B)"
          "!(#(A B) . C)"
          "((A) . #(B C C))"
          "(k 0 9 8 . o)"
          "(() ((((())))) . k)"
          "$(#(映表 ((h g))) h)"
          "^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))"
          ";(#(序乙) 序甲)"
          "()"
          "(() ())"
          "(h K)"
          "!(h . a)"
          "#(s . #(a . !(i)))"
          "^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))"
          "%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) (^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))))"
          "$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 解算)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(映表 ())) ()))"))
     ,@(map
        (λ (x) `(check-equal? (complex-print (complex-parse ,x)) ,x))
        '("&+式形"
          "[[_:構物]?]?"
          "[[[_:[_:構物]]?]?]@h"
          "^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))"
          ":>構物"
          "#(式形 #(化滅 (:映表 參形 :構物) (&+化滅 :>構物 (&+式形 引用:式形 化滅) (&+化滅 :>連頸 參形 (&+化滅 :>連頸 (&+化滅 :>連頸 (&+式形 引用:式形 &+化滅) (&+化滅 :>連頸 (&+式形 引用:式形 解算:化滅) (&+化滅 :>連頸 (&+化滅 :>連頸 (&+式形 引用:式形 &+式形) (&+化滅 :>連頸 (&+式形 引用:式形 引用:式形) (&+化滅 :>連頸 :映表 ()))) (&+化滅 :>連頸 (&+化滅 :>連頸 (&+式形 引用:式形 &+式形) (&+化滅 :>連頸 (&+式形 引用:式形 引用:式形) (&+化滅 :>連頸 :構物 ()))) ())))) ())))))"
          "(&+化滅 :>連頸 (&+式形 引用:式形 &+式形) (&+化滅 :>連頸 (&+式形 引用:式形 引用:式形) (&+化滅 :>連頸 (&+式形 引用:式形 A) ())))"
          "#(化滅 (序甲:化滅) ((&+式形 引用:式形 #(化滅 (吾自:化滅 序甲:化滅) (序甲:化滅 (吾自:化滅 吾自:化滅 序甲:化滅)))) (&+式形 引用:式形 #(化滅 (吾自:化滅 序甲:化滅) (序甲:化滅 (吾自:化滅 吾自:化滅 序甲:化滅)))) 序甲:化滅))"
          ";(#(序乙) 序甲)"
          "a/b/c/d"
          "a/b"
          "a/[_:b]/[c/d]"))
     ,@(map
        (match-lambda [(list in out) `(check-equal? (complex-print (force-all-rec (complex-parse ,in))) ,out)])
        '(("$(#(映表 ((h g))) h)" "g")
          ("%([_:連頸]? (^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))))" "#(爻陰)")
          ("%(如若:化滅 (#(爻陰) A B))" "B")
          ("%(如若:化滅 (#(爻陽) A B))" "A")
          ("%(如若:化滅 (%([_:連頸]? (^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲)))))) A B))" "B")
          ("^($(#(映表 ()) (&+式形 :&>化滅 () ())) ())" "()")
          ("$(#(映表 ()) ((&+式形 :&>化滅 (X) X) ()))" "()")
          ("$(#(映表 ()) ((&+式形 :&>化滅 (X) X) (&+式形 引用:式形 H)))" "H")
          ("$(#(映表 ((X G))) ((&+式形 :&>化滅 () X)))" "G")
          ("$(#(映表 ((X G))) ((&+式形 :&>化滅 (A) (&+化滅 :>連頸 A X)) (&+式形 引用:式形 J)))" "(J . G)")
          ("$(#(映表 ((X G))) ((&+式形 :&>化滅 (A F) (&+化滅 :>連頸 A F)) (&+式形 引用:式形 J) X))" "(J . G)")
          ("$(#(映表 ()) (&+化滅 等同? () ()))" "#(爻陽)")
          ("$(#(映表 ()) (&+化滅 等同? (&+式形 引用:式形 (((&+式形 引用:式形 A) B))) (&+式形 引用:式形 (((&+式形 引用:式形 A) B)))))" "#(爻陽)")
          ("$(#(映表 ()) (&+化滅 等同? (&+式形 引用:式形 (((&+式形 引用:式形 A) B))) (&+式形 引用:式形 (((&+式形 引用:式形 A) C)))))" "#(爻陰)")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) H))" "H")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 省略一物 連頸) 特定其物)) () ()))" "(())")
          ("%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) (()))" "#(爻陰)")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) ()))" "#(爻陰)")
          ("%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) (%(#(符名 太始初核 (一類何物 (化滅 省略一物 連頸) 特定其物)) (() ()))))" "#(爻陽)")
          ("$(#(映表 ((H P) (B G))) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 省略一物 謬誤) 特定其物)) B H))" "!(G . P)")
          ("$(#(映表 ()) N)" "!(太始初核 &+化滅 (解算:化滅 (#(映表 ()) N)))")
          ("^(#(化滅 (X) X) (()))" "()")
          ("^(#(化滅 X X) (A B))" "(A B)")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 (連頸) 省略一物) 首始)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) (8 1 9))))" "8")
          ("^(#(化滅 (X . Y) Y) (A B C D 8))" "(B C D 8)")
          ("%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) (^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))))" "#(爻陰)")
          ("^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))" "!(太始初核 宇宙亡矣 省略一物)")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 式形)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(式形 #(化滅 (E . X) X)))))" "()")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 式形)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(式形 #(化滅 (E . Y) Y))) A B))" "(A B)")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 式形)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(式形 #(化滅 (E) E)))))" "#(映表 ())")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 解算)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(映表 ())) ()))" "()")))
     ,@(map
        (match-lambda [(list in out) `(begin (check-equal? (simple-print (complex-parse ,in)) ,out) (check-equal? (complex-print (complex-parse ,out)) ,in))])
        '(("構物.符名" "#(符名 太始初核 (一類何物 (化滅 (構物) 省略一物) 符名))")
          ("&式形" "#(符名 太始初核 (式形 式形))")
          ("解算:化滅" "#(符名 太始初核 (一類何物 化滅 解算))")
          ("&+式形" "#(符名 太始初核 (式形 (太始初核 式形)))")
          ("[_:構物]?" "#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 構物 省略一物))))")
          ("等同?" "#(符名 太始初核 (一類何物 化滅 (是非 等同)))")
          ("化滅@應用" "#(符名 太始初核 (一類何物 (化滅 (化滅 . 省略一物) 省略一物) 應用))")
          (":&>化滅" "#(符名 太始初核 (一類何物 (式形 (化滅 省略一物 化滅)) 特定其物))")
          ("列序.[_:構物]" "#(符名 太始初核 (一類何物 (化滅 (列序) 省略一物) (一類何物 構物 省略一物)))")))
     ,@(map
        (λ (x) `(check-equal? (complex-print (machinetext-parse (machinetext-print (complex-parse ,x)))) ,x))
        '("符名"
          "()"
          "(a b)"
          "(a b . !(c d #(e)))"))
     ,@(map
        (λ (x) `(check-equal? (machinetext-print (machinetext-parse ,x)) ,x))
        '("_"
          "#^符名^.^太始初核^.._^一類何物^...^化滅^.._..^一類何物^.^列序^_^省略一物^_^構物^.^省略一物^_"))
     ))
