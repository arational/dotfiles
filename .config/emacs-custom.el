(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-repl-display-in-current-window t)
 '(cundo-enable-cursor-tracking nil nil (cursor-undo))
 '(custom-enabled-themes '(deeper-blue))
 '(delete-selection-mode t)
 '(dired-du-size-format t)
 '(dired-dwim-target 'dired-dwim-target-next)
 '(dired-listing-switches "-alFh")
 '(dired-recursive-copies 'always)
 '(dired-recursive-deletes 'always)
 '(direnv-always-show-summary nil)
 '(direnv-mode t)
 '(fill-column 80)
 '(git-link-commit-remote-alist
   '(("dev.bevuta.com" git-link-commit-gitlab) ("git.sr.ht" git-link-commit-github)
     ("codeberg.org" git-link-commit-codeberg) ("github" git-link-commit-github)
     ("bitbucket" git-link-commit-bitbucket)
     ("gitorious" git-link-commit-gitorious) ("gitlab" git-link-commit-gitlab)
     ("git\\.\\(sv\\|savannah\\)\\.gnu\\.org" git-link-commit-savannah)
     ("googlesource.com" git-link-commit-googlesource)
     ("visualstudio\\|azure" git-link-commit-azure)
     ("sourcegraph" git-link-commit-sourcegraph)
     ("\\(amazonaws\\|amazon\\)\\.com" git-link-commit-codecommit)))
 '(git-link-remote-alist
   '(("dev.bevuta.com" git-link-gitlab) ("git.sr.ht" git-link-sourcehut)
     ("codeberg.org" git-link-codeberg) ("github" git-link-github)
     ("bitbucket" git-link-bitbucket) ("gitorious" git-link-gitorious)
     ("gitlab" git-link-gitlab)
     ("git\\.\\(sv\\|savannah\\)\\.gnu\\.org" git-link-savannah)
     ("googlesource.com" git-link-googlesource)
     ("visualstudio\\|azure" git-link-azure)
     ("sourcegraph" git-link-sourcegraph)
     ("\\(amazonaws\\|amazon\\)\\.com" git-link-codecommit)))
 '(git-link-use-commit nil)
 '(global-auto-revert-mode t)
 '(global-hl-todo-mode t)
 '(global-undo-tree-mode t)
 '(ignored-local-variable-values '((flycheck-disabled-checkers emacs-lisp-checkdoc)))
 '(indent-tabs-mode nil)
 '(ivy-mode t)
 '(lsp-auto-configure nil)
 '(lsp-completion-enable-additional-text-edit nil)
 '(lsp-completion-provider :none)
 '(lsp-completion-show-kind nil)
 '(lsp-eldoc-enable-hover nil)
 '(lsp-enable-dap-auto-configure nil)
 '(lsp-enable-file-watchers nil)
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
 '(make-backup-files nil)
 '(package-selected-packages
   '(ace-window ag cider company counsel-projectile cursor-undo dired-du
                dired-rsync direnv easy-kill effort-export flycheck-clj-kondo
                git-link hl-todo ivy lsp-mode magit nix-mode prettier projectile
                smartparens swiper term-keys undo-tree xclip xref-union))
 '(require-final-newline t)
 '(safe-local-variable-values
   '((grep-find-ignored-files "*.min.js")
     (eval add-to-list grep-find-ignored-files ("*.min.js"))
     (add-to-list grep-find-ignored-files ("*.min.js"))
     (grep-find-ignored-directories "dev-server/postgres" ".clj-kondo"
                                    ".cpcache" ".shadow-cljs" "node_modules"
                                    ".lsp/.cache" "out" "debug"
                                    "module/cljs-client/npm")
     (grep-find-ignored-directories "dev-server/postgres" ".clj-kondo"
                                    ".cpcache" ".shadow-cljs" "node_modules"
                                    ".lsp/.cache" "out" "debug")
     (eval setq-local cider-shadow-cljs-parameters
           (let ((default-directory (clojure-project-dir)))
             (concat "-A"
                     (car
                      (process-lines "bb" "aliases:dev" ":module/cljs-client"))
                     " server")))
     (eval setq-local cider-shadow-cljs-parameters
           "-A:ext/clojure:ext/shadow-cljs:ext/datascript:ext/promesa:ext/cljs-cache:salus/backend:dev/cljs-client:test/cljs-client:module/cljs-client:ext/clj-memory-meter:ext/criterium:bundle/bench:ext/kaocha:ext/kaocha.junit-xml:ext/kaocha.retry:bundle/kaocha:ext/portal:ext/tools.namespace:task/dev:dev server")
     (eval setq-local cider-shadow-cljs-parameters "-A:dev server")
     (eval setq-local cider-shadow-cljs-parameters
           (let ((default-directory (clojure-project-dir)))
             (concat "-A"
                     (car
                      (process-lines "bb" "aliases:dev" ":module/cljs-client"))
                     ":dev server")))
     (eval setq-local cider-shadow-cljs-parameters
           (let ((default-directory (clojure-project-dir)))
             (concat "server -A"
                     (car
                      (process-lines "bb" "aliases:dev" ":module/cljs-client"))
                     ":dev")))
     (eval setq-local cider-shadow-cljs-parameters "server -A:dev")
     (eval setq-local cider-shadow-cljs-parameters
           (let ((default-directory (clojure-project-dir)))
             (concat "server -A:dev"
                     (car
                      (process-lines "bb" "aliases:dev" ":module/cljs-client")))))
     (eval setq-local cider-shadow-cljs-parameters
           (let ((default-directory (clojure-project-dir)))
             (concat "server -A"
                     (car
                      (process-lines "bb" "aliases:dev" ":module/cljs-client")))))
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (car (process-lines "bb" "aliases:dev" ":module/cljs-client"))))
     (grep-find-ignored-directories "dev-server/postgres" ".clj-kondo"
                                    ".cpcache" ".shadow-cljs" "node_modules"
                                    ".lsp/.cache" "out")
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (car (process-lines "bb" "aliases:dev" ":module/server.admin"))))
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (car (process-lines "bb" "aliases:dev" ":module/build"))))
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (car
              (process-lines "bb" "aliases:dev"
                             ":module/verification-phone-caller"))))
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (car (process-lines "bb" "aliases:dev" ":module/server.main"))))
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (car (process-lines "bb" "aliases:dev" ":module/server.main.dalli"))))
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (shell-command-to-string
              "bb aliases:dev :module/server.main.dalli 2>/dev/null")))
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (shell-command-to-string
              "bb aliases:dev :module/verification-phone-caller 2>/dev/null")))
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (shell-command-to-string
              "bb aliases:dev :module/server.admin 2>/dev/null")))
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (shell-command-to-string "bb aliases:dev :module/build 2>/dev/null")))
     (eval define-clojure-indent (defobject '(2 :form :form (1))))
     (grep-find-ignored-directories ".shadow-cljs" ".cpcache" ".clj-kondo")
     (grep-find-ignored-directories ".shadow-cljs")
     (eval setq-local cider-clojure-cli-aliases
           (let ((default-directory (clojure-project-dir)))
             (shell-command-to-string
              "bb aliases:dev :module/server.main 2>/dev/null")))
     (cljr-insert-newline-after-require) (cljr-favor-prefix-notation)
     (cider-clojure-cli-aliases
      "NOTE: you need to run cider-jack-in from a file of one of the subprojects. See README.md for details.")
     (grep-find-ignored-directories "dev-server/postgres" ".clj-kondo"
                                    ".cpcache")))
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
