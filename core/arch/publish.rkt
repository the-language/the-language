#lang rash
;; in-dir is in the demo file still
(require rash/demo/setup)
(require racket)

(define p-new-version (make-parameter #f))
(define p-message (make-parameter #f))
(command-line
    #:program "publisher"
    #:once-each
    [("--new-version") version "new version" (p-new-version version)]
    [("--message") message "message" (p-message message)]
    #:args ()
    {
        (unless (p-new-version) (raise "ERROR!"))
        (unless (p-message) (p-message ""))

        racket make.rkt

        in-dir "ecmascript" {
            yarn publish --no-git-tag-version --no-commit-hooks --new-version (p-new-version) --message (p-message)
        }

        git add .
        git commit -m (string-append "[NEW VERSION]"(p-new-version)"\n"(p-message))
        git tag -a (p-new-version) -m (p-message)
        git push --tags --all
    }
)
