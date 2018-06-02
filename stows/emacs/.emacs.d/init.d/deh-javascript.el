(require 'tern)
(require 'company-tern)
(require 'flycheck)
(require 'smartparens)
(require 'evil)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(evil-set-initial-state 'js2-mode 'normal)

(defun deh-javascript-hook ()
  "my javascript hook"
  (tern-mode t)
  (company-mode t)
  (flycheck-mode t)
  (eldoc-mode t)
  (smartparens-mode t)
  (set (make-local-variable 'company-backends) '(company-tern))
  (evil-surround-mode))

(add-hook 'js2-mode-hook 'deh-javascript-hook)

(provide 'deh-javascript)
