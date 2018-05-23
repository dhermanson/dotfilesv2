;; org
(require 'org)
(require 'org-bullets)
(require 'ob-ruby)
;; (require 'ob-sh)
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
   ;; (sh . t)
   (js . t)
   (sql . t)
   (dot . t)
   (haskell . t)))

(setq org-startup-indented t)
(setq org-src-fontify-natively t)

;; org-plantuml
(setq plantuml-jar-path "~/bin/plantuml.jar")
(setq org-plantuml-jar-path "~/bin/plantuml.jar")

;; org-latex
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


(defun deh-org-mode-hook ()
  "my org mode hook"
  (org-bullets-mode t)
  (visual-line-mode t))

(add-hook 'org-mode-hook #'deh-org-mode-hook)

(provide 'deh-org)
