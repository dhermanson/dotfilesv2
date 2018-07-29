(require 'smartparens)
(require 'smartparens-config)
(require 'smartparens-ruby)
(require 'robe)
(require 'company)
(require 'evil)

(evil-set-initial-state 'ruby-mode 'normal)

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
  (flycheck-mode 0)

  (setq deh-repl-enabled t)
  (setq deh-repl-insert-style 'b)
  (setq deh-repl-process-name "deh-ruby")
  (setq deh-repl-buffer-name "*deh-ruby*")
  (setq deh-repl-program "pry")
  (setq deh-repl-program-args nil))

(add-hook 'ruby-mode-hook 'deh/my-ruby-mode-hook)

(add-to-list 'auto-mode-alist '("Brewfile" . ruby-mode))

(provide 'deh-ruby)
