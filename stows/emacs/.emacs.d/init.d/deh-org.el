;; org
(require 'org)
(require 'org-bullets)
(require 'ob-ruby)
;; (require 'ob-sh)
(require 'ob-haskell)
(require 'ob-plantuml)
(require 'ox-latex)
(require 'ox-twbs)
(require 'ox-gfm)

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

;; org-capture
(setq org-directory "~/Dropbox/org")
(setq org-default-notes-file (concat org-directory "/capture.org"))

;; org-plantuml
(setq plantuml-jar-path "~/bin/plantuml.jar")
(setq org-plantuml-jar-path "~/bin/plantuml.jar")

;; org-latex
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))


(defun deh-org-add-file-to-org-agenda-files (file)
  "set a file as the agenda file"
  (interactive "f")
  (setq org-agenda-files (list file)))

(defun deh-org-add-current-file-to-org-agenda-files ()
  "set current file a file as the agenda file"
  (interactive)
  (deh-org-add-file-to-org-agenda-files (buffer-file-name)))

(defun deh-org-mode-hook ()
  "my org mode hook"
  (org-bullets-mode t)
  (visual-line-mode t)
  (setq display-line-numbers 'relative))

(add-hook 'org-mode-hook #'deh-org-mode-hook)

(define-key org-mode-map (kbd "C-c a f") 'deh-org-add-current-file-to-org-agenda-files)


(provide 'deh-org)
