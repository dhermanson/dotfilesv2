(require 'helm)
(require 'helm-imenu)

(defun deh-helm-imenu ()
  "Preconfigured `helm' for `imenu'."
  (interactive)
  (unless helm-source-imenu
    (setq helm-source-imenu
          (helm-make-source "Imenu" 'helm-imenu-source
            :fuzzy-match helm-imenu-fuzzy-match)))
  (let ((imenu-auto-rescan t)
	(str (thing-at-point 'symbol))
        (helm-execute-action-at-once-if-one
         helm-imenu-execute-action-at-once-if-one))
    (helm :sources 'helm-source-imenu
          :default (list (concat "\\_<" (and str (regexp-quote str)) "\\_>") str)
          :buffer "*helm imenu*")))

(provide 'deh-helm)
