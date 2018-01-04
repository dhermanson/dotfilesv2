(require 'package)

;; add package archives
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; packages
(setq package-list
      '(
	ace-jump-mode
	cider
	company
	csharp-mode
	csv-mode
	darktooth-theme
	dockerfile-mode
	dracula-theme
	edit-indirect
	exec-path-from-shell
	expand-region
	feature-mode
	flycheck
	gruvbox-theme
	js2-mode
	haskell-mode
	hc-zenburn-theme
	helm
	helm-projectile
	hlinum
	markdown-mode
	monokai-theme
	ox-gfm
	ox-twbs
	php-mode
	projectile
        color-theme-sanityinc-tomorrow
        magit
        paredit
        plantuml-mode
	robe
	smartparens
	solarized-theme
	undo-tree
	web-mode
	which-key
	yasnippet
	zenburn-theme
        ))

(package-initialize)

;; fetch the list of packages available 
;; (package-refresh-contents)

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; os-x specific settings
(when (memq window-system '(mac ns))
  (setq ns-function-modifier 'hyper)
  (setq mac-function-modifier 'hyper)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)
  (exec-path-from-shell-initialize)
  )

;; set info directory
(setq Info-default-directory-list
      (cons "~/manuals/" Info-default-directory-list))
(setq Info-directory-list
      (cons "~/manuals/" Info-default-directory-list))

;; general settings
(tool-bar-mode 0)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(global-linum-mode 1) ; display line numbers
(column-number-mode 1) ; display column/row of cursor in mode-line
(show-paren-mode 1)
(global-hl-line-mode 0)

;; (require 'hlinum)
;; (hlinum-activate)


;; Show line numbers, dynamically with spaces on either side
(defadvice linum-update-window (around linum-dynamic activate)
  (let* ((w (length (number-to-string
                     (count-lines (point-min) (point-max)))))
         (linum-format (concat " %" (number-to-string w) "d ")))
    ad-do-it))

;; always enter 'y' or 'n' instead of 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; inhibit the startup screen
(setq inhibit-startup-screen t)

;; fonts
(require 'markdown-mode)
(set-default-font "Monaco-18" nil t)
(set-face-font 'markdown-pre-face "Monaco-14")
(set-face-font 'markdown-inline-code-face "Monaco-14")
(set-face-font 'markdown-language-keyword-face "Monaco-14")
(set-face-font 'markdown-code-face "Monaco-14")

;; colors
;; (color-theme-sanityinc-tomorrow-night)
;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'solarized-light t)
;; (load-theme 'darktooth t)
;; (darktooth-modeline)
(load-theme 'gruvbox-dark-medium t)
;; (load-theme 'zenburn t)
;; (load-theme 'hc-zenburn t)
;; (load-theme 'dracula t)
;; (load-theme 'monokai t)

;; backups
;; (setq backup-directory-alist `(("." . "~/.saves")))
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; (ido-mode 1)

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-highlight-all-diffs nil)
(setq ediff-diff-options "-w") ;; ignore whitespace

;; undo-tree
(global-undo-tree-mode)

;; open regularly used files quickly
(defun deh/open-init-file ()
  "open my init file"
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(defun deh/open-notes-file ()
  "open my notes file"
  (interactive)
  (find-file "~/Dropbox/org/notes.org"))

(defun deh/open-scratch-buffer ()
  "open my scratch buffer"
  (interactive)
  (switch-to-buffer "*scratch*"))

(define-key global-map (kbd "H-h") 'windmove-left)
(define-key global-map (kbd "H-j") 'windmove-down)
(define-key global-map (kbd "H-k") 'windmove-up)
(define-key global-map (kbd "H-l") 'windmove-right)
(define-key global-map (kbd "C-c o i") 'deh/open-init-file)
(define-key global-map (kbd "C-c o n") 'deh/open-notes-file)
(define-key global-map (kbd "C-c o s") 'deh/open-scratch-buffer)

;; yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
	))
(require 'yasnippet)
(yas-global-mode 1)

;; ace-jump
(define-key global-map (kbd "H-c") 'ace-jump-char-mode)
(define-key global-map (kbd "H-w") 'ace-jump-word-mode)

;; (switch-to-buffer (create-file-buffer "test-buffer"))

;; company
(define-key global-map (kbd "H-SPC") 'company-complete)
(define-key global-map (kbd "C-c c") 'company-complete)
(add-hook 'after-init-hook 'global-company-mode)

;; helm
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(helm-mode 1)

;; ruby
(defun deh/my-ruby-mode-hook ()
  "my ruby mode hook"
  (require 'smartparens-config)
  (require 'smartparens-ruby)
  (require 'robe)
  (robe-mode)
  (smartparens-mode)
  (show-smartparens-mode)
  (setq company-idle-delay nil)
  (set (make-local-variable 'company-backends) '(company-robe
						 company-files))
  (setq inf-ruby-default-implementation "pry")
  )

(add-hook 'ruby-mode-hook 'deh/my-ruby-mode-hook)

;; expand-region
;; (require 'expand-region)
(global-set-key (kbd "H-e") 'er/expand-region)

;; javascript
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; org
(require 'org)
(require 'ob-ruby)
(require 'ob-sh)
(require 'ob-haskell)
(require 'ob-plantuml)
(require 'ox-latex)
(require 'ox-twbs)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)
   (emacs-lisp . t)
   (ruby . t)
   (python . t)
   (sh . t)
   (js . t)
   (sql . t)
   (haskell . t)))
(setq org-startup-indented nil)
(setq org-src-fontify-natively t)

;; org-plantuml
(setq plantuml-jar-path "~/bin/plantuml.jar")
(setq org-plantuml-jar-path "~/bin/plantuml.jar")

;; org-latex
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; projectile-mode
(projectile-global-mode)
(setq projectile-switch-project-action 'projectile-vc)

;; feature more
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; helm-projectile
(helm-projectile-on)

;; which key
(which-key-mode)

;; undo-tree
(global-undo-tree-mode-enable-in-buffers)

;; sh-mode
(setq sh-shell "bash")

;; paredit
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; haskell-mode
(require 'haskell-mode)
;; (add-hook ’haskell-mode-hook ’interactive-haskell-mode)

;; rst-mode

(defun deh/rst-mode-hook ()
  "my rst mode hook"
  (define-key rst-mode-map (kbd "H-a") 'rst-adjust)
  )
(add-hook 'rst-mode-hook 'deh/rst-mode-hook)

;; php
(defun deh/php-mode-hook ()
  "my php mode hook"
  ;; setup etag completion
  (set (make-local-variable 'company-backends) '(company-etags))

  ;; set phpstan path
  (if (projectile-project-p)
      (set (make-local-variable 'flycheck-php-phpstan-executable)
	   (concat (projectile-project-root) "vendor/bin/phpstan")))

  ;; turn flycheck mode on
  (flycheck-mode 1))

(add-hook 'php-mode-hook 'deh/php-mode-hook)

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

(unless 
    (member 'php-phpstan flycheck-checkers)
  (add-to-list 'flycheck-checkers 'php-phpstan))

;; dired
(defun deh/dired-mode-hook ()
  "my dired mode hook"
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'deh/dired-mode-hook)

;; start a server
(server-start)


;; (put 'dired-find-alternate-file 'disabled nil)
