(require 'eclim)
(require 'eclimd)

(custom-set-variables
 '(eclim-eclipse-dirs (list "~/eclipse/java-oxygen/Eclipse.app/Contents/Eclipse")))

;; (setq eclim-executable (concat (car eclim-eclipse-dirs) "/eclim"))
(setq eclim-executable "~/.p2/pool/plugins/org.eclim_2.7.2/bin/eclim")
(setq eclimd-executable (concat (car eclim-eclipse-dirs) "/eclimd"))
(setq eclimd-autostart nil)
;; (setq eclim-executable "eclimd")

(provide 'deh-eclim)
