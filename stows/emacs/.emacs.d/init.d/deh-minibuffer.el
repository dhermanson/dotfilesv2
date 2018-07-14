(defun deh-minibuffer-mode-hook ()
  "My minibuffer-mode hook"
  (company-mode 0))

(add-hook 'minibuffer-inactive-mode-hook 'deh-minibuffer-mode-hook)

(provide 'deh-minibuffer)
