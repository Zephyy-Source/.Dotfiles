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
   '(lsp-jedi ivy-hydra lsp-ivy lsp-ui lsp-java lsp-python-ms flycheck projectile lsp-mode latex-preview-pane org-bullets org-superstar doom-themes doom-modeline comment-tags minions ivy-rich treemacs-magit treemacs-all-the-icons use-package which-key yasnippet dap-pyhon dap-cpptools lsp counsel-tramp sublimity ## all-the-icons-dired all-the-icons tramp company magit)))

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

;; Русификация календаря
(setq calendar-week-start-day 1
	  calendar-day-name-array ["Воскресенье" "Понедельник" "Вторник" "Среда"
							   "Четверг" "Пятница" "Суббота"]
	  calendar-day-header-array ["Вс" "Пн" "Вт" "Ср" "Чт" "Пт" "Сб"]
	  calendar-day-abbrev-array ["Вск" "Пнд" "Втр" "Сре" "Чтв" "Птн" "Суб"]
	  calendar-month-name-array ["Январь" "Февраль" "Март" "Апрель" "Май"
								 "Июнь" "Июль" "Август" "Сентябрь"
								 "Октябрь" "Ноябрь" "Декабрь"]
	  calendar-month-abbrev-array ["Янв" "Фев" "Мар" "Апр" "Май" "Июн" "Июл" "Авг" "Сен" "Окт" "Ноя" "Дек"])

;; Загрузка файла в орг моде
;;(org-babel-load-file (file-truename "~/.emacs.d/set.org"))

(add-to-list 'load-path (file-truename "~/.emacs.d/elisp"))
(require 'local-ui)
(require 'local-packages)
(require 'local-lsp)

;;; Горячие клавиши
;; Менять окна местами
(global-set-key (kbd "C-x O") 'window-swap-states)
(provide 'init)

;;; init.el ends here
