(require 's)
(require 'evil)

(defvar-local deh-repl-enabled "is a repl enabled in this buffer")
(defvar-local deh-repl-insert-style 'a "the style of insert")
(defvar-local deh-repl-process-name "the name of the repl")
(defvar-local deh-repl-buffer-name "the name of the repl buffer")
(defvar-local deh-repl-program "the repl program to run")
(defvar-local deh-repl-program-args "the args of the repl program to run")

(defun deh-create-repl (&optional switch)
  "create a repl"
  (interactive)
  (let* ((current-window (selected-window))
         (repl-buffer (get-buffer-create deh-repl-buffer-name))
         (args (-concat(list deh-repl-process-name
                              repl-buffer
                              deh-repl-program
                              nil)
                        deh-repl-program-args)))
    (apply 'make-comint-in-buffer args)
    (if switch
        (progn
          (switch-to-buffer-other-window repl-buffer)
          (select-window current-window)))))

(defun deh-send-current-line-to-repl ()
  "send the current line to the repl"
  (interactive)
  (let* ((line (s-trim-right (thing-at-point 'line t))))
    (if (equal deh-repl-insert-style 'a)
        (progn
          (comint-send-string (deh-repl-process) line)
          (comint-send-string (deh-repl-process) "\n"))
      (with-current-buffer (deh-repl-buffer)
        (insert line)
        (comint-send-input)))))

(defun deh-send-region-to-repl (start end)
  (interactive "r")
  (let ((contents (s-trim (buffer-substring-no-properties start end))))
    (if (equal deh-repl-insert-style 'a)
        (progn
          (comint-send-string (deh-repl-process) contents)
          (comint-send-string (deh-repl-process) "\n"))
      (with-current-buffer (deh-repl-buffer)
        (insert contents)
        (comint-send-input))
      )

    )
  (evil-exit-visual-state))

(defun deh-restart-repl ()
  (interactive)
  (let* ((buffer (deh-repl-buffer))
         (process (deh-repl-process))
         (switch-on-create (null buffer)))
    
    (if process
        (progn
          (kill-process process)
          (sleep-for 0.5)))

    (if buffer
        (with-current-buffer buffer
          (erase-buffer)
          (goto-char (point-max))))
    
    (deh-create-repl switch-on-create)))

(defun deh-kill-repl ()
  (interactive)
  (let* ((buffer (deh-repl-buffer))
         (process (deh-repl-process)))
    (if process
        (progn
          (kill-process process)
          (sleep-for 0.5)))

    ;; (if buffer
    ;;     (progn
    ;;       (delete-window (get-buffer-window buffer))
    ;;       (kill-buffer buffer)))
    ))

(defun deh-focus-repl-in-other-window ()
  (interactive)
  (let ((current-window (selected-window)))
    
    (switch-to-buffer-other-window (deh-repl-buffer))
    (select-window current-window)))

(defun deh-repl-buffer ()
  (get-buffer deh-repl-buffer-name))

(defun deh-repl-process ()
  (get-buffer-process deh-repl-buffer-name))

;; advice
(defun deh-ensure-repl-enabled (orig-fun &rest args)
  "ensure that the repl is enabled in this buffer"
  (if (and deh-repl-enabled
           deh-repl-process-name
           deh-repl-buffer-name
           deh-repl-program)
      (apply orig-fun args)
    (print "repl not enabled in buffer")))

(defun deh-ensure-repl-started (orig-fun &rest args)
  "ensure that the repl is started"
  (let* ((buffer-exists (deh-repl-buffer))
         (process-exists-in-buffer (deh-repl-process)))
    (if buffer-exists
        (unless process-exists-in-buffer
          (deh-create-repl))
      (deh-create-repl t)))
  (apply orig-fun args))

;; before sending a line, make sure the repl has been started
(advice-add 'deh-send-current-line-to-repl :around 'deh-ensure-repl-started)
(advice-add 'deh-send-region-to-repl :around 'deh-ensure-repl-started)

;; before ensuring the repl has been started, make sure the repl is enabled
(advice-add 'deh-ensure-repl-started :around 'deh-ensure-repl-enabled)

;; ensure repl started before switching focus in other window
(advice-add 'deh-focus-repl-in-other-window :around 'deh-ensure-repl-started)

(provide 'deh-repl)
