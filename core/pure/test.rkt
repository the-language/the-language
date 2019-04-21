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
(define (js-run x) (system (string-append "node -e 'const L=require(\"./ecmascript/lang.js\");\n"(assert-safe-string/single-quote x)"'")))

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

(define lisp-id->php-id lisp-id->js-id)
(define (php-expr-compile x)
  (match x
    [(? string?) (with-output-to-string (λ () (write x)))]
    [(? number?) (number->string x)]
    [(list (? string? f) xs ...) (++ f"("(apply-++ (add-between (map (λ (x) (php-expr-compile x)) xs) ","))")")]
    [(list (? symbol? f) xs ...) (php-expr-compile (cons (lisp-id->php-id f) xs))]
    ))
(define (php-test-compile code)
  (match code
    [(list 'check-equal? v1 v2)
     (++ "echo \""(make-safe-string/double-quote (with-output-to-string (λ () (write code))))"\\n\";\nif("(php-expr-compile v1)" != "(php-expr-compile v2)") {\nthrow new Exception(\"failed\");\n}\n")]
    [(list 'begin xs ...)
     (apply ++ (map php-test-compile xs))]))
(define (php-run x) (system (string-append "php -r 'require \"./php/lang.php\";\n"(assert-safe-string/single-quote x)"'")))

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
          "^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))"))
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
          "a/b/c/d"
          "a/b"
          "a/[_:b]/[c/d]"))
     ,@(map
        (match-lambda [(list in out) `(check-equal? (complex-print (force-all-rec (complex-parse ,in))) ,out)])
        '(("$(#(映表 ((h g))) h)" "g")
          ("%([_:連頸]? (^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))))" "#(陰)")
          ("%(如若:化滅 (#(陰) A B))" "B")
          ("%(如若:化滅 (#(陽) A B))" "A")
          ("%(如若:化滅 (%([_:連頸]? (^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲)))))) A B))" "B")
          ("^($(#(映表 ()) (&+式形 :&>化滅 () ())) ())" "()")
          ("$(#(映表 ()) ((&+式形 :&>化滅 (X) X) ()))" "()")
          ("$(#(映表 ()) ((&+式形 :&>化滅 (X) X) (&+式形 引用:式形 H)))" "H")
          ("$(#(映表 ((X G))) ((&+式形 :&>化滅 () X)))" "G")
          ("$(#(映表 ((X G))) ((&+式形 :&>化滅 (A) (&+化滅 :>連頸 A X)) (&+式形 引用:式形 J)))" "(J . G)")
          ("$(#(映表 ((X G))) ((&+式形 :&>化滅 (A F) (&+化滅 :>連頸 A F)) (&+式形 引用:式形 J) X))" "(J . G)")
          ("$(#(映表 ()) (&+化滅 等同? () ()))" "#(陽)")
          ("$(#(映表 ()) (&+化滅 等同? (&+式形 引用:式形 (((&+式形 引用:式形 A) B))) (&+式形 引用:式形 (((&+式形 引用:式形 A) B)))))" "#(陽)")
          ("$(#(映表 ()) (&+化滅 等同? (&+式形 引用:式形 (((&+式形 引用:式形 A) B))) (&+式形 引用:式形 (((&+式形 引用:式形 A) C)))))" "#(陰)")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) H))" "H")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 省略一物 連頸) 特定其物)) () ()))" "(())")
          ("%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) (()))" "#(陰)")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) ()))" "#(陰)")
          ("%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) (%(#(符名 太始初核 (一類何物 (化滅 省略一物 連頸) 特定其物)) (() ()))))" "#(陽)")
          ("$(#(映表 ((H P) (B G))) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 省略一物 謬誤) 特定其物)) B H))" "!(G . P)")
          ("$(#(映表 ()) N)" "!(太始初核 &+化滅 (解算:化滅 (#(映表 ()) N)))")
          ("^(#(化滅 (X) X) (()))" "()")
          ("^(#(化滅 X X) (A B))" "(A B)")
          ("$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 (化滅 (連頸) 省略一物) 首始)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) (8 1 9))))" "8")
          ("^(#(化滅 (X . Y) Y) (A B C D 8))" "(B C D 8)")
          ("%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) (^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))))" "#(陰)")
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
        (λ (x) `(check-equal? (simple-print (complex-parse ,x)) ,x))
        '("()"
          "(() ())"
          "(h K)"
          "!(h . a)"
          "#(s . #(a . !(i)))"
          "^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))"
          "%(#(符名 太始初核 (一類何物 化滅 (是非 (一類何物 連頸 省略一物)))) (^(#(化滅 (序甲) (序甲 序甲)) (#(化滅 (序甲) (序甲 序甲))))))"
          "$(#(映表 ()) (#(符名 太始初核 (式形 (太始初核 化滅))) #(符名 太始初核 (一類何物 化滅 解算)) (#(符名 太始初核 (式形 (太始初核 式形))) #(符名 太始初核 (一類何物 式形 引用)) #(映表 ())) ()))"))
     ))

(void (and
 (begin
   (displayln "-- JS --")
   (js-run (js-test-compile test-main)))
 (begin
   (displayln "-- Lua --")
   (lua-run (lua-test-compile test-main)))
 (begin
   (displayln "-- PY3 --")
   (py3-run (py3-test-compile test-main)))))
