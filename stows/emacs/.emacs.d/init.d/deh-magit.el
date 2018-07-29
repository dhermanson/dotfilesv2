(require 'magit)

;; (setq magit-ediff-dwim-show-on-hunks t)
(setq magit-ediff-dwim-show-on-hunks nil)

(defun deh-magit-mode-hook ()
  "my magit mode hook"
  ;; (setq display-line-numbers 'relative)
  )

(defun deh-magit-rev-mode-hook ()
  "my magit-rev-mode hook"
  ;; (magit-section-show-level-1-all)
  )

(add-hook 'magit-mode-hook 'deh-magit-mode-hook)
(add-hook 'magit-revision-mode-hook 'deh-magit-rev-mode-hook)

(provide 'deh-magit)
