;;; local-packages.el --- 27

;;; Commentary:
;; Пакеты, которые являются основой сборки.

;;; Code:

;; Автодополнение для комманд
(use-package ivy
  :config (ivy-mode t))

;; Улучшенная версия isearch
(use-package swiper
  :after ivy
  :init (unbind-key "C-s")
  (unbind-key "C-c C-r")
  :bind ("C-s" . swiper)
  ("C-c C-r" . ivy-resume))

;; Улучшенные стандартные комманды
(use-package counsel
  :after ivy
  :bind ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> o" . counsel-describe-symbol)
  ("<f1> l" . counsel-find-library)
  ("<f1> b" . counsel-descbinds)
  ("<f2>" . counsel-org-capture)
  ("<f5>" . counsel-imenu)
  ("<f12>" . counsel-bookmark)
  (:map minibuffer-local-map ("C-r" . counsel-minibuffer-history)))

;; Улучшенние для tramp
(use-package counsel-tramp
  :after tramp)

;; Больше информации в ivy
(use-package ivy-rich
  :after ivy
  :config (ivy-rich-mode 1)
  (ivy-rich-project-root-cache-mode t))

;; Дополнительные возможности для ivy по нажатии C-o
(use-package ivy-hydra)

;; Управление окнами
(use-package ace-window
  :init (global-unset-key (kbd "M-o"))
  :bind ("M-o" . ace-window))

;; Настройки для встроенных закладок 
(use-package bookmark
  :ensure nil
  :init (when (file-exists-p (concat user-emacs-directory "bookmarks"))
		  (bookmark-load bookmark-default-file t))
  :custom (bookmark-save-flag t)
  (bookmark-default-file (concat user-emacs-directory "bookmarks")))

;; Кастомизация org-mode
(use-package org
  :ensure nil
  :bind ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  :custom (org-src-fontify-natively t)
  (org-startup-folded t)
  (org-agenda-files (directory-files-recursively "~/.todo/" "org$"))
  (org-default-notes-file "~/.todo/notes.org")

  (org-log-done t)
  (org-format-latex-options
   '(:foreground default :background default :scale 1.4
			     :html-foreground "Black" :html-background "Transparent"
			     :html-scale 1.0 :matchers
			     ("begin" "$1" "$" "$$" "\\(" "\\["))))

;; Альтернативные символы для org-mode
(use-package org-superstar
  :defer t
  :hook (org-mode . org-superstar-mode))

(use-package dashboard
  :config (dashboard-setup-startup-hook)
  (setq dashboard-items '((projects . 5)
                          (bookmarks . 5)
                          (recents  . 5)))

  (setq dashboard-set-navigator t)
  (if (display-graphic-p)
      (setq dashboard-navigator-buttons
            `(((,(all-the-icons-material "library_books" :height 1.1 :v-adjust 0.0)
                "Scratch" "Jump into scratch buffer"
                (lambda (&rest _) (switch-to-buffer "*scratch*"))))))
    (setq dashboard-navigator-buttons
          '((("*" "Scratch" "Jump into scratch buffer"
              (lambda (&rest _) (switch-to-buffer "*scratch*")))))))


  :custom (dashboard-startup-banner 3)
  (dashboard-projects-backend 'project-el)
  (initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

;; Набор иконок для различных буферов
(use-package all-the-icons)

;; Иконки для treemacs
(use-package treemacs-all-the-icons
  :config (treemacs-load-theme "all-the-icons"))

;; Иконки для dired
(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; Настройки для проверки грамматических ошибок
(use-package ispell
  :ensure nil
  :config (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,ru_RU")
  :custom (ispell-program-name "hunspell")
  (ispell-dictionary "en_US,ru_RU")
  (ispell-personal-dictionary "~/.hunspell_personal"))

;; Сниппеты
(use-package yasnippet
  :defer t
  :config (yas-reload-all)
  :hook (prog-mode . yas-minor-mode)
  (org-mode . yas-minor-mode)
  (latex-mode . yas-minor-mode))

;; Настройки для редактора директорий
(use-package dired
  :ensure nil
  :custom  (dired-listing-switches "-agho --group-directories-first"))

;; Настройки строки состояния
(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-minor-modes t)
  (doom-modeline-icon t))

;; Спрятать минорные моды
(use-package minions
  :config (minions-mode t))

;; Навигация по проектам
(use-package treemacs
  :defer t
  :bind ("C-c t"   . treemacs)
  :config (treemacs-git-mode 'deferred))

;; Подсветка TODO комментариев в коде
(use-package comment-tags
  :defer t
  :hook (prog-mode . comment-tags-mode)
  :custom (comment-tags-keymap-prefix (kbd "C-c #"))
  (comment-tags-keyword-faces
   `(("TODO" . ,(list :weight 'bold :foreground "#28ABE3"))
	 ("FIXME" . ,(list :weight 'bold :foreground "#DB3340"))
	 ("BUG" . ,(list :weight 'bold :foreground "#DB3340"))
	 ("HACK" . ,(list :weight 'bold :foreground "#E8B71A"))
	 ("KLUDGE" . ,(list :weight 'bold :foreground "#E8B71A"))
	 ("XXX" . ,(list :weight 'bold :foreground "#F7EAC8"))
	 ("INFO" . ,(list :weight 'bold :foreground "#F7EAC8"))
	 ("DONE" . ,(list :weight 'bold :foreground "#1FDA9A")))))

;; Управление гит команднами
(use-package magit
  :defer t
  :commands magit-status)

;; Проба пакета без его скачивания
(use-package try
  :commands try)

;; Автодополнение во время ввода
(use-package company
  :defer t
  :init (global-company-mode)
  :custom (company-ide-delay 0)
  (company-minimum-prefix-length 1)
  (company-selection-wrap-around t))

;; Подсказка горячих клавиш
(use-package which-key
  :config (which-key-mode)
  :custom (which-key-idle-delay 1))

;; Редактирование удалённых файлов
(use-package tramp
  :ensure nil
  :defer t
  :init (setq tramp-default-method "ssh"))

;; LaTeX улучшения
(use-package auctex
  :defer t
  :custom (TeX-parse-self t)
  (TeX-auto-save t)
  (TeX-save-query nil))

;; Предпросмотр LaTeX документов 
(use-package latex-preview-pane)

(provide 'local-packages)

;;; local-packages.el ends here
