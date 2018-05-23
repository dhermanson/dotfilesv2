(require 'omnisharp)
(require 'company)
(require 'flycheck)
(require 'eldoc)
(require 'smartparens)

(evil-set-initial-state 'csharp-mode 'normal)

(defun deh-csharp-hook ()
  "my csharp hook"
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)
  (eldoc-mode)
  (smartparens-mode)
  (set (make-local-variable 'company-backends) '(company-omnisharp))
  (setq eldoc-documentation-function #'omnisharp-eldoc-function)

  ;; (setq indent-tabs-mode nil)
  ;; (setq c-syntactic-indentation t)
  ;; (c-set-style "ellemtel")
  ;; (setq c-basic-offset 4)
  ;; (setq truncate-lines t)
  ;; (setq tab-width 4)
  ;; (setq evil-shift-width 4)
  
  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'deh-csharp-hook)

(provide 'deh-csharp)
