(require 'smartparens)

(defun deh-fsharp-mode-hook ()
  "my fsharp mode hook"
  (evil-surround-mode t)
  (smartparens-mode t)
  (define-key fsharp-mode-map (kbd "C-;") 'fsharp-ac/complete-at-point))

(add-hook 'fsharp-mode-hook 'deh-fsharp-mode-hook)

(provide 'deh-fsharp)
