;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq evil-want-C-u-scroll t)
(require 'package)

(add-to-list 'load-path "~/.emacs.d/init.d/")

;; add package archives
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)

;; (setq package-archive-priorities
;;       '(("org" . 40)
;; 	("melpa-stable" . 30)
;; 	("marmalade" . 20)
;; 	("gnu" . 15)
;; 	("melpa" . 10)))

;; packages
(setq package-list
      '(
	      ;; elfeed
	      ;; embrace
	      ace-jump-mode
        adoc-mode
	      alchemist
	      anti-zenburn-theme
        apib-mode
        avy
	      badger-theme
	      cider
	      company
	      company-go
	      company-tern
	      company-web
	      counsel
	      counsel-etags
	      counsel-projectile
	      csharp-mode
	      csv-mode
	      darktooth-theme
        diminish
	      dockerfile-mode
        doom-themes
	      dracula-theme
	      eclim
	      edit-indirect
	      emmet-mode
	      evil
	      evil-commentary
	      evil-leader
        evil-numbers
	      evil-surround
	      exec-path-from-shell
	      expand-region
	      f
	      fsharp-mode
	      feature-mode
	      flycheck
	      ggtags
	      go-mode
	      groovy-mode
	      gruvbox-theme
	      haskell-mode
	      hc-zenburn-theme
	      helm
	      helm-projectile
	      helm-rg
	      hlinum
	      ht
        htmlize
	      inf-groovy
	      js2-mode
	      json-mode
	      kotlin-mode
	      markdown-mode
	      monokai-theme
	      neotree
	      org-bullets
	      ox-gfm
	      ox-twbs
	      omnisharp
	      php-mode
	      prodigy
	      projectile
	      restclient
	      ripgrep
        rjsx-mode
	      robe
	      smartparens
	      spacemacs-theme
	      solarized-theme
	      tern
	      tide
	      treemacs
	      undo-tree
	      web-mode
	      wgrep
	      which-key
	      yasnippet
	      zenburn-theme
        color-theme-sanityinc-tomorrow
        magit
        paredit
        plantuml-mode
	      yaml-mode
	      omtose-phellack-theme))

(package-initialize)


;; TODO: put this somewhere else
(setenv "NODE_NO_READLINE" "1")

;; fetch the list of packages available 
;; (package-refresh-contents)

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'f)

;; set info directory
(setq Info-default-directory-list
      (cons "~/manuals/" Info-default-directory-list))
(setq Info-directory-list
      (cons "~/manuals/" Info-default-directory-list))

;; disable control-z
(define-key global-map (kbd "C-z") nil)

;; general settings
;; (tool-bar-mode 0)
;; (scroll-bar-mode 0)
;; (menu-bar-mode 0)
;; (global-linum-mode 0) ; display line numbers

;; (setq-default cursor-type '(bar . 2))

(require 'deh-appearance)
(require 'deh-shell)
(require 'deh-dired)
(require 'deh-ediff)
(require 'deh-minibuffer)
(require 'deh-treemacs)
(require 'deh-magit)
(require 'deh-macos)
(require 'deh-sh)
(require 'deh-yaml)
(require 'deh-xml)
(require 'deh-ace-jump)
(require 'deh-evil)
(require 'deh-eclim)
(require 'deh-restclient)
(require 'deh-prog)
(require 'deh-ruby)
(require 'deh-css)
(require 'deh-php)
(require 'deh-markdown)
(require 'deh-json)
(require 'deh-ivy)
(require 'deh-counsel)
(require 'deh-movement)
(require 'deh-project)
(require 'deh-kotlin)
(require 'deh-java)
(require 'deh-org)
(require 'deh-apib)
(require 'deh-fsharp)
(require 'deh-javascript)
(require 'deh-typescript)
(require 'deh-text)
(require 'deh-makefile)
(require 'deh-csharp)
(require 'deh-helm)
(require 'deh-image)
(require 'deh-web)
(require 'deh-global-maps)
(require 'deh-repl)

(setq-default indent-tabs-mode nil)

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

;; backups
;; (setq backup-directory-alist `(("." . "~/.saves")))
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq create-lockfiles nil) ; don't create .# files
;; backup in one place. flat, no tree structure
;; (setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; (ido-mode 1)

;; ediff
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-highlight-all-diffs t)
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

(define-key global-map (kbd "C-c o i") 'deh/open-init-file)
(define-key global-map (kbd "C-c o n") 'deh/open-notes-file)
(define-key global-map (kbd "C-c o s") 'deh/open-scratch-buffer)

(setq flycheck-check-syntax-automatically '(save))
;; (setq flycheck-check-syntax-automatically nil)

;; yasnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
	))
(require 'yasnippet)
(yas-global-mode 1)

;; ace-jump
;; (define-key global-map (kbd "H-c") 'ace-jump-char-mode)
;; (define-key global-map (kbd "H-;") 'ace-jump-char-mode)
;; (define-key global-map (kbd "H-w") 'ace-jump-word-mode)

;; (switch-to-buffer (create-file-buffer "test-buffer"))

;; company
(require 'company)
(setq company-dabbrev-downcase nil)
(setq company-show-numbers 1)
(setq company-candidates-length 25)
(define-key global-map (kbd "H-SPC") 'company-complete)
(define-key global-map (kbd "C-;") 'company-complete)
(setq company-gtags-insert-arguments nil)

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

;; counsel
;; (define-key global-map (kbd "M-x") 'counsel-M-x)
;; (define-key global-map (kbd "C-x C-f") 'counsel-find-file)
;; (counsel-projectile-mode)

;; ido
;; (ido-mode 1)
;; (setq ido-everywhere t)
;; (setq ido-enable-flex-matching t)

;; expand-region
;; (require 'expand-region)
(global-set-key (kbd "H-e") 'er/expand-region)

;; visual-basic
(require 'visual-basic-mode)
(add-to-list 'auto-mode-alist '("\\.vb\\'" . visual-basic-mode))

;; projectile-mode
(projectile-global-mode)
;; (setq projectile-project-types nil)
;; (setq projectile-project-root-files (list ".derick"))
(require 'projectile)
;; (setq projectile-project-root-files-functions
;;       (list projectile-root-local
;; 	    projectile-root-bottom-up
;; 	    projectile-root-top-down
;; 	    projectile-root-top-down-recurring))
(setq projectile-switch-project-action 'projectile-run-shell)
;; (setq projectile-tags-backend 'etags-select-find-tag)
(setq projectile-tags-backend 'helm-gtags-select)

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
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

;; lisp smartparens
;; (add-hook 'emacs-lisp-mode-hook       #'smartparens-mode)
;; (add-hook 'eval-expression-minibuffer-setup-hook #'smartparens-mode)
;; (add-hook 'ielm-mode-hook             #'smartparens-mode)
;; (add-hook 'lisp-mode-hook             #'smartparens-mode)
;; (add-hook 'lisp-interaction-mode-hook #'smartparens-mode)
;; (add-hook 'scheme-mode-hook           #'smartparens-mode)


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

;; web-mode
;; TODO: read about associating specific engines.
;; example:
;;   (setq web-mode-engines-alist
;;         '(("php"    . "\\.phtml\\'")
;;           ("blade"  . "\\.blade\\."))
;;   )
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; dired
(defun deh/dired-mode-hook ()
  "my dired mode hook"
  (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'deh/dired-mode-hook)

;; fsharp
(require 'fsharp-mode)

;; lsp
;; (require 'lsp-php)
;; (add-hook 'php-mode-hook #'lsp-php-enable)

;; start a server
;; (server-start)

(define-key global-map (kbd "H-b") 'helm-projectile-switch-to-buffer)
(define-key global-map (kbd "H-t") 'helm-etags-select)
(define-key global-map (kbd "H-f") 'projectile-find-file)

(put 'dired-find-alternate-file 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun deh/newline-indent-action (id action context)
  (when (eq action 'insert)
    (newline-and-indent)
    (previous-line)
    (indent-according-to-mode)))

(defun deh/dockblock-line-action (id action context)
  (when (eq action 'insert)
    (newline-and-indent)
    (insert "* ")))

(require 'smartparens)
(sp-with-modes '(php-mode
		 json-mode
		 fsharp-mode
		 js2-mode
		 typescript-mode)
  (sp-local-pair "{" "}"
		 :when '(("RET"))
		 :post-handlers '(:add deh/newline-indent-action)
		 :actions '(insert)))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eclim-eclipse-dirs (list "~/eclipse/java-oxygen/Eclipse.app/Contents/Eclipse"))
 '(package-selected-packages
   (quote
    (rjsx-mode evil-numbers apib-mode adoc-mode htmlize applescript-mode molokai-theme diminish doom-themes ripgrep ranger editorconfig treemacs-evil treemacs-projectile helm-rg evil-commentary company-web emmet-mode counsel-gtags company-tern counsel-etags json-mode anti-zenburn-theme spacemacs-theme evil-leader omnisharp tide ht ## counsel-projectile counsel ivy org-bullets eclim flycheck-kotlin kotlin-mode nlinum-relative omtose-phellack-theme color-theme-railscasts yaml-mode f helm-gtags ggtags gtags restclient fsharp-mode wgrep zenburn-theme yasnippet which-key web-mode tao-theme solarized-theme smartparens sexy-monochrome-theme semi robe railscasts-theme quasi-monochrome-theme prodigy powershell plantuml-mode php-mode paredit ox-twbs ox-gfm neotree monokai-theme monochrome-theme markdown-mode magit js2-mode jenkins inf-groovy hydra hlinum helm-projectile hc-zenburn-theme haskell-mode gruvbox-theme groovy-mode feature-mode eziam-theme exec-path-from-shell evil-surround enh-ruby-mode embrace edit-indirect dracula-theme dockerfile-mode docker darktooth-theme csv-mode csharp-mode company-lsp company-go color-theme-sanityinc-tomorrow cider badger-theme alchemist ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
