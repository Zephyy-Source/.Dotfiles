;;;; Custom-settings:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(company-idle-delay 0.2)
 '(company-tooltip-idle-delay 0.2)
 '(ediprolog-program "/usr/bin/swipl")
 '(ediprolog-system 'swi)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(neo-smart-open t)
 '(neo-theme 'nerd)
 '(package-selected-packages
   '(lsp-java tramp lsp-python-ms company-lsp lsp-ui lsp-mode outshine flycheck-pyflakes elpy ediprolog company-shell company company-irony company-irony-c-headers flycheck-irony irony magit afternoon-theme iedit flycheck neotree sr-speedbar))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

;;Расширение репозитория
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Загрузка файла в орг моде
(org-babel-load-file (expand-file-name "~/.emacs.d/set.org"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
