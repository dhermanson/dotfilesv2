(require 'company)
(require 'tide)
(require 'smartparens)

(evil-set-initial-state 'typescript-mode 'normal)

(defun deh-typescript-hook ()
  "my typescript hook"
  (tide-setup)
  (company-mode t)
  (flycheck-mode t)
  (eldoc-mode t)
  (tide-hl-identifier-mode +1)
  (smartparens-mode t)
  (set (make-local-variable 'company-backends) '(company-tide)))

(add-hook 'typescript-mode-hook 'deh-typescript-hook)

(provide 'deh-typescript)
