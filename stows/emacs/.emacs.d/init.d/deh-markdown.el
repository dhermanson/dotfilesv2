(defun deh-markdown-mode-hook ()
  "my markdown mode hook"
  (flycheck-mode t)
  (setq display-line-numbers 'relative))

(add-hook 'markdown-mode-hook 'deh-markdown-mode-hook)

(provide 'deh-markdown)
