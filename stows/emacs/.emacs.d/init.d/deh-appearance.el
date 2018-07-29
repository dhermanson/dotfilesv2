(require 'diminish)

(setq-default tab-width 2)
(setq inhibit-startup-screen t)
(column-number-mode 1) ; display column/row of cursor in mode-line
(show-paren-mode 1)
(global-hl-line-mode 0)
;; (setq-default left-fringe-width 5)
;; (setq-default right-fringe-width 5)

;; fonts
(require 'markdown-mode)
(set-default-font "Monaco-14" nil t)
;; (set-face-font 'markdown-pre-face "Monaco-14")
;; (set-face-font 'markdown-inline-code-face "Monaco-14")
;; (set-face-font 'markdown-language-keyword-face "Monaco-14")
;; (set-face-font 'markdown-code-face "Monaco-14")

;; colors
(defun deh-load-zenburn ()
  "load zenburn"
  (load-theme 'zenburn t)
  (set-face-background 'fringe "#3F3F3F")
  (set-face-foreground 'vertical-border (cdr (assoc "zenburn-bg-1" zenburn-default-colors-alist))))

(deh-load-zenburn)


;; (color-theme-sanityinc-tomorrow-night)
;; (load-theme 'sanityinc-tomorrow-night t)
;; (load-theme 'sanityinc-tomorrow-day t)
;; (load-theme 'sanityinc-tomorrow-eighties t)
;; (load-theme 'omtose-softer t)
;; (load-theme 'omtose-darker t)
;; (load-theme 'solarized-light t)
;; (load-theme 'solarized-dark t)
;; (load-theme 'darktooth t)
;; (darktooth-modeline)
;; (load-theme 'gruvbox-dark-hard t)
;; (load-theme 'gruvbox-dark-soft t)





;; (load-theme 'molokai t)
;; (load-theme 'doom-molokai t)
;; (load-theme 'doom-vibrant t)
;; (load-theme 'doom-one t)
;; (load-theme 'hc-zenburn t)
;; (load-theme 'anti-zenburn t)
;; (load-theme 'spacemacs-dark t)
;; (load-theme 'spacemacs-light t)
;; (require 'spacemacs-theme)
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
;; (load-theme 'railscasts t)

(eval-after-load 'yasnippet '(diminish 'yas-minor-mode))
(eval-after-load 'paredit '(diminish 'paredit-mode))
(eval-after-load 'eldoc '(diminish 'eldoc-mode))
(eval-after-load 'which-key '(diminish 'which-key-mode))
(eval-after-load 'helm-mode '(diminish 'helm-mode))
(eval-after-load 'company '(diminish 'company-mode))
(eval-after-load 'undo-tree '(diminish 'undo-tree-mode))
(eval-after-load 'projectile '(diminish 'projectile-mode))
(eval-after-load 'evil-commentary '(diminish 'evil-commentary-mode))
(eval-after-load 'emmet-mode '(diminish 'emmet-mode))
(eval-after-load 'editorconfig '(diminish 'editorconfig-mode))
(eval-after-load 'flycheck '(diminish 'flycheck-mode))
(eval-after-load 'autorevert '(diminish 'auto-revert-mode))
(eval-after-load 'smartparens '(diminish 'smartparens-mode))
(eval-after-load 'omnisharp '(diminish 'omnisharp-mode))
(eval-after-load 'robe '(diminish 'robe-mode))
(eval-after-load 'abbrev '(diminish 'abbrev-mode))
(diminish 'visual-line-mode)

(provide 'deh-appearance)
