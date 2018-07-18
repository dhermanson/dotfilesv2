(require 'deh-repl)

(evil-set-initial-state 'sh-mode 'normal)

(defun deh-sh-mode-hook ()
  (setq deh-repl-enabled t)
  (setq deh-repl-process-name "deh-bash")
  (setq deh-repl-buffer-name "*deh-bash*")
  (setq deh-repl-program "bash")
  (setq deh-repl-program-args nil))

(add-hook 'sh-mode-hook 'deh-sh-mode-hook)

(add-to-list 'auto-mode-alist '("^\\.env*" . sh-mode))

(provide 'deh-sh)
