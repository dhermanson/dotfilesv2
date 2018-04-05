(require 'package)

(add-to-list 'load-path "~/.emacs.d/init.d/")

;; add package archives
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; packages
(setq package-list
      '(
	;; elfeed
	;; embrace
	ace-jump-mode
	alchemist
	badger-theme
	cider
	company
	company-go
	csharp-mode
	csv-mode
	darktooth-theme
	dockerfile-mode
	dracula-theme
	edit-indirect
	evil
	evil-surround
	exec-path-from-shell
	expand-region
	feature-mode
	flycheck
	go-mode
	groovy-mode
	gruvbox-theme
	haskell-mode
	hc-zenburn-theme
	helm
	helm-projectile
	hlinum
	inf-groovy
	js2-mode
	lsp-php
	markdown-mode
	monokai-theme
	ox-gfm
	ox-twbs
	php-mode
	prodigy
	projectile
	robe
	smartparens
	solarized-theme
	undo-tree
	web-mode
	wgrep
	which-key
	yasnippet
	zenburn-theme
        color-theme-sanityinc-tomorrow
        magit
        paredit
        plantuml-mode))

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
(menu-bar-mode t)
(global-linum-mode 0) ; display line numbers
(column-number-mode 1) ; display column/row of cursor in mode-line
(show-paren-mode 1)
(global-hl-line-mode 0)

(require 'deh-php)

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
;; (set-face-font 'markdown-pre-face "Monaco-14")
;; (set-face-font 'markdown-inline-code-face "Monaco-14")
;; (set-face-font 'markdown-language-keyword-face "Monaco-14")
;; (set-face-font 'markdown-code-face "Monaco-14")

;; colors
;; (color-theme-sanityinc-tomorrow-night)
;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'sanityinc-tomorrow-day t)
;; (load-theme 'solarized-light t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'darktooth t)
;; (darktooth-modeline)
;; (load-theme 'gruvbox-dark-medium t)
;; (load-theme 'gruvbox-dark-soft t)
(load-theme 'zenburn t)
;; (load-theme 'hc-zenburn t)
;; (load-theme 'badger t)
;; (load-theme 'dracula t)
;; (load-theme 'monokai t)
;; (load-theme 'sexy-monochrome t)
;; (load-theme 'monochrome t)
;; (load-theme 'quasi-monochrome t)
;; (load-theme 'tao-yin t)
;; (load-theme 'eziam-dark t)
;; (load-theme 'leuven t)
;; (load-theme 'adwaita t)
;; (load-theme 'tango t)

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

(require 'evil)
(define-key global-map (kbd "C-z") nil)
(define-key global-map (kbd "H-h") 'windmove-left)
(define-key global-map (kbd "H-j") 'windmove-down)
(define-key global-map (kbd "H-k") 'windmove-up)
(define-key global-map (kbd "H-l") 'windmove-right)
(define-key global-map (kbd "H-H") 'evil-window-move-far-left)
(define-key global-map (kbd "H-J") 'evil-window-move-very-bottom)
(define-key global-map (kbd "H-K") 'evil-window-move-very-top)
(define-key global-map (kbd "H-L") 'evil-window-move-far-right)
(define-key global-map (kbd "H-o") 'other-window)
(define-key global-map (kbd "H-0") 'delete-window)
(define-key global-map (kbd "H-1") 'delete-other-windows)
(define-key global-map (kbd "H-2") 'split-window-below)
(define-key global-map (kbd "H-3") 'split-window-right)
(define-key global-map (kbd "C-c o i") 'deh/open-init-file)
(define-key global-map (kbd "C-c o n") 'deh/open-notes-file)
(define-key global-map (kbd "C-c o s") 'deh/open-scratch-buffer)
(define-key global-map (kbd "M-i") 'helm-imenu)


;; yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
	))
(require 'yasnippet)
(yas-global-mode 1)

;; ace-jump
(define-key global-map (kbd "H-c") 'ace-jump-char-mode)
(define-key global-map (kbd "H-;") 'ace-jump-char-mode)
(define-key global-map (kbd "H-w") 'ace-jump-word-mode)

;; (switch-to-buffer (create-file-buffer "test-buffer"))

;; company
(define-key global-map (kbd "H-SPC") 'company-complete)
(define-key global-map (kbd "C-;") 'company-complete)

;; (define-key global-map (kbd "H-;") 'company-complete)
(define-key global-map (kbd "C-c c") 'company-complete)
(add-hook 'after-init-hook 'global-company-mode)

;; tramp
(require 'tramp)

;; helm
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(helm-mode 1)

;; helm-projectile
(helm-projectile-on)

;; ido
;; (ido-mode 1)
;; (setq ido-everywhere t)
;; (setq ido-enable-flex-matching t)

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
  ;; turn flycheck mode on
  (flycheck-mode 0))

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
   (dot . t)
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
(setq projectile-switch-project-action 'projectile-find-file)

;; feature more
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))



;; which key
(which-key-mode)

;; undo-tree
(global-undo-tree-mode-enable-in-buffers)

;; sh-mode
(setq sh-shell "bash")

;; paredit
;; (add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
;; (add-hook 'ielm-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-mode-hook             #'enable-paredit-mode)
;; (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
;; (add-hook 'scheme-mode-hook           #'enable-paredit-mode)


;; haskell-mode
(require 'haskell-mode)
;; (add-hook ’haskell-mode-hook ’interactive-haskell-mode)

;; rst-mode

(defun deh/rst-mode-hook ()
  "my rst mode hook"
  (define-key rst-mode-map (kbd "H-a") 'rst-adjust)
  )
(add-hook 'rst-mode-hook 'deh/rst-mode-hook)



;; groovy
(require 'inf-groovy)
(setq groovy-home "/usr/local")
(inf-groovy-keys)
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))

(defun deh/groovy-mode-hook ()
  "my groovy mode hook"
  (smartparens-mode)
  ;; (electric-indent-mode)
  )
(add-hook 'groovy-mode-hook 'deh/groovy-mode-hook)

;; jenkinsf
(add-to-list 'auto-mode-alist '("\\b\\(j\\|J\\)enkinsfile\\b" . groovy-mode))

;; go-lang
(require 'go-mode)
(defun deh/go-mode-hook ()
  "my go mode hook"
  (setq tab-width 2)
  (flycheck-mode)
  (set (make-local-variable 'company-backends) '(company-go))
  )
(add-hook 'go-mode-hook 'deh/go-mode-hook)
(add-hook 'before-save-hook 'gofmt-before-save)

;; prodigy
(require 'prodigy)
(prodigy-define-service
  :name "Jenkins"
  :command "java"
  :args (list "-jar" "jenkins.war" "--httpPort=8080")
  :cwd "~/workspace/jenkins"
  :url "http://localhost:8080")

;; wgrep
(require 'wgrep)
(setq wgrep-auto-save-buffer t)

;; dired
(defun deh/dired-mode-hook ()
  "my dired mode hook"
  (dired-hide-details-mode 0))
(add-hook 'dired-mode-hook 'deh/dired-mode-hook)

;; lsp
;; (require 'lsp-php)
;; (add-hook 'php-mode-hook #'lsp-php-enable)

;; start a server
;; (server-start)

(define-key global-map (kbd "H-b") 'helm-projectile-switch-to-buffer)
(define-key global-map (kbd "H-t") 'helm-etags-select)
(define-key global-map (kbd "H-f") 'projectile-find-file)

;; embrace
;; (require 'embrace)
;; (define-key global-map (kbd "C-,") 'embrace-commander)

;; evil-surround
;; use this without evil mode
;; (require 'evil-surround)
;; (evil-surround-mode)
;; (define-key global-map (kbd "C-; c s") 'evil-surround-change)
;; (define-key global-map (kbd "C-; c s") ')
;; (define-key global-map (kbd "C-c s r") 'evil-surround-region)
;; evil-mode
;; (require 'evil)
;; (setq evil-default-state 'emacs)
;; (evil-mode 1)
;; (evil-set-initial-state 'ruby-mode 'normal)

;; (defvar deh/evil-leader-map (make-sparse-keymap)
;;   "Keymap for \"leader key\" shortcuts.")
;; (define-key evil-normal-state-map (kbd "SPC") deh/evil-leader-map)
;; (define-key deh/evil-leader-map ";" 'ace-jump-char-mode)


(put 'dired-find-alternate-file 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(define-key global-map (kbd "C-s-f") 'toggle-frame-fullscreen)

(defun deh/newline-indent-action (id action context)
  (when (eq action 'insert)
    (newline-and-indent)
    (previous-line)
    (indent-according-to-mode)))

(require 'smartparens)
(sp-with-modes '(php-mode json-mode)
  (sp-local-pair "{" "}"
		 :when '(("RET"))
		 :post-handlers '(:add deh/newline-indent-action)
		 :actions '(insert)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (wgrep zenburn-theme yasnippet which-key web-mode tao-theme solarized-theme smartparens sexy-monochrome-theme semi robe railscasts-theme quasi-monochrome-theme prodigy powershell plantuml-mode php-mode paredit ox-twbs ox-gfm neotree monokai-theme monochrome-theme markdown-mode magit lsp-php js2-mode jenkins inf-groovy hydra hlinum helm-projectile hc-zenburn-theme haskell-mode gruvbox-theme groovy-mode feature-mode eziam-theme exec-path-from-shell evil-surround enh-ruby-mode embrace edit-indirect dracula-theme dockerfile-mode docker darktooth-theme csv-mode csharp-mode company-lsp company-go color-theme-sanityinc-tomorrow cider badger-theme alchemist ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
