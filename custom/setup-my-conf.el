(require 'unicad)

(require 'setup-edit)

(require 'setup-c)

(require 'setup-cquery)

(require 'doxygen)

(require-package 'counsel-projectile)
(counsel-projectile-mode)

;; variables
;; set doxygen username
(setq user-full-name "verminniu")

;; proj no need add .o/.a
(setq projectile-globally-ignored-file-suffixes '(".o" ".a"))
(setq projectile-enable-caching t)


;; last setup key map
(require 'my-keymap)

(add-to-list `load-path "~/.emacs.d/elpa-26.1/evil-20180914.1216")
(require 'evil)
(evil-mode 1)

(provide 'setup-my-conf)
