(require 'org)

(define-key global-map (kbd "C-c o c") 'org-capture)
(define-key global-map (kbd "C-c o a") 'org-agenda)
(define-key global-map (kbd "C-c o d") (lambda () (interactive) (find-file org-directory)))

(define-key global-map (kbd "C-c g s f") 'magit-stage-file)
(define-key global-map (kbd "C-c g g") 'magit-status)

(provide 'deh-global-maps)
