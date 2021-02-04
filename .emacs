;;; .emacs --- init file
;; Custom-settings:
;;; Commentary:
;; Файл инициализации
;; В данном файле содержаться настройки из графического режима
;; а так же инициализируется package
;; остальные настройки хранятся в .emacs.d/set.org

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(neo-smart-open t)
 '(package-selected-packages
   '(## projectile all-the-icons-dired all-the-icons cherry-blossom-theme lsp-java tramp lsp-python-ms company-lsp lsp-ui lsp-mode outshine flycheck-pyflakes elpy ediprolog company-shell company company-irony company-irony-c-headers flycheck-irony irony magit afternoon-theme iedit flycheck neotree)))

;;Расширение репозитория




(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Автоскачивание аддонов
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

;; Загрузка файла в орг моде
(org-babel-load-file (expand-file-name "~/.emacs.d/set.org"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide '.emacs)

;;; .emacs ends here
