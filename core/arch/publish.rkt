#lang rash
;; in-dir is in the demo file still
(require rash/demo/setup)
(require racket)

(define new-version (make-parameter #f))
(command-line
    #:program "publisher"
    #:once-each
    [("--new-version") version "new version" (new-version version)]
    #:args ()
    {
        racket make.rkt
        git add .
        git commit -m (new-version)
        git tag -a (new-version)
        git push

        in-dir "ecmascript" {
            yarn publish --no-git-tag-version --no-commit-hooks --new-version (new-version)
        }
    }
)
