;;; -*- lexical-binding: t -*-

(require 'php-mode)
(require 'ggtags)
(require 'f)
(require 's)
(require 'smartparens)
(require 'evil)
(require 'evil-leader)
(require 'ht)
(require 'deh-phpspec)
(require 'deh-phpunit)

;; TODO: create a "project init" function that creates ./.derick and other things??
;; TODO: make a "with-php-tooling-setup" macro
;; TODO: turn deh-php-project-ctags-file and deh-php-project-ctags-args into functions (that take in project dir?)

(defcustom deh-phpstan-executable
  "phpstan"
  "the executable path to phpstan")

;; TODO: move this somewhere else
(defcustom deh-ctags-executable
  "ctags "
  "the executable path to ctags")

(defcustom deh-project-custom-dir
  ".derick"
  "the project custom dir")

(defcustom deh-php-project-ctags-file
  (concat deh-project-custom-dir "/ctags-php-project")
  "the project ctags file")

(defcustom deh-php-vendor-ctags-file
  (concat deh-project-custom-dir "/ctags-php-vendor")
  "the vendor ctags file")

(defcustom deh-php-language-ctags-file
  "~/.language-ctags/php/emacs-tags"
  "the vendor ctags file")

(defcustom deh-php-project-ctags-args
  (concat " -R --fields=K --PHP-kinds=zty --languages=php --tag-relative=yes --exclude=vendor --exclude=bootstrap --exclude=_ide_helper.php -e -f " deh-php-project-ctags-file)
  "the arguments for creating ctags for php")

(defcustom deh-php-vendor-ctags-args
  ;; (concat " -R --fields=K --PHP-kinds=zty --languages=php --tag-relative=yes --exclude=vendor --exclude=bootstrap --exclude=_ide_helper.php -e -f " deh-php-project-ctags-file)
  (concat " -R --fields=K --PHP-kinds=zty --languages=php --exclude=test --exclude=tests --exclude=spec --exclude=specs --exclude=Test --exclude=Tests --exclude=Spec --exclude=Specs -e -f " deh-php-vendor-ctags-file " vendor")
  "the arguments for creating vendor ctags for php")

(defun deh-php-src-dir ()
  (if (deh-php-is-project-laravel?)
      "app"
    "src"))

(defun deh-php-is-project-laravel? ()
  (let* ((root (projectile-project-root))
	 (default-directory root))
    (and root
	 (f-exists? (f-join root "artisan"))))
  )

(defun deh-php-project-repl-name (&optional without-stars)
  "return the name of the repl"
  (if without-stars
      (concat "repl " (projectile-project-name))
    (concat "*repl " (projectile-project-name) "*")))

(defun deh-php-project-repl-command ()
  "return the repl for the project"
  (if (deh-php-is-project-laravel?)
      "php artisan tinker"
    "psysh"))

(defun deh-generate-php-language-tags ()
  "generate php language tags"
  (shell-command ))

(defun deh-initialize-php-tooling-for-project ()
  "initializes my tooling for php projects"
  (interactive)
  (unless (f-exists? deh-project-custom-dir)
    (make-directory deh-project-custom-dir)))

(defun deh-projectile-phpstan-on-current-file ()
  "run phpstan on current file"
  (interactive)
  (let* ((filename (buffer-file-name))
	 (project-root (projectile-project-root))
	 (relative-path (file-relative-name filename project-root)))
    (setq default-directory project-root)
    (compile (concat deh-phpstan-executable " analyse --no-progress --level=6 --no-ansi --no-interaction --errorFormat=raw " relative-path))))

(defun deh-projectile-phpstan-on-project ()
  "run phpstan on current project"
  (interactive)
  (let* ((project-root (projectile-project-root)))
    (setq default-directory project-root)
    (compile (concat deh-phpstan-executable " analyse --no-progress --level=6 --no-ansi --no-interaction --errorFormat=raw " (deh-php-src-dir)))))

(defun deh-generate-php-project-tags ()
  "generate etags for php codebase"
  (interactive)
  (let* ((project-root (projectile-project-root)) 
	 (project-ctags-cmd (concat deh-ctags-executable deh-php-project-ctags-args)))
    (progn
      (setq default-directory project-root)
      (deh-initialize-php-tooling-for-project)
      (async-shell-command project-ctags-cmd))))

(defun deh-generate-php-vendor-tags ()
  "generate etags for php codebase"
  (interactive)
  (let* ((project-root (projectile-project-root)) 
	 (vendor-ctags-cmd (concat deh-ctags-executable deh-php-vendor-ctags-args)))
    (progn
      (setq default-directory project-root)
      (deh-initialize-php-tooling-for-project) 
      (async-shell-command vendor-ctags-cmd))))

;; TODO: look into helm-etags-select: the tag aggregation specifically
(defun deh-find-interface-tag ()
  "find interface|class|function tag"
  (interactive)
  (let* ((project-root (projectile-project-root))
	 (full-project-tags-path (concat (file-name-as-directory project-root) deh-php-project-ctags-file))
	 (full-vendor-tags-path (concat (file-name-as-directory project-root) deh-php-vendor-ctags-file)))
    (progn
      (setq default-directory project-root)
      (unless (f-exists? deh-php-project-ctags-file)
	(deh-generate-php-project-tags))
      (unless (f-exists? deh-php-vendor-ctags-file)
	(deh-generate-php-vendor-tags))
      (setq tags-table-list (list full-project-tags-path full-vendor-tags-path deh-php-language-ctags-file))
      ;; (helm-etags-select t)
      (counsel-etags-find-tag)
      )))

(defun deh-run-phpcbf-on-buffer ()
  "run phpcbf on current file"
  (interactive)
  (let* ((file (buffer-file-name)))
    (save-buffer)
    (shell-command (concat "phpcbf --standard=~/ruleset.xml " file))
    (revert-buffer nil t)))

(defun deh-php-current-file-in-vendor-dir? ()
  (and buffer-file-name
       (f-descendant-of?
	buffer-file-name
	(f-join (projectile-project-root) "vendor"))))

;; (define-key php-mode-map (kbd "H-t") 'helm-gtags-select)
;; (define-key php-mode-map (kbd "M-.") 'helm-gtags-dwim)
;; (define-key php-mode-map (kbd "M-,") 'helm-gtags-pop-stack)

(defun deh-php-docblock-newline (orig-fun &rest args)
  "add * prefix when inside docblock on newline"
  (if (and major-mode
	   (s-equals? major-mode "php-mode")
	   (s-match "^[[:space:]]*\\(\\*\\|\\/\\*\\*\\)" (thing-at-point 'line t)))
      (progn
	(apply orig-fun args)
	(insert "* ")
	(c-indent-line-or-region))
    (apply orig-fun args)))

(advice-add 'newline :around #'deh-php-docblock-newline)

;; add phpstan to flycheck-checkers list
(require 'flycheck)
(setq flycheck-phpcs-standard "~/ruleset.xml")
;; (setq flycheck-phpcs-standard nil)
(flycheck-define-checker php-phpstan
  "A PHP syntax checker using the PHPStan static analysic tool."
  :command ("phpstan" "analyse" "--no-progress" "--no-interaction" "--autoload-file=vendor/autoload.php" "--errorFormat=raw" "--level=6" source)
  :error-patterns
  ((error line-start (file-name) ":" line ":" (message) line-end))
  :modes php-mode
  :working-directory (lambda (&optional checker)
		       (projectile-project-root)))


(add-to-list 'flycheck-checkers 'php-phpstan)
(flycheck-add-next-checker 'php-phpstan 'php-phpcs)

(add-to-list
 'compilation-error-regexp-alist-alist
 '(php
   "^\\([0-9a-zA-Z/ .-]+\\.php\\):\\([0-9]*\\)" 1 2))

(defun deh-php-create-repl ()
  "create a repl that the current buffer can interact with "
  (interactive)
  (let ((default-directory (projectile-project-root)))
    (if (deh-php-is-project-laravel?)
	(make-comint (deh-php-project-repl-name t) "php" nil "artisan" "tinker")
      (make-comint (deh-php-project-repl-name t) "psysh"))))

(defun deh-php-send-to-repl ()
  (interactive)
  ;; TODO: create shell if doesn't exist
  (let* ((repl-buffer-name (deh-php-project-repl-name))
	 (repl-buffer (get-buffer repl-buffer-name))
	 (default-directory (projectile-project-root))
	 (existing-buffer (current-buffer))
	 (line (thing-at-point 'line t))
	 (start (region-beginning))
	 (end (region-end))
	 (using-region (use-region-p)))
    
    (save-excursion
      (unless repl-buffer
	      (progn
	        (deh-php-create-repl)
	        (sleep-for 0.1)
	        (switch-to-buffer existing-buffer)
	        (switch-to-buffer-other-window repl-buffer-name)
	        (other-window 1)
	        ))
      
      
      (if (use-region-p)
	        (progn
	          (send-region repl-buffer-name start end)
	          (deactivate-mark))
	      (send-string repl-buffer-name line))
      (send-string repl-buffer-name "\n"))))

(defun deh-php-restart-repl ()
  "restart the php interpreter"
  (interactive)
  (let ((current-buffer (current-buffer))
	(repl-buffer (get-buffer (deh-php-project-repl-name))))
    (if repl-buffer
	(with-current-buffer repl-buffer
	  (send-string (deh-php-project-repl-name) "exit")
	  (send-string (deh-php-project-repl-name) "\n")
	  (sleep-for 0.3)
	  (deh-php-create-repl))
      (deh-php-create-repl))
    (switch-to-buffer current-buffer)))

(defun deh-php-artisan-list ()
  "list the artisan items"
  (let ((default-directory (projectile-project-root))
	(hash (ht-create)))
    (reverse
     (ht-get
      (-reduce-from
       (lambda (memo line)
	 (let* ((begin (ht-get memo :begin))
		(current-commands (ht-get memo :commands))
		(trimmed-line (s-trim line))
		(split-trimmed-line (s-split "\s+" trimmed-line)))
	   (if (and begin
		    (> (length split-trimmed-line) 1))
	       (let* ((command-name (car split-trimmed-line))
		      (command-description (s-join " " (cdr split-trimmed-line))))
		 (ht-set! memo :commands (cons command-name current-commands))
		 )
	       
	     (if (s-equals? line "Available commands:")
		 (ht-set! memo :begin t)))
	   memo))
       hash
       (s-split "\n" (shell-command-to-string "php artisan list")))
      :commands))))

(defun deh-php-artisan-helm-list ()
  "list the artisan items in a helm completion buffer"
  (interactive)
  (helm
   :sources (helm-build-sync-source "php artisan"
	      :candidates (deh-php-artisan-list)
	      :fuzzy-match t)
   :buffer "*helm artisan-list*"))

(define-key php-mode-map (kbd "C-c C-s") 'deh-php-restart-repl)
(define-key php-mode-map (kbd "H-s") 'deh-php-send-to-repl)
;; (define-key php-mode-map (kbd "M-s") 'deh-php-send-to-repl)
;; (evil-define-key 'normal 'php-mode-map (kbd "M-s") 'deh-php-send-to-repl)
;; (evil-define-key 'insert 'php-mode-map (kbd "M-s") 'deh-php-send-to-repl)
;; (evil-define-key 'visual 'php-mode-map (kbd "M-s") 'deh-php-send-to-repl)
;; (evil-define-key 'normal 'php-mode-map (kbd "M-a") 'deh-php-artisan-helm-list)
;; (define-key evil-normal-state-map (kbd "M-s") 'deh-php-send-to-repl)
;; (define-key evil-visual-state-map (kbd "M-s") 'deh-php-send-to-repl)
;; (define-key evil-insert-state-map (kbd "M-s") 'deh-php-send-to-repl)
;; (define-key evil-normal-state-map (kbd "M-a") 'deh-php-artisan-helm-list)
;; (define-key php-mode-map (kbd "M-O") 'deh-php-restart-repl)
(define-key php-mode-map (kbd "C-c c s f") 'deh-projectile-phpstan-on-current-file)
(define-key php-mode-map (kbd "C-c c s p") 'deh-projectile-phpstan-on-project)
(define-key php-mode-map (kbd "C-c c c b f") 'deh-run-phpcbf-on-buffer)
;; (define-key php-mode-map (kbd "C-c c t p g") 'deh-generate-php-project-tags)
;; (define-key php-mode-map (kbd "C-c c t v g") 'deh-generate-php-vendor-tags)
;; (define-key php-mode-map (kbd "C-c c t f") 'deh-projectile-phpunit-on-current-file)
;; (define-key php-mode-map (kbd "H-t") 'deh-find-interface-tag)

(evil-leader/set-key-for-mode 'php-mode
  "k" 'deh-find-interface-tag)

(defun deh-php-mode-hook ()
  "my php mode hook"
  ;; if in vendor directory, make read-only
  (if (deh-php-current-file-in-vendor-dir?)
      (read-only-mode))
  (linum-mode 0)
  ;; setup etag completion
  (setq indent-tabs-mode nil
	tab-width 2
	c-basic-offset 2)
  (set (make-local-variable 'company-backends) '((company-dabbrev-code
						  company-etags
						  ;; company-gtags
						  )))
  (if (and (buffer-file-name)
	   (s-matches? "\\(s\\|S\\)pec\\.php" (buffer-file-name)))
      (deh-phpspec-mode 1)
    (define-key php-mode-map (kbd "C-c M-s M-r") 'deh-phpspec-run-current-file))
  (if (and (buffer-file-name)
	   (s-matches? "\\(t\\|T\\)est\\.php" (buffer-file-name)))
      (deh-phpunit-mode 1))

  (setenv "GTAGSLIBPATH" (concat (file-name-as-directory (getenv "HOME")) ".language-ctags/php/"))
  (flycheck-mode t)
  (smartparens-mode t)
  ;; (ggtags-mode 1)
  ;; (require 'helm-gtags)
  ;; (helm-gtags-mode)

  (evil-surround-mode t)
  (evil-leader-mode t)

  ;; (setq helm-etags-fuzzy-match t)
  ;; (customize-set-variable 'helm-etags-fuzzy-match nil)

  (setq evil-want-C-u-scroll t)
  ;; (define-key deh/evil-leader-map "k" 'helm-gtags-select)
  ;; (define-key deh/evil-leader-map "b" 'helm-projectile-switch-to-buffer)
  ;; (define-key deh/evil-leader-map "l" 'deh-helm-imenu)
  ;; (define-key evil-normal-state-map (kbd "C-]") 'helm-gtags-dwim)

  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
  ;; (setq-local imenu-create-index-function #'ggtags-build-imenu-index)
  )

(add-hook 'php-mode-hook 'deh-php-mode-hook)

(provide 'deh-php)
