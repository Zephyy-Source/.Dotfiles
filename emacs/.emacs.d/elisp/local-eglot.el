;;; local-eglot.el --- 3

;;; Commentary:
;; Настройки для сборки с использованием eglot

;;; Code:

(use-package eglot
  :hook (c-mode . eglot-ensure)
  (c++-mode . eglot-ensure)
  (python-mode . eglot-ensure)
  (java-mode . eglot-ensure)
  (latex-mode . eglot-ensure)

  :config (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))

  (defconst my-jdtls-file "org.eclipse.equinox.launcher_")
  (defconst my-jdtls-dir (expand-file-name "~/.emacs.d/jdtls/plugins/"))

  (defun my-eclipse-jdt-contact (interactive)
    (let ((cp (getenv "CLASSPATH")))
      (setenv "CLASSPATH" (concat cp ":" (concat my-jdtls-dir
                                                 (file-name-completion my-jdtls-file my-jdtls-dir))))
      (unwind-protect
          (eglot--eclipse-jdt-contact nil)
        (setenv "CLASSPATH" cp))))

  (setcdr (assq 'java-mode eglot-server-programs) #'my-eclipse-jdt-contact)

  :bind (:map eglot-mode-map ("C-c e r" . eglot-rename)
              ("C-c e o" . eglot-code-action-organize-imports)
              ("C-c e f" . eglot-format-buffer) ("C-c e s r" . eglot-reconnect)
              ("C-c e s s" . eglot-shutdown)))

(use-package project
  :ensure nil
  :config (defun local/project-try-explicit (dir)
            (locate-dominating-file dir ".root"))

  (defmethod project-root ((project string))
    project)

  (add-hook 'project-find-functions
            #'local/project-try-explicit))

(use-package flymake
  :ensure nil
  :hook (prog-mode . flymake-mode)
  :custom (flymake-error-bitmap '(filled-rectangle compilation-error))
  (flymake-note-bitmap '(filled-rectangle compilation-info))
  (flymake-warning-bitmap '(filled-rectangle compilation-warning))
  :bind (:map flymake-mode-map ("C-c m n" . flymake-goto-next-error)
  ("C-c m p" . flymake-goto-prev-error)))

(provide 'local-eglot)

;;; local-eglot.el ends here
