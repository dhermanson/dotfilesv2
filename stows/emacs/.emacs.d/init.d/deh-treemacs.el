(require 'treemacs)
(require 'treemacs-projectile)
(require 'treemacs-evil)
(require 'deh-movement)

(setq treemacs-no-png-images t)

(defun deh-treemacs-mode-hook ()
  "my treemacs mode hook"
  (setq treemacs--width-is-locked t))

(add-hook 'treemacs-mode-hook 'deh-treemacs-mode-hook)


(define-key treemacs-mode-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key treemacs-mode-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key treemacs-mode-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key treemacs-mode-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
(define-key treemacs-mode-map (kbd "M-H") 'evil-window-move-far-left)
(define-key treemacs-mode-map (kbd "M-J") 'evil-window-move-very-bottom)
(define-key treemacs-mode-map (kbd "M-K") 'evil-window-move-very-top)
(define-key treemacs-mode-map (kbd "M-L") 'evil-window-move-far-right)

(provide 'deh-treemacs)
