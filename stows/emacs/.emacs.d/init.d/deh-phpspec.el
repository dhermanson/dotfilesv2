(require 'f)

(defun deh-phpspec-run-current-file ()
  "run phpspec on current file"
  (interactive)
  (let* ((current-buffer (current-buffer))
	 (default-directory (projectile-project-root))
	 (file-path (f-relative (buffer-file-name) default-directory))
	 (phpspec-buffer-name (concat "phpspec " (projectile-project-name)))
	 (asterisk-buffer-name (concat "*" phpspec-buffer-name "*")))
    (save-selected-window
      (if (get-buffer asterisk-buffer-name)
	  (kill-buffer asterisk-buffer-name))
      (make-comint phpspec-buffer-name "phpspec" nil "run" "--format=pretty" file-path)
      (switch-to-buffer-other-window asterisk-buffer-name))
    ;; (switch-to-buffer-other-window asterisk-buffer-name)
    ))

     ;; progress (default)
     ;; pretty
     ;; dot
     ;; tap

(define-minor-mode deh-phpspec-mode
  "A mode for PHPSpec files."
  :init-value nil
  :lighter " phpspec"
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map (kbd "C-c M-s M-r") 'deh-phpspec-run-current-file)
	    map))

;; (add-to-list 'auto-mode-alist '("\\(s\\|S\\)pec\\.php" . deh-phpspec-mode))

(provide 'deh-phpspec)
