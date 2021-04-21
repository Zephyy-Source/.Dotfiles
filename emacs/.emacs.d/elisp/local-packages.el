;;; local-packages.el --- Summary;

;;; Commentary:
;; Пакеты, которые являются основой сборки.

;;; Code:

(use-package helm
  :init (helm-mode t)
  :bind ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("<f12>" . helm-bookmarks)
  ("C-x b" . helm-buffers-list)
  ("C-x C-b" . helm-mini))

(use-package helm-swoop
  :after helm
  :bind ("C-s" . helm-swoop))

(use-package helm-descbinds
  :after helm
  :bind ("C-h b" . helm-descbinds))

(use-package helm-tramp
  :defer 2)

;; Управление окнами
(use-package ace-window
  :defer 1
  :init (global-unset-key (kbd "M-o"))
  :config (ace-window-display-mode)
  :bind ("M-o" . ace-window))

;; Настройки для встроенных закладок
(use-package bookmark
  :defer 1
  :ensure nil
  :init (when (file-exists-p (concat user-emacs-directory "bookmarks"))
		  (bookmark-load bookmark-default-file t))
  :custom (bookmark-save-flag t)
  (bookmark-default-file (concat user-emacs-directory "bookmarks")))

;; Кастомизация org-mode
(use-package org
  :defer 2
  :ensure nil
  :bind ("C-c a" . org-agenda)
  ("C-c c" . org-capture)
  :config (unless (file-directory-p "~/.emacs.d/todo") (make-directory "~/.emacs.d/todo"))
  (setq org-agenda-files (directory-files-recursively "~/.emacs.d/todo/" "org$"))
  (unless (file-exists-p "~/.emacs.d/notes.org") (make-empty-file "~/.emacs.d/notes.org"))
  (setq org-default-notes-file "~/.emacs.d/notes.org")

  :custom (org-src-fontify-natively t)
  (org-startup-folded t)
  (org-log-done t)
  (org-format-latex-options
   '(:foreground default :background default :scale 1.4
			     :html-foreground "Black" :html-background "Transparent"
			     :html-scale 1.0 :matchers
			     ("begin" "$1" "$" "$$" "\\(" "\\["))))

;; Альтернативные символы для org-mode
(use-package org-superstar
  :defer 2
  :hook (org-mode . org-superstar-mode))

(use-package dashboard
  :config (dashboard-setup-startup-hook)
  (when (daemonp) (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))
  (setq dashboard-items '((projects . 5)
                          (bookmarks . 5)
                          (recents . 5)))
  
  (setq dashboard-set-navigator t)
  (if (display-graphic-p)
      (setq dashboard-navigator-buttons
            `(((,(all-the-icons-material "library_books" :height 1.1 :v-adjust 0.0)
                "Scratch" "Jump into scratch buffer"
                (lambda (&rest _) (switch-to-buffer "*scratch*"))))))
    (setq dashboard-navigator-buttons
          '((("*" "Scratch" "Jump into scratch buffer"
              (lambda (&rest _) (switch-to-buffer "*scratch*")))))))
  (unless (package-installed-p 'projectile) (setq dashboard-projects-backend 'project-el))
  :custom (dashboard-startup-banner 3))
  



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
  :defer 3
  :ensure nil
  :config (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,ru_RU")
  :custom (ispell-program-name "hunspell")
  (ispell-dictionary "en_US,ru_RU")
  (ispell-personal-dictionary "~/.hunspell_personal"))

;; Сниппеты
(use-package yasnippet
  :defer 4
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

(use-package restart-emacs
  :commands restart-emacs)

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

;; Terminal emulator
(use-package vterm)

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
