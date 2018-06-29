(require 'web-mode)
(require 'company)
(require 'company-web-html)
(require 'company-css)
(require 'evil)
(require 'emmet-mode)

(evil-set-initial-state 'web-mode 'emacs)

(defun deh-web-mode-hook ()
  "my web mode hook"
  (company-mode t)
  (emmet-mode t)
  (emmet-preview-mode 0)
  n
  (set (make-local-variable 'company-backends) '((company-web-html
						  company-css))))

(add-hook 'web-mode-hook 'deh-web-mode-hook)

(provide 'deh-web)
