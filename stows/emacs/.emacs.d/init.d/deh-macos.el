;; os-x specific settings
(when (memq window-system '(mac ns))
  (setq ns-function-modifier 'hyper)
  (setq mac-function-modifier 'hyper)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'super)
  ;; (exec-path-from-shell-initialize)

  ;; Fnacy titlebar for MacOS
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  (setq ns-use-proxy-icon nil)
  (setq frame-title-format nil)
  )

(provide 'deh-macos)
