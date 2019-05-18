#lang racket
(require "ununicode.core.rkt")

(display-to-file
 (apply string-append
       (cons "#lang racket\n(require \"ununicode.core.rkt\")\n"
            (for/list ([langcode (all-langcode)])
              (define filename (string-append (symbol->string (car langcode))"-"(symbol->string (cdr langcode))".rkt"))
              (string-append "(require \""filename"\")\n"))))
 "ununicode.langs.loader.rkt"
 #:exists 'replace)

(require "ununicode.langs.loader.rkt")

(for ([langcode (all-langcode)])
  (define filename (string-append (symbol->string (car langcode))"-"(symbol->string (cdr langcode))".rkt"))
  ;; `(symbol->string uuc)`確保所有平臺上順序相同。
  (define context
    (make-immutable-hash
     (hash-map (all-char) (lambda (uuc utf8c) (cons (symbol->string uuc) (hash-ref (hash-ref (l18n) langcode) uuc (symbol->string uuc)))))))
  (define context-text (apply
                        string-append
                        (cons "#lang racket\n(require \"ununicode.core.rkt\")\n"
                             (hash-map
                              context
                              (lambda (uuc str)
                                (string-append "(~ '("(symbol->string (car langcode))" . "(symbol->string (cdr langcode))") '|"uuc"| \""str"\")\n"))
                              #t))))
  (display-to-file context-text filename #:exists 'replace)
  )
