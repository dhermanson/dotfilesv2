(require 'smartparens)
(require 'smartparens-config)
(require 'smartparens-ruby)
(require 'robe)
(require 'company)

(defun deh/my-ruby-mode-hook ()
  "my ruby mode hook"
  (robe-mode)
  (smartparens-mode)
  (show-smartparens-mode)
  (setq company-idle-delay nil)
  (set (make-local-variable 'company-backends) '(company-robe
						 company-files))
  (setq inf-ruby-default-implementation "pry")
  ;; turn flycheck mode on
  (flycheck-mode 0))

(add-hook 'ruby-mode-hook 'deh/my-ruby-mode-hook)

(add-to-list 'auto-mode-alist '("Brewfile" . ruby-mode))

(provide 'deh-ruby)
