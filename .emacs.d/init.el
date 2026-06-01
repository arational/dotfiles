;;; init.el
;;; Commentary:

;; Custom Emacs configuraiton. This is the base configuration of a
;; terminal emacs designed to work on Clojure projects. Further
;; customizations are deligated to the Emacs customizer. See
;; custom-file to see where the settings are stored.

(setq custom-file "~/.config/emacs-custom.el")
(load custom-file)

;;; package archives

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; NOTE: required by term-keys
(add-to-list 'package-archives
             '("cselpa" . "https://elpa.thecybershadow.net/packages/"))

;;; custom keybindings

;; Map Prefix-Argument to M-u
(keymap-global-set "M-u" 'universal-argument)
(define-key universal-argument-map (kbd "M-u") 'universal-argument-more)
(keymap-global-set "C--" 'undo)
(keymap-global-set "C-c c" 'git-link)

;; esc always quits
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(keymap-global-set "<escape>" 'keyboard-quit)

;; Wrap in square brackets
;;
;; NOTE: Currently disabled, because emacs is used in the terminal and the
;; terminal emulator is sending keys based on mouse focus.  (global-set-key (kbd
;; "M-[") 'paredit-wrap-square)

;; Reduce whitespaces to one or none
(keymap-global-set "M-SPC" 'cycle-spacing)

;; keep cursor at same position when scrolling and add keywbindings to
;; scroll the screen when moving the cursor
(setq scroll-preserve-screen-position 1)
(keymap-global-set "M-n" "C-u 1 C-v")
(keymap-global-set "M-p" "C-u 1 M-v")

;; Always delete trailing whitespaces before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; swiper

(require 'swiper)
(require 'counsel)

(keymap-global-set "C-s" 'swiper)
(keymap-global-set "C-<tab>" 'swiper-thing-at-point)
(keymap-global-set "M-x" 'counsel-M-x)
(keymap-global-set "C-x C-f" 'counsel-find-file)
(keymap-global-set "<f1> f" 'counsel-describe-function)
(keymap-global-set "<f1> v" 'counsel-describe-variable)
(keymap-global-set "<f1> l" 'counsel-find-library)
(keymap-global-set "<f2> i" 'counsel-info-lookup-symbol)
(keymap-global-set "<f2> u" 'counsel-unicode-char)
(keymap-global-set "C-c g" 'counsel-git) ; will override the keybinding for `magit-file-dispatch'
(keymap-global-set "C-c j" 'counsel-git-grep)
(keymap-global-set "C-c a" 'counsel-ag)
(keymap-global-set "C-x l" 'counsel-locate)
(keymap-global-set "M-y" 'counsel-yank-pop)
(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)

;;; smartparent

(require 'smartparens)
(require 'smartparens-config)

(defun liquid-sp-wrap-with (s)
  "Create a wrapper function for smartparens using S."
  `(lambda (&optional arg)
     (interactive "P")
     (sp-wrap-with-pair ,s)))

;; Toggle smartparens strict mode for buffer
(keymap-global-set "C-x M-s" 'smartparens-strict-mode)

(require 'smartparens-clojure)

(add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(add-hook 'cider-repl-mode-hook #'smartparens-strict-mode)
(define-key prog-mode-map (kbd "M-(") (liquid-sp-wrap-with "("))
;; TODO: pick terminal friendly binding
;;(define-key prog-mode-map (kbd "M-[") (liquid-sp-wrap-with "["))
(define-key prog-mode-map (kbd "M-\"") (liquid-sp-wrap-with "\""))

;;; direnv

(require 'direnv)

(keymap-global-set "C-x M-d" 'direnv-mode)

;;; ace-window

(require 'ace-window)

(keymap-global-set "C-x o" 'ace-window)

;;; magit

(require 'magit)

(defun my-git-commit-setup ()
  "Add the ticket number into the commit message."
  (let ((root (magit-git-dir))
        (branch (magit-get-current-branch)))
    (when (string-match "src/bevuta" root)
      (let ((re "\\([[:digit:]]\\{3,\\}\\)-?")
            (format-string "[T-%s] \n"))
        (when (and branch (string-match re branch))
          (let ((prefix (format format-string (match-string 1 branch))))
            (goto-char (point-min))
            (when (eolp)
              (insert prefix)
              (forward-char -1))))))))

(add-hook 'git-commit-mode-hook 'my-git-commit-setup)

(keymap-global-set "C-c m b" 'magit-blame)
(keymap-global-set "C-c m c" 'magit-show-commit)

;;; projectile

(require 'projectile)
(require 'counsel-projectile)

(counsel-projectile-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;;; cider

(require 'cider)

(add-hook 'cider-repl-mode-hook 'cider-repl-toggle-pretty-printing)

;;; LSP

;; Inspired by https://andreyor.st/posts/2023-09-09-migrating-from-lsp-mode-to-eglot/

(use-package lsp-mode
  :ensure t
  :hook ((lsp-mode . lsp-diagnostics-mode)
         (lsp-mode . lsp-completion-mode-maybe)
	 (lsp-mode . lsp-lens-mode))
  :preface
  (defun lsp-completion-mode-maybe ()
    (unless (bound-and-true-p cider-mode)
      (lsp-completion-mode 1)))
  :init
  (setq lsp-use-plists t))

(use-package lsp-clojure
  :demand t
  :after lsp-mode
  :hook (cider-mode . cider-toggle-lsp-completion-maybe)
  :preface
  (defun cider-toggle-lsp-completion-maybe ()
    (lsp-completion-mode (if (bound-and-true-p cider-mode) -1 1))))

(use-package lsp-clojure
  :no-require
  :hook ((clojure-mode
          clojurec-mode
          clojurescript-mode)
         . lsp))

(use-package eglot
  :ensure t
  :hook ((( clojure-mode clojurec-mode clojurescript-mode
            java-mode scala-mode)
          . eglot-ensure)
         ((cider-mode eglot-managed-mode) . eglot-disable-in-cider))
  :preface
  (defun eglot-disable-in-cider ()
    (when (eglot-managed-p)
      (if (bound-and-true-p cider-mode)
          (progn
            (remove-hook 'completion-at-point-functions 'eglot-completion-at-point t)
            (remove-hook 'xref-backend-functions 'eglot-xref-backend t))
        (add-hook 'completion-at-point-functions 'eglot-completion-at-point nil t)
        (add-hook 'xref-backend-functions 'eglot-xref-backend nil t))))
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  (eglot-extend-to-xref nil)
  (eglot-ignored-server-capabilities
   '(:hoverProvider
     :documentHighlightProvider
     :documentFormattingProvider
     :documentRangeFormattingProvider
     :documentOnTypeFormattingProvider
     :colorProvider
     :foldingRangeProvider)))

;;; easy-kill

(require 'easy-kill)

(keymap-global-set "<remap> <kill-ring-save>" #'easy-kill)
(keymap-global-set "<remap> <mark-sexp>" #'easy-mark)

;;; imenu

(add-hook 'clojure-mode-hook 'imenu-add-menubar-index)
(add-hook 'emacs-lisp-mode-hook 'imenu-add-menubar-index)

;;; windmove

(require 'windmove)

(keymap-global-set "C-S-h" 'windmove-left)
(keymap-global-set "C-S-l" 'windmove-right)
(keymap-global-set "C-S-k" 'windmove-up)
(keymap-global-set "C-S-j" 'windmove-down)

;;; undo-tree

(require 'undo-tree)

;; autosave the undo-tree history
(setq undo-tree-history-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq undo-tree-auto-save-history t)

;;; org-mode

(require 'org)

(use-package org
  :bind (:map org-mode-map
              ("C-M-n" . org-clock-timestamps-up)
              ("C-M-p" . org-clock-timestamps-down)))

;;; dired

(require 'gnus-dired)
(require 'dired-rsync)

(define-key dired-mode-map "Y" 'dired-rsync)

(defun dired-open-file ()
  "In dired, open the file named on this line."
  (interactive)
  (let* ((file (dired-get-filename nil t)))
    (message "Opening %s..." file)
    (call-process "xdg-open" nil 0 nil file)))

(define-key dired-mode-map "!" 'dired-open-file)

;;; helper functions

;; Bash terminal
(defun bash-term ()
  "Run \"ansi-term\" with bash as program."
  (interactive)
  (ansi-term "bash"))
(keymap-global-set "C-x M-m" 'bash-term)

(defun insert-uuid ()
  "Generate a UUID via `uuidgen` and insert it into the current buffer."
  (interactive)
  (call-process "uuidgen" nil t)
  (delete-backward-char 1))

;;; init.el ends here
(put 'dired-find-alternate-file 'disabled nil)
