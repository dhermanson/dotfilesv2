(require 'smartparens)
(require 'flycheck)

(defun deh-json-mode-hook ()
  "my json mode hook"
  (smartparens-mode 1)
  (flycheck-mode 1))

(add-hook 'json-mode-hook 'deh-json-mode-hook)

(provide 'deh-json)
