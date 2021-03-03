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
   '(org-bullets org-superstar doom-themes doom-modeline comment-tags minions ivy-rich treemacs-magit treemacs-projectile treemacs-all-the-icons use-package which-key yasnippet dap-pyhon dap-cpptools lsp counsel-tramp sublimity lsp-ivy counsel-projectile ## all-the-icons-dired all-the-icons cherry-blossom-theme lsp-java tramp lsp-python-ms company-lsp lsp-ui lsp-mode company-shell company magit afternoon-theme flycheck)))

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
;; (setq use-package-verbose t) ;; Логирование запуска
;;(unless package-archive-contents
;;  (package-refresh-contents))
;; (package-install-selected-packages)

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
