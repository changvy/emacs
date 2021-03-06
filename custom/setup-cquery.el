;; add cquery
(require-package 'cquery)

;; company
(use-package company
  :init
  (global-company-mode 1)
  )

(use-package company-c-headers
  :init
  (add-to-list 'company-backends 'company-c-headers))

(use-package company-quickhelp)

(use-package company-lsp
  :defer t
  :init
  (setq company-quickhelp-delay 0)
  ;; Language servers have better idea filtering and sorting,
  ;; don't filter results on the client side.
  (setq company-transformers nil)
  (setq company-lsp-async t)
  (setq company-lsp-cache-candidates nil)

  ;;  (add-to-list 'company-backends 'company-lsp)
  ;;  (add-hook 'c-mode-common-hook 'company-lsp)
  (add-to-list 'company-backends 'company-lsp)
  )

(setq cquery-executable "cquery")
;; ;; Arch Linux aur/cquery-git aur/cquery
;; (setq cquery-executable "/usr/bin/cquery")

;; ;; Log file
(setq cquery-extra-args '("--log-file=~/.cquery/log/cq.log"))

;; Cache directory, both relative and absolute paths are supported
(setq cquery-cache-dir "~/.cquery/cquery-cache")
;; Initialization
(setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack" :completion (:detailedLabel t)))

(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".cquery")
                projectile-project-root-files-top-down-recurring)))

(defun cquery//enable ()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

(lsp-cquery-enable)
(add-hook 'c-mode-common-hook #'cquery//enable)

;;(use-package cquery
;;  :commands lsp-cquery-enable
;;  :init (add-hook 'c-mode-common-hook #'cquery//enable))
;;;; Also see lsp-project-whitelist lsp-project-blacklist cquery-root-matchers
;;

(require-package 'ivy-xref)
(setq xref-show-xrefs-function 'ivy-xref-show-xrefs)


(require-package 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(add-hook 'c-mode-common-hook 'flycheck-mode)
;;(setq lsp-ui-sideline-enable nil)
(setq lsp-ui-doc-enable nil)
;;(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
;;(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;;(cquery-xref-find-custom "$cquery/base")
;;(cquery-xref-find-custom "$cquery/callers")
;;(cquery-xref-find-custom "$cquery/derived")
;;(cquery-xref-find-custom "$cquery/vars")
;;
;;;;;; Alternatively, use lsp-ui-peek interface
;;(lsp-ui-peek-find-custom 'base "$cquery/base")
;;(lsp-ui-peek-find-custom 'callers "$cquery/callers")
;;(lsp-ui-peek-find-custom 'random "$cquery/random") ;; jump to a random declaration
;;
;;(setq lsp-ui-doc-include-signature nil)  ; don't include type signature in the child frame
;;(setq lsp-ui-sideline-show-symbol nil)  ; don't show symbol on the right of info
;;
;;(cquery-call-hierarchy nil) ; caller hierarchy
;;(cquery-call-hierarchy t) ; callee hierarchy

(setq cquery-sem-highlight-method 'font-lock)
;;(setq cquery-sem-highlight-method 'overlay)

;; For rainbow semantic highlighting
(cquery-use-default-rainbow-sem-highlight)
;;(setq lsp-highlight-symbol-at-point nil)

(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
(setq cquery-extra-init-params '(:completion (:detailedLabel t)))

(provide 'setup-cquery)
