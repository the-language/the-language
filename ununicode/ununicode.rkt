#lang racket
(require "ununicode.core.rkt")

(displayln "!")

(for ([langcode (all-langcode)])
  (displayln langcode)
  (define filename (string-append (symbol->string (car langcode))"-"(symbol->string (cdr langcode))".rkt"))
  (load filename)
  (define context
    (make-immutable-hash
     (hash-map (all-char) (lambda (uuc utf8c) (cons uuc (hash-ref (hash-ref (l18n) langcode) uuc (string-append "[未翻譯]"(symbol->string uuc))))))))
  (define context-text (hash-map
                        context
                        (lambda (uuc str)
                          (string-append "(~ '("(symbol->string (car langcode))" . "(symbol->string (cdr langcode))") '"(symbol->string uuc)" \""str"\")"))
                        #t))
  (display-to-file context-text filename #:mode 'text #:exists 'replace)
  )
