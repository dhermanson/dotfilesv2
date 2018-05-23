(require 'f)

(defun deh-phpunit-run-current-file ()
  "run phpunit on current file"
  (interactive)
  (let* ((default-directory (projectile-project-root))
	 (file-path (f-relative (buffer-file-name) default-directory))
	 (phpunit-buffer-name (concat "phpunit " (projectile-project-name)))
	 (asterisk-buffer-name (concat "*" phpunit-buffer-name "*")))
    
    (save-selected-window
      (if (get-buffer asterisk-buffer-name)
      	  (kill-buffer asterisk-buffer-name))
      
      (make-comint phpunit-buffer-name "phpunit" nil "--bootstrap" "vendor/autoload.php" file-path)
      (switch-to-buffer-other-window asterisk-buffer-name))
    ;; (switch-to-buffer-other-window asterisk-buffer-name)
    ))

(defun deh-projectile-phpunit-on-current-file ()
  "run phpunit on current file"
  (interactive)
  (let* ((filename (buffer-file-name))
	 (project-root (projectile-project-root))
	 (relative-path (file-relative-name filename project-root)))
    (setq default-directory project-root)
    (compile (concat  " phpunit --bootstrap vendor/autoload.php " relative-path))))

     ;; progress (default)
     ;; pretty
     ;; dot
     ;; tap

(define-minor-mode deh-phpunit-mode
  "A mode for Phpunit files."
  :init-value nil
  :lighter " phpunit"
  :keymap (let ((map (make-sparse-keymap)))
	    (define-key map (kbd "C-c M-t M-r") 'deh-phpunit-run-current-file)
	    map))

;; (add-to-list 'auto-mode-alist '("\\(s\\|S\\)pec\\.php" . deh-phpunit-mode))

(provide 'deh-phpunit)
