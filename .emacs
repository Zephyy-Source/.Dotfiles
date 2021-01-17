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
   '(lsp-python-ms company-lsp lsp-ui lsp-mode outshine flycheck-pyflakes elpy ediprolog company-shell company company-irony company-irony-c-headers flycheck-irony irony magit afternoon-theme iedit flycheck neotree sr-speedbar))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
;; добавление расширенного репозитория дополнений

;;; Ui:
;;;; Скобочки:
;; Показывать пары
(show-paren-mode 2)
;; Дополнять скобочки
(electric-pair-mode 1)
(electric-indent-mode 1)

;;;; Рамка:
(setq frame-title-format "GNU Emacs: %b")

;;;; Отключение графических элементов:
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;;; Шрифт:
'(default ((t (:family "JetBrains Mono" :foundry "JB" :slant normal :weight normal :height 98 :width normal))))

;;;; Тема:
(load-theme 'afternoon t)

;;;; Отступы
;;(setq-default indent-tabs-mode nil) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width 4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset 4)
(setq-default standart-indent 4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent 4) ;; сдвигать Lisp-выражения на 4 пробельных символа
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
(setq lisp-indent-function  'common-lisp-indent-function)

;;; Plugins:
;;;; Packge:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;;; Linum:
;; Нумерация строк
(require 'linum)
(line-number-mode t)
(global-linum-mode t)
(column-number-mode t)
(setq linum-format " %d")

;;;; Ido:
;;Более удобная подсказка в ехо
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
;;;; Yasnippet
(require 'yasnippet)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
;;;; Bs:
;;Браузер буфферов на f2
(require 'bs)
(global-set-key (kbd "<f2>") 'bs-show)

;;;; lsp
(require 'lsp-mode)
;;;;; C-cpp
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
;;;;; Python
(require 'lsp-python-ms)
(setq lsp-python-ms-auto-install-server t)
(add-hook 'python-mode-hook #'lsp)
;;;; Flycheck:
; Проверка кода
(require 'flycheck)
;;(require 'flycheck-pos-tip)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(global-flycheck-mode)

;;;; Neotree
;; Боковой файловый браузер
(require 'neotree)
(global-set-key (kbd "<f1>") 'neotree-toggle)
'(neo-dir-link-face ((t nil)))

;;;; Company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;;;; Iedit:
;; Рефакторинг на C-;
(require 'iedit)

;;;; Bookmark:
;; Закладки
(require 'bookmark)
(global-set-key (kbd "<f12>") 'bookmark-bmenu-list)
(global-set-key (kbd "C-<f12>") 'bookmark-set)
(global-set-key (kbd "S-<f12>") 'bookmark-jump)

(setq bookmark-save-flag t)
(when (file-exists-p (concat user-emacs-directory "bookmarks"))
    (bookmark-load bookmark-default-file t))

(setq bookmark-default-file (concat user-emacs-directory "bookmarks"))

;;;; Ediprolog:
;; Запуск пролога по нажатию f9
(require 'ediprolog)
(global-set-key (kbd "<f9>") 'ediprolog-dwim)

;;;; Outshine
;; Представление комментариев в виде дерева
(require 'dash)
(require 'outshine)

(add-hook 'outline-minor-mode-hook 'outshine-mode)

(let ((kmap outline-minor-mode-map))
  (define-key kmap (kbd "M-RET") 'outshine-insert-heading)
  (define-key kmap (kbd "<backtab>") 'outshine-cycle-buffer)
  '(outline-hide-subtree)
  )

(add-hook 'emacs-lisp-mode-hook 'outshine-mode)


;;; Другие настройки:
;;;; Отключение бекапов:
;; Отключение бекапов
(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default nil)
;;Включение нумерации строк

;;;; Общий буфер обмена:
(setq x-select-enable-clipboard t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

