(require 'evil)

(setq lexical-binding t)

(defun deh-windmove-create-or-select-window-right ()
  "create or select window to the right"
  (interactive)
  (let* ((other-window (windmove-find-other-window 'right)))
    (unless other-window
      (evil-window-vsplit))
    (windmove-right)))

(defun deh-windmove-create-or-select-window-left ()
  "create or select window to the left"
  (interactive)
  (let* ((other-window (windmove-find-other-window 'left)))
    (if other-window
	(windmove-left)
      (evil-window-vsplit))))

(defun deh-windmove-create-or-select-window-down ()
  "create or select window to the down"
  (interactive)
  (let* ((other-window (windmove-find-other-window 'down)))
    (if (and (window-minibuffer-p other-window)
	     (not (minibuffer-window-active-p other-window)))
	(evil-window-split))
    (windmove-down)))

(defun deh-windmove-create-or-select-window-up ()
  "create or select window to the up"
  (interactive)
  (let* ((other-window (windmove-find-other-window 'up)))
    (if other-window
	(windmove-up)
      (evil-window-split))))

(define-key evil-normal-state-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key evil-normal-state-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key evil-normal-state-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key evil-normal-state-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)
(define-key evil-insert-state-map (kbd "M-l") 'deh-windmove-create-or-select-window-right)
(define-key evil-insert-state-map (kbd "M-h") 'deh-windmove-create-or-select-window-left)
(define-key evil-insert-state-map (kbd "M-k") 'deh-windmove-create-or-select-window-up)
(define-key evil-insert-state-map (kbd "M-j") 'deh-windmove-create-or-select-window-down)

(define-key evil-normal-state-map (kbd "M-H") 'evil-window-move-far-left)
(define-key evil-normal-state-map (kbd "M-J") 'evil-window-move-very-bottom)
(define-key evil-normal-state-map (kbd "M-K") 'evil-window-move-very-top)
(define-key evil-normal-state-map (kbd "M-L") 'evil-window-move-far-right)

(provide 'deh-movement)
