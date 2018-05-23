(require 'evil)

(evil-set-initial-state 'makefile-mode 'normal)

(defun deh-makefile-mode-hook ()
  "my makefile mode hook"
  (evil-surround-mode))

(provide 'deh-makefile)
