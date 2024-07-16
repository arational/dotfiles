(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(deeper-blue))
 '(delete-selection-mode t)
 '(dired-du-size-format t)
 '(dired-listing-switches "-alFh")
 '(direnv-always-show-summary nil)
 '(direnv-mode t)
 '(global-auto-revert-mode t)
 '(global-hl-todo-mode t)
 '(global-undo-tree-mode t)
 '(lsp-auto-configure nil)
 '(lsp-completion-enable-additional-text-edit nil)
 '(lsp-completion-provider :none)
 '(lsp-completion-show-kind nil)
 '(lsp-eldoc-enable-hover nil)
 '(lsp-enable-dap-auto-configure nil)
 '(lsp-enable-folding nil)
 '(lsp-enable-indentation nil)
 '(lsp-enable-on-type-formatting nil)
 '(lsp-enable-snippet nil)
 '(lsp-enable-suggest-server-download nil)
 '(lsp-headerline-breadcrumb-enable nil)
 '(lsp-headerline-breadcrumb-enable-diagnostics nil)
 '(lsp-headerline-breadcrumb-icons-enable nil)
 '(lsp-keep-workspace-alive nil)
 '(lsp-keymap-prefix "C-c M-l")
 '(lsp-modeline-code-actions-enable nil)
 '(lsp-modeline-diagnostics-enable nil)
 '(lsp-modeline-workspace-status-enable nil)
 '(lsp-signature-doc-lines 10)
 '(magit-repository-directories '(("~/src/bevuta" . 2) ("~/src" . 1)))
 '(package-selected-packages
   '(hl-todo easy-kill flycheck-clj-kondo xref-union dired-du undo-tree ace-window term-keys xclip company direnv lsp-mode cider counsel-projectile projectile smartparens swiper ivy ag magit))
 '(require-final-newline t)
 '(safe-local-variable-values
   '((eval setq-local cider-clojure-cli-aliases
	   (let
	       ((default-directory
		 (clojure-project-dir)))
	     (shell-command-to-string "bb aliases:dev :module/build 2>/dev/null")))
     (eval define-clojure-indent
	   (defobject
	    '(2 :form :form
		(1))))
     (grep-find-ignored-directories ".shadow-cljs" ".cpcache" ".clj-kondo")
     (grep-find-ignored-directories ".shadow-cljs")
     (eval setq-local cider-clojure-cli-aliases
	   (let
	       ((default-directory
		 (clojure-project-dir)))
	     (shell-command-to-string "bb aliases:dev :module/server.main 2>/dev/null")))
     (cljr-insert-newline-after-require)
     (cljr-favor-prefix-notation)
     (cider-clojure-cli-aliases "NOTE: you need to run cider-jack-in from a file of one of the subprojects. See README.md for details.")
     (grep-find-ignored-directories "dev-server/postgres" ".clj-kondo" ".cpcache")))
 '(sp-base-key-bindings 'paredit)
 '(swiper-action-recenter t)
 '(swiper-goto-start-of-match t)
 '(term-keys-mode t nil (term-keys))
 '(xclip-mode t)
 '(xterm-mouse-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#181a26" :foreground "gray80" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "PfEd" :family "DejaVu Sans Mono")))))
