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
 '(package-selected-packages
   '(diff-hl spaceline counsel-tramp counsel-test lsp-ivy counsel-projectile zzz-to-char ivy ## projectile all-the-icons-dired all-the-icons cherry-blossom-theme lsp-java tramp lsp-python-ms company-lsp lsp-ui lsp-mode outshine flycheck-pyflakes elpy ediprolog company-shell company company-irony-c-headers flycheck-irony irony magit afternoon-theme iedit flycheck neotree)))

;;Расширение репозитория

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Автоскачивание плагинов
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(setq vc-follow-symlinks t)

;; Загрузка файла в орг моде
 (org-babel-load-file (file-truename "~/.emacs.d/set.org"))


(provide '.emacs)

;;; .emacs ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
