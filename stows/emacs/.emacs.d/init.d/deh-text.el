(defun deh-text-mode-hook ()
  "my text mode hook"
  ;; (setq indent-tabs-mode nil)
  ;; (setq tab-width 4)
  ;; (setq indent-line-function (quote insert-tab))
  )

(add-hook 'text-mode-hook #'deh-text-mode-hook)

(provide 'deh-text)
