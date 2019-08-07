#lang scribble/manual
@(require racket)
@(provide (all-from-out racket))
@(provide (all-defined-out))

@(define-syntax-rule (定/法 . xs) (define-syntax-rule . xs))
@(define-syntax-rule (定/法* id (pat val) ...) (define-syntax id (syntax-rules () [(id . pat) val] ...)))
@(define-syntax-rule (定 . xs) (define . xs))

@(定 n (elem "" #:style 'newline))

@(定/法 (入/节 x) (include-section (file x)))
@(定/法 (引 x) (racket x))
@(定/法 (引n x) (racketblock x))
@(定/法 (引_ x) (smaller x))
@(定/法 (引n_ x) (nested #:style 'code-inset (smaller x)))

@(定/法 (节 . xs) (section . xs))
@(定/法 (子节 . xs) (subsection . xs))
@(定/法 (_ . xs) (list . xs))
@(定/法 (题 . xs) (title . xs))
@(定/法 (链 . xs) (hyperlink . xs))

@(定/法 (句 x ...) (list (list x "。") ...))
@(定/法 (为 x y) (list x "是" y))
@(定/法 (的 x y) (list x "的" y))
@(定/法 (注 x y) (list x "（" y "）"))
@(定/法* 一个
       [(x 类型) (list "一个" 类型 x)]
       [(x) (list "一个" x)])

@(定 TheLanguage "The Language")
@(定 语言 "语言")
@(定 集合 "集合")
