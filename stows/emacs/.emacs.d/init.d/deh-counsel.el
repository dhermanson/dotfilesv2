(require 'counsel)

;; (defun counsel-etags-grep-cli (keyword use-cache)
;;   "Use KEYWORD and USE-CACHE to build CLI.
;; Extended regex is used, like (pattern1|pattern2)."
;;   (cond
;;    ((counsel-etags-has-quick-grep)
;;     (format "%s %s \"%s\" --"
;;             (concat (executable-find "rg")
;;                     ;; (if counsel-etags-debug " --debug")
;;                     " -n -M 512 --no-heading --color never -s --path-separator /")
;;             (counsel-etags-exclude-opts use-cache)
;;             keyword))
;;    (t
;;     ;; use extended regex always
;;     (format "%s -rsnE %s \"%s\" *"
;;             (or counsel-etags-grep-program (counsel-etags-guess-program "grep"))
;;             (counsel-etags-exclude-opts use-cache)
;;             keyword))))

(define-key counsel-find-file-map (kbd "C-l") 'counsel-up-directory)

(provide 'deh-counsel)
