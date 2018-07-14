(require 'tern)
(require 'company-tern)
(require 'flycheck)
(require 'smartparens)
(require 'evil)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(evil-set-initial-state 'js2-mode 'normal)

(defun deh-javascript-hook ()
  "my javascript hook"
  (setq js-indent-level 2)

  (tern-mode t)
  (company-mode t)
  (flycheck-mode t)
  (eldoc-mode t)
  (smartparens-mode t)
  (set (make-local-variable 'company-backends) '(company-tern))
  (evil-surround-mode)

  (setq deh-repl-enabled t)
  (setq deh-repl-process-name "deh-node")
  (setq deh-repl-buffer-name "*deh-node*")
  (setq deh-repl-program "node")
  (setq deh-repl-program-args (list (concat (getenv "HOME") "/node_repl.js"))))

(add-hook 'js2-mode-hook 'deh-javascript-hook)

(provide 'deh-javascript)
