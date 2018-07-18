(require 'restclient)
(require 'evil)

(evil-set-initial-state 'restclient-mode 'normal)

(defun deh-restclient-mode-hook ()
  "my restclient mode hook"
  (evil-surround-mode))

(add-hook 'restclient-mode-hook 'deh-restclient-mode-hook)

(add-to-list 'auto-mode-alist '("\\.http$" . restclient-mode))

(provide 'deh-restclient)
