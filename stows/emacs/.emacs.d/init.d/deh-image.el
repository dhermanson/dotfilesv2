(require 'image-mode)

(defun deh-image-mode-hook ()
  "my image mode hook"
  (setq ))

(define-key image-mode-map (kbd "g") (lambda ()
				       (interactive)
				       (revert-buffer nil t)))

(provide 'deh-image)
