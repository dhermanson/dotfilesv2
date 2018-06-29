(require 'evil)

(evil-set-initial-state 'yaml-mode 'normal)

(defun deh-yaml-mode-hook ()
  (setq display-line-numbers 'relative))

(add-hook 'yaml-mode-hook 'deh-yaml-mode-hook)

(provide 'deh-yaml)
