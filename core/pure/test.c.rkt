#lang rash
(require "test.lib.rkt")
(require racket)

(define lisp-id->c-id lisp-id->js-id)
(define (c-expr-compile x);; -> (list type init-statements value)
  (match x
    [(? string?)
     (define ret (with-output-to-string (λ () (write x))))
     (define tmpvar_val (lisp-id->c-id (gensym)))
     (define tmpvar_ret (lisp-id->c-id (gensym)))
     (list 'string
           (++
            "const char* "tmpvar_val"="ret";\n"
            "char* "tmpvar_ret"=malloc(strlen("tmpvar_val")+1);\n"
            "memcpy("tmpvar_ret","tmpvar_val",strlen("tmpvar_val")+1);\n")
           tmpvar_ret)]
    [(list (? symbol? f) xs ...)
     (match (cons f xs)
       [(list (or 'simple-print 'complex-print 'machinetext-print) arg)
        (match (c-expr-compile arg)
          [(list 'value stats val)
           (define tmpvar_ret (lisp-id->c-id (gensym)))
           (list 'string
                 (++
                  stats
                  "char* "tmpvar_ret"=lang_"(lisp-id->c-id f)"_retMalloc_orNULL(L,"val");\n"
                  "lang_value_delete(L,"val");\n")
                 tmpvar_ret)])]
       [(list (or 'complex-parse 'machinetext-parse) arg)
        (match (c-expr-compile arg)
          [(list 'string stats val)
           (define tmpvar_ret (lisp-id->c-id (gensym)))
           (list 'value
                 (++
                  stats
                  "lang_value* "tmpvar_ret"=lang_"(lisp-id->c-id f)"_orNULL(L,"val");\n"
                  "free("val");\n")
                 tmpvar_ret)])]
       [(list (or 'force1 'force-all 'force-all-rec) arg)
        (match (c-expr-compile arg)
          [(list 'value stats val)
           (define tmpvar_ret (lisp-id->c-id (gensym)))
           (list 'value
                 (++
                  stats
                  "lang_value* "tmpvar_ret"=lang_"(lisp-id->c-id f)"_orNULL(L,"val");\n"
                  "lang_value_delete(L,"val");\n")
                 tmpvar_ret)])])]))
(define (c-test-compile-inner code)
  (match code
    [(list 'check-equal? v1 v2)
     (++
      "puts(\""(make-safe-string/double-quote (with-output-to-string (λ () (write code))))"\");\n"
      (match (list (c-expr-compile v1) (c-expr-compile v2))
        [(list (list 'string stats1 val1) (list 'string stats2 val2))
         (++
          stats1
          stats2
          "assert(strcmp("val1","val2")==0);\n"
          "free("val1");\n"
          "free("val2");\n")]))]
    [(list 'begin xs ...)
     (apply ++ (map c-test-compile-inner xs))]))
(define (c-test-compile code)
  (++
   "#include \"assert.h\"\n
#include \"lang.h\"\n
#include \"stdio.h\"\n
#include \"stdlib.h\"\n
#include \"string.h\"\n"
   "int main(void){\n"
   "lang_state *L = lang_state_new_orNULL();\n"
   (c-test-compile-inner code)
   "return 0;\n"
   "}\n"))
(define c-run (make-js-run "./repl.c.file.not_shell.sh"))

|> assert-true-run-test "c" (delay (c-run (c-test-compile test-main)))

