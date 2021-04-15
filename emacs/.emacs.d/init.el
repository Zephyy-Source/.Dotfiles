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
 '(auth-source-save-behavior nil)
 '(package-selected-packages
   '(helm-projectile lsp-ivy helm-lsp lsp-helm projectile lsp-ui lsp-java lsp-python-ms lsp-mode restart-emacs helm-descbinds helm-swoop helm-tramp helm markdown dashboard markdown-mode try auctex flycheck latex-preview-pane org-bullets org-superstar doom-themes doom-modeline comment-tags minions treemacs-magit treemacs-all-the-icons use-package which-key yasnippet dap-pyhon dap-cpptools lsp sublimity ## all-the-icons-dired all-the-icons tramp company magit)))

(setq gc-cons-threshold (* 50 1000 1000))

;;Расширение репозитория

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Автоскачивание пакетов
(unless (package-installed-p 'use-package)
							 (package-refresh-contents)
							 (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;;; Важные настройки
;; Переходить по ссылкам.
(setq vc-follow-symlinks t)
;; Выключение бекапов.
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)

;; Общий буфер обмена с системой.
(setq x-select-enable-clipboard t)

(add-to-list 'load-path (file-truename "~/.emacs.d/elisp"))
(use-package local-ui
  :ensure nil)
(use-package local-packages
  :ensure nil)
(use-package local-lsp
  :ensure nil)

(setq gc-cons-threshold (* 50 1000 1000))

(setq gc-cons-threshold (* 2 1000 1000))
;;; Горячие клавиши
;; Менять окна местами
(provide 'init)

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
