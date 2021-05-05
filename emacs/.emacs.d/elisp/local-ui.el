;;; local-ui.el --- 1

;;; Commentary:
;; Настройки графического режима

;;; Code:

(defun local-graphic-init()
  "Задержка на включение различных графических штук."
  ;; Отключение лишнего, увеличение отсупа по бокам.
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (setq-default inhibit-startup-screen t)
  (set-fringe-mode 5)
  ;; Отступы
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  (electric-indent-mode 1)
  (setq-default backward-delete-char-untabify-method 'hungry)
  ;; Нумерация строк
  (column-number-mode t)
  (add-hook 'prog-mode-hook #'display-line-numbers-mode)
  ;; Скобочки
  (show-paren-mode 2)
  (electric-pair-mode 1)
  ;; Рамка
  (setq frame-title-format "GNU Emacs: %b"))


(add-hook 'after-init-hook 'local-graphic-init)

;; Тема и шрифт
(use-package doom-themes
  :init (load-theme 'doom-sourcerer t)
  :config (doom-themes-visual-bell-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(defun local-font-exists (font)
  "Check if FONT exists."
  (unless (eq font 'nil)
    (if (null (x-list-fonts font)) nil t)))


(defun local-set-font ()
  "Set the FONT if it is installed."
  (let ((font-list '("JetBrains Mono" "SourceCode Pro")))
  (while font-list
    (let ((ffont (pop font-list)))
      (when (local-font-exists ffont)
        (progn (set-face-attribute
                'default nil :font ffont :height 100)
               (setq font-list 'nil)))))))

(if (daemonp) (add-hook 'after-make-frame-functions
                        (lambda (frame) (with-selected-frame frame (local-set-font))))
  (when (display-graphic-p) (local-set-font)))

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
