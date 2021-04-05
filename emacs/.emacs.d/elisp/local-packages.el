;;; local-packages.el --- 27

;;; Commentary:
;; Пакеты, которые являются основой сборки.

;;; Code:

(use-package ivy
  :config (ivy-mode t))

(use-package swiper
  :after ivy
  :init (unbind-key "C-s")
  (unbind-key "C-c C-r")
  :bind ("C-s" . swiper)
  ("C-c C-r" . ivy-resume))

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

(use-package counsel-tramp
  :after tramp)

(use-package ivy-rich
  :after ivy
  :config (ivy-rich-mode 1)
  (ivy-rich-project-root-cache-mode t))

(use-package ivy-hydra)

(use-package bookmark
  :ensure nil
  :init (when (file-exists-p (concat user-emacs-directory "bookmarks"))
		  (bookmark-load bookmark-default-file t))
  :custom (bookmark-save-flag t)
  (bookmark-default-file (concat user-emacs-directory "bookmarks")))

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

(use-package org-superstar
  :defer t
  :hook (org-mode . org-superstar-mode))

(use-package all-the-icons)

(use-package treemacs-all-the-icons
  :config (treemacs-load-theme "all-the-icons"))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

(use-package ispell
  :ensure nil
  :config (ispell-set-spellchecker-params)
  (ispell-hunspell-add-multi-dic "en_US,ru_RU")
  
  :custom (ispell-program-name "hunspell")
  (ispell-dictionary "en_US,ru_RU")
  (ispell-personal-dictionary "~/.hunspell_personal"))

(use-package yasnippet
  :defer t
  :config (yas-reload-all)
  :hook (prog-mode . yas-minor-mode)
  (org-mode . yas-minor-mode)
  (latex-mode . yas-minor-mode))

(use-package dired
  :ensure nil
  :custom  (dired-listing-switches "-agho --group-directories-first"))

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-minor-modes t)
  (doom-modeline-icon t))

(use-package minions
  :config (minions-mode t))

(use-package treemacs
  :defer t
  :bind ("C-c t"   . treemacs)
  :config (treemacs-git-mode 'deferred))

(use-package comment-tags
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

(use-package magit
  :defer t
  :commands magit-status)

(use-package try
  :commands try)

(use-package company
  :defer t
  :init (global-company-mode)
  :custom (company-ide-delay 0)
  (company-minimum-prefix-length 1)
  (company-selection-wrap-around t))

(use-package which-key
  :config (which-key-mode)
  :custom (which-key-idle-delay 1))

(use-package tramp
  :ensure nil
  :defer t
  :init (setq tramp-default-method "ssh"))

(use-package auctex
  :defer t
  :custom (TeX-parse-self t)
(TeX-auto-save t)
(TeX-save-query nil))

(use-package latex-preview-pane)

(provide 'local-packages)

;;; local-packages.el ends here
