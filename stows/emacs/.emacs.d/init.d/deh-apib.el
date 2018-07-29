(require 'apib-mode)
(require 'flycheck)

(add-to-list 'auto-mode-alist '("\\.apib$" . apib-mode))

;; (defun deh-apib-mode-hook ()
;;   "my apib-mode hook"
;;   (flycheck-mode))

(flycheck-define-checker
 apib-drafter
 "A syntax checker for API Blueprint using drafter."
 :command ("drafter" "-ul" source)
 :error-patterns ((warning line-start
                           "warning: (" (one-or-more digit) ")  " (message)
                           " - line " line ", column " column
                           line-end)
                  (error line-start
                         "error: (" (one-or-more digit) ")  " (message)
                         " - line " line ", column " column
                         line-end)
                  )
 :modes apib-mode)

(add-to-list 'flycheck-checkers 'apib-drafter)

(provide 'deh-apib)
