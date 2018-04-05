(require 'php-mode)

;; TODO: create a "project init" function that creates ./.derick and other things??
;; TODO: make a "with-php-tooling-setup" macro

(defcustom deh-phpstan-executable
  "phpstan-raw"
  "the executable path to phpstan")

;; TODO: move this somewhere else
(defcustom deh-ctags-executable
  "ctags "
  "the executable path to ctags")

(defcustom deh-project-custom-dir
  "./.derick"
  "the project custom dir")

(defcustom deh-php-project-ctags-file
  (concat deh-project-custom-dir "/ctags-php-project")
  "the project custom dir")

(defcustom deh-php-project-ctags-args
  (concat " -R --fields=K --PHP-kinds=zty --languages=php --tag-relative=yes --exclude=vendor --exclude=bootstrap --exclude=_ide_helper.php -e -f " deh-php-project-ctags-file)
  "the arguments for creating ctags for php")

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
    (compile (concat deh-phpstan-executable " " relative-path))))

(defun deh-projectile-phpstan-on-project ()
  "run phpstan on current project"
  (interactive)
  (let* ((project-root (projectile-project-root)))
    (setq default-directory project-root)
    (compile (concat deh-phpstan-executable " app"))))

(defun deh-generate-php-tags ()
  "generate etags for php codebase"
  (interactive)
  (let* ((project-root (projectile-project-root))
	 (cmd (concat deh-ctags-executable deh-php-project-ctags-args)))
    (progn
      (setq default-directory project-root)
      (deh-initialize-php-tooling-for-project)
      (shell-command cmd))))

;; TODO: look into helm-etags-select: the tag aggregation specifically
(defun deh-find-interface-tag ()
  "find interface|class|function tag"
  (interactive)
  (progn
    (setq default-directory (projectile-project-root))
    (unless (f-exists? deh-php-project-ctags-file)
      (deh-generate-php-tags))
    (setq tags-table-list (list (file-relative-name deh-php-project-ctags-file (projectile-project-root))))    
    (helm-etags-select t)))

(defun deh-run-phpcbf-on-buffer ()
  "run phpcbf on current file"
  (interactive)
  (let* ((file (buffer-file-name)))
    (save-buffer)
    (shell-command (concat "phpcbf " file))
    (revert-buffer nil t)))

(defun deh-php-mode-hook ()
  "my php mode hook"
  ;; setup etag completion
  (set (make-local-variable 'company-backends) '(company-etags company-dabbrev))

  ;; set phpstan path
  (if (projectile-project-p)
      (set (make-local-variable 'flycheck-php-phpstan-executable)
  	   (concat (projectile-project-root) "vendor/bin/phpstan")))

  ;; turn flycheck mode on
  (flycheck-mode 1)
  (smartparens-mode))

(add-hook 'php-mode-hook 'deh-php-mode-hook)

;; add phpstan to flycheck-checkers list
(require 'flycheck)
(flycheck-define-checker php-phpstan
  "A PHP syntax checker using the PHPStan static analysic tool."
  :command ("phpstan" "analyse" "--errorFormat=raw" "--level=6" source)
  :error-patterns
  ((error line-start (file-name) ":" line ":" (message) line-end))
  :modes php-mode
  :predicate (lambda ()
	       (and
		(buffer-file-name)
		(projectile-project-p)
		(file-exists-p
		 (concat (projectile-project-root) "vendor/bin/phpstan")))))


(add-to-list 'flycheck-checkers 'php-phpstan)
(flycheck-add-next-checker 'php-phpstan 'php-phpcs)

(define-key php-mode-map (kbd "C-c c s f") 'deh-projectile-phpstan-on-current-file)
(define-key php-mode-map (kbd "C-c c s p") 'deh-projectile-phpstan-on-project)
(define-key php-mode-map (kbd "H-t") 'deh-find-interface-tag)

(provide 'deh-php)

