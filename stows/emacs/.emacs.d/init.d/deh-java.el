(require 'flycheck)
(require 'smartparens)
(require 'eclim)
(require 'eclimd)

(defun deh-java-mode-hook ()
  "my java mode hook"
  (setq indent-tabs-mode nil
	tab-width 2
	c-basic-offset 2)
  
  (flycheck-mode t)
  (smartparens-mode t)
  (eclim-mode t)
  (company-mode t)
  (set (make-local-variable 'company-backends) '((company-eclim)))
  )

(add-hook 'java-mode-hook 'deh-java-mode-hook)

(provide 'deh-java)
