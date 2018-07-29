(setq evil-default-state 'emacs)
(setq evil-disable-insert-state-bindings t)

(require 'ace-jump-mode)
(require 'avy)
(require 'evil-surround)
(require 'evil)
(require 'evil-leader)
(require 'evil-numbers)
(require 'evil-commentary)
(require 'company)
(require 'treemacs)
(require 'deh-repl)
;; (require 'neotree)

(evil-commentary-mode)

(setq evil-visual-region-expanded 1)

(evil-mode 1)
(global-evil-surround-mode t)
(evil-set-initial-state 'Info-mode 'emacs)
(evil-set-initial-state 'conf-mode 'emacs)
(evil-set-initial-state 'compilation-mode 'emacs)
(evil-set-initial-state 'Man-mode 'emacs)
(evil-set-initial-state 'dockerfile-mode 'normal)
(evil-set-initial-state 'elisp-mode 'emacs)
(evil-set-initial-state 'eshell-mode 'emacs)
(evil-set-initial-state 'fsharp-mode 'normal)
(evil-set-initial-state 'go-mode 'normal)
(evil-set-initial-state 'markdown-mode 'normal)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'java-mode 'normal)
(evil-set-initial-state 'sql-mode 'normal)

(evil-set-initial-state 'json-mode 'normal)
(evil-set-initial-state 'kotlin-mode 'normal)
(evil-set-initial-state 'php-mode 'normal)
(evil-set-initial-state 'reb-mode 'emacs)
(evil-set-initial-state 'shell-mode 'emacs)
(evil-set-initial-state 'undo-tree-visualizer-mode 'emacs)
(evil-set-initial-state 'visual-basic-mode 'normal)

(defvar deh/evil-leader-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")
(define-key evil-normal-state-map (kbd "SPC") deh/evil-leader-map)
(define-key deh/evil-leader-map ";" 'ace-jump-char-mode)
;; (define-key deh/evil-leader-map ";" 'avy-goto-char)
;; (define-key deh/evil-leader-map (kbd "SPC") 'avy-goto-char)
;; (define-key deh/evil-leader-map ";" 'avy-goto-word-1)
(define-key deh/evil-leader-map "p" 'projectile-command-map)
(define-key deh/evil-leader-map "l" 'deh-helm-imenu)
;; (define-key deh/evil-leader-map "l" 'counsel-imenu)
(define-key deh/evil-leader-map "f" 'helm-projectile-find-file)
(define-key deh/evil-leader-map "rr" 'deh-restart-repl)
(define-key deh/evil-leader-map "rk" 'deh-kill-repl)
(define-key deh/evil-leader-map "ro" 'deh-focus-repl-in-other-window)

(evil-define-key nil deh/evil-leader-map "gw" 'magit-stage-file)
(evil-define-key nil deh/evil-leader-map "gds" (lambda () (interactive) (magit-ediff-show-staged (magit-current-file))))
(evil-define-key nil deh/evil-leader-map "gdu" (lambda () (interactive) (magit-ediff-show-unstaged (magit-current-file))))
(evil-define-key nil deh/evil-leader-map "gs" 'magit-status)
(evil-define-key nil deh/evil-leader-map "gb" 'magit-blame)
(evil-define-key nil deh/evil-leader-map "gc" 'magit-branch-popup)
(evil-define-key nil deh/evil-leader-map "gla" 'magit-log-all)
(evil-define-key nil deh/evil-leader-map "glb" 'magit-log-buffer-file)
(evil-define-key nil deh/evil-leader-map "a" (lambda (s)
					       (interactive "sRipgrep search for: ")
					       (projectile-ripgrep s)))
;; (define-key deh/evil-leader-map "f" 'counsel-projectile-find-file)

(evil-define-key nil evil-normal-state-map
  ;; (kbd ";") 'evil-ex
  ;; (kbd ":") 'evil-repeat-find-char
  (kbd "] q") 'next-error
  (kbd "[ q") 'previous-error
  (kbd "M-w") 'save-buffer
  (kbd "M-c") 'delete-window
  (kbd "M-o") 'delete-other-windows
  (kbd "M-n") 'make-frame-command
  (kbd "M-s") 'deh-send-current-line-to-repl
  (kbd "M-q") '(lambda ()
                 (interactive)
                 (kill-buffer (current-buffer)))
  (kbd "M-;") 'treemacs
  (kbd "C-M-c") 'flycheck-buffer
  (kbd "C-M-p") 'flycheck-previous-error
  (kbd "C-M-n") 'flycheck-next-error
  (kbd "-") 'dired-jump)

(evil-define-key nil evil-insert-state-map
  (kbd "C-SPC") 'company-complete
  (kbd "M-s") 'deh-send-current-line-to-repl)

(evil-define-key nil evil-visual-state-map
  (kbd "M-s") 'deh-send-region-to-repl)

(setq evil-leader/leader "SPC")

;; setup jumps (https://github.com/noctuid/evil-guide#jump)
(evil-add-command-properties #'deh-find-interface-tag :jump t)
(evil-add-command-properties #'counsel-imenu :jump t)
(evil-add-command-properties #'helm-imenu :jump t)

(provide 'deh-evil)
