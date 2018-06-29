(require 'omnisharp)
(require 'omnisharp-helm-integration)
(require 'company)
(require 'flycheck)
(require 'eldoc)
(require 'smartparens)
(require 'counsel)
(require 'editorconfig)
(require 'evil)
(require 'f)
(require 'yasnippet)

(evil-set-initial-state 'csharp-mode 'normal)

(setq omnisharp-imenu-support t)


(defun deh-csharp-hook ()
  "my csharp hook"
  (omnisharp-mode)
  (company-mode)
  (flycheck-mode)
  (eldoc-mode)
  (smartparens-mode)
  (editorconfig-mode t)
  (set (make-local-variable 'company-backends) '((company-omnisharp company-yasnippet)))
  (setq eldoc-documentation-function #'omnisharp-eldoc-function)

  (c-set-style "bsd")
  (setq c-syntactic-indentation t)
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)
  (setq indent-tabs-mode nil)

  (evil-leader-mode t)
  (evil-surround-mode t)
  
  (local-set-key (kbd "C-c r r") 'omnisharp-run-code-action-refactoring)
  (local-set-key (kbd "C-c C-c") 'recompile))

(add-hook 'csharp-mode-hook 'deh-csharp-hook)

(evil-leader/set-key-for-mode 'csharp-mode
  ;; "k" 'counsel-etags-grep
  "k" 'omnisharp-helm-find-symbols
  )

(define-key csharp-mode-map (kbd "C-M-r") 'omnisharp-run-code-action-refactoring)
(define-key csharp-mode-map (kbd "C-M-f C-M-i") 'omnisharp-find-implementations)
(define-key csharp-mode-map (kbd "C-M-f C-M-u") 'omnisharp-helm-find-usages)
(define-key csharp-mode-map (kbd "C-M-f C-M-k") (lambda ()
						  (interactive)
						  (counsel-etags-grep "class " "class ")))
(define-key csharp-mode-map (kbd "C-M-g C-M-d") 'omnisharp-go-to-definition)
(define-key csharp-mode-map (kbd "C-]") 'omnisharp-go-to-definition)

(defun deh-csharp-run-aspnet (f)
  (interactive "f")
  (let ((default-directory (projectile-project-root)))
    (compile (concat "dotnet run --project " f) nil)))

;; jumps
(evil-add-command-properties 'omnisharp-go-to-definition :jump: t)

;; TODO: figure out how to put this on a specific projectile type
(defun deh-csharp-create-migration (directory name)
  "create a fluent-migrator migration file"
  (interactive "DMigrations directory: \nsMigration name: ")
  (let* ((time (format-time-string "%Y%m%d%H%M%S"))
	 (filename (concat time "_" name ".cs")))
    (find-file (f-join directory filename))
    (insert (s-lex-format "using FluentMigrator;

namespace fix
{
	[Migration(${time})]
	public class ${name} : Migration
	{
		public override void Up()
		{
		
		}

		public override void Down()
		{
		
		}
	}
}"))))


(provide 'deh-csharp)
