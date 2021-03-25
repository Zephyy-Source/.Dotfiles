;;; local-lsp.el --- 12

;;; Commentary:
;; Настройки lsp-mode и пакетов которые нужны для сборки с учетом lsp

;;; Code:

(use-package lsp-mode
  :defer t
  :hook (c-mode . lsp)
  (c++-mode . lsp)
  (python-mode . lsp)
  (java-mode . lsp)
  (lsp-mode . lsp-enable-which-key-integration)
  :custom (lsp-keymap-prefix "C-c l")
  (lsp-idle-delay 0.500)
  :config
  ;; Servers
  (use-package lsp-python-ms
    :custom (lsp-python-ms-auto-install-server))

  (use-package lsp-java)

  (use-package lsp-jedi)

  ;; Other
  (use-package lsp-ui
    :after lsp-mode
    :config (lsp-ui-mode t)
    :bind (:map lsp-ui-mode-map (
                                 ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
                                 ([remap xref-find-references] . lsp-ui-peek-find-references)))
    :custom (lsp-ui-doc-delay 3)
    (lsp-ui-doc-position 'at-point))
  (use-package lsp-treemacs
    :ensure nil
    :after lsp-mode
    :commands lsp-treemacs-errors-list
    :config (lsp-treemacs-sync-mode 1))

  (use-package lsp-ivy
    :after lsp-mode
    :commands lsp-ivy-workspace-symbol))

(use-package dap-mode
  :after lsp-mode
  :commands dap-debug
  :config
  (use-package dap-gdb-lldb :ensure nil
    :config '(dap-gdb-lldb-setup))
  (use-package dap-python :ensure nil))

(use-package projectile
  :defer t
  :config (projectile-mode +1)
  :bind-keymap ("C-c p" . projectile-command-map))

(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(provide 'local-lsp)

;;; local-lsp.el ends here
