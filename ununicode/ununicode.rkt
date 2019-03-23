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
#lang typed/racket
(define-type LangCode Symbol)
(define-type UUCChar Symbol)
(: all-char (Parameterof (Setof UUCChar)))
(define all-char (make-parameter (ann (set) (Setof UUCChar))))
(: all-langcode (Parameterof (Setof LangCode)))
(define all-langcode (make-parameter (ann (set) (Setof LangCode))))
(: l18n (Parameterof (Immutable-HashTable LangCode (Immutable-HashTable UUCChar String))))
(define l18n (make-parameter (ann (hash) (Immutable-HashTable LangCode (Immutable-HashTable UUCChar String)))))
(: add-langcode (-> LangCode Void))
(define (add-langcode x)
    (assert (not (set-member? (all-langcode) x)))
    (all-langcode (set-add (all-langcode) x)))
(: _ (-> UUCChar Void))
(define (_ x)
    (assert (not (set-member? (all-char) x)))
    (all-char (set-add (all-char) x)))
(: ~ (-> LangCode UUCChar String Void))
(define (~ lc ch str)
    (assert (set-member? (all-char) ch))
    (assert (set-member? (all-langcode) lc))
    (l18n (hash-update (l18n) lc (lambda ([lt : (Immutable-HashTable UUCChar String)])
        (assert (not (hash-has-key? lt ch)))
        (hash-set lt ch str)) (ann hash (-> (Immutable-HashTable UUCChar String))))))
