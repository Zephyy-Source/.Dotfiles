;;; local-ui.el --- 1

;;; Commentary:
;; Настройки графического режима

;;; Code:

;; Скобочки
(show-paren-mode 2)
(electric-pair-mode 1)


;; Рамка
(setq frame-title-format "GNU Emacs: %b")

;; Тема и шрифт
(use-package doom-themes
  :init (load-theme 'doom-Iosvkem t)
  :config 
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(setq default-frame-alist '((font . "JetBrains Mono-10")))

;; Отключение лишнего, увеличение отсупа по бокам.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)
(set-fringe-mode 10)

;; Отступы
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(electric-indent-mode 1)
(setq-default backward-delete-char-untabify-method 'hungry)

;; Нумерация строк
(column-number-mode t)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Отключенные настройки
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

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


(provide 'local-ui)

;;; local-ui.el ends here
