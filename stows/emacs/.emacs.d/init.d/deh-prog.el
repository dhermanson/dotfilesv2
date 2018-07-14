(defun deh-prog-mode-hook ()
  "my prog mode hook"
  (setq display-line-numbers 'relative)
  (visual-line-mode t))

(add-hook 'prog-mode-hook 'deh-prog-mode-hook)

(provide 'deh-prog)
