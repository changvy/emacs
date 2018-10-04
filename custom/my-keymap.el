;;; package my key map
(require-package 'bind-key)

(bind-keys*
 ("C-s" . swiper)
 ("C-S-s" . swiper-all)

 ("C-c C-r" . ivy-resume)
 ("C-c v" . ivy-push-view)
 ("C-c V" . ivy-pop-view)
 )

(bind-keys
 :map counsel-mode-map
 ([remap swiper] . counsel-grep-or-swiper)
 ("C-x C-r" . counsel-recentf)
 ("C-x j" . counsel-mark-ring)

 ("C-c L" . counsel-load-library)
 ("C-c P" . counsel-package)
 ("C-c f" . counsel-find-library)
 ("C-c g" . counsel-grep)
 ("C-c h" . counsel-command-history)
 ("C-c i" . counsel-git)
 ("C-c j" . counsel-git-grep)
 ("C-c l" . counsel-locate)
 ("C-c r" . counsel-rg)
 ("C-c z" . counsel-fzf)

 ("C-c c L" . counsel-load-library)
 ("C-c c P" . counsel-package)
 ("C-c c a" . counsel-apropos)
 ("C-c c e" . counsel-colors-emacs)
 ("C-c c f" . counsel-find-library)
 ("C-c c g" . counsel-grep)
 ("C-c c h" . counsel-command-history)
 ("C-c c i" . counsel-git)
 ("C-c c j" . counsel-git-grep)
 ("C-c c l" . counsel-locate)
 ("C-c c m" . counsel-minibuffer-history)
 ("C-c c o" . counsel-outline)
 ("C-c c p" . counsel-pt)
 ("C-c c r" . counsel-rg)
 ("C-c c s" . counsel-ag)
 ("C-c c t" . counsel-load-theme)
 ("C-c c u" . counsel-unicode-char)
 ("C-c c w" . counsel-colors-web)
 ("C-c c z" . counsel-fzf)

 ;; Find counsel commands quickly
 ("<f6>" . (lambda ()
             (interactive)
             (counsel-M-x "^counsel ")))
 )

(bind-keys
 :map ivy-minibuffer-map
 ("C-w" . ivy-yank-word)

 ;; Search at point
 ;; "M-j": word-at-point
 ;; "M-n"/"C-w": symbol-at-point
 ;; Refer to https://www.emacswiki.org/emacs/SearchAtPoint#toc8
 ;; and https://github.com/abo-abo/swiper/wiki/FAQ
 ;; ("C-w" . (lambda ()
 ;;            (interactive)
 ;;            (insert (format "%s" (with-ivy-window (ivy-thing-at-point))))))
 )

(bind-keys
 :map counsel-find-file-map
 ("C-h" . counsel-up-directory)
)

(bind-keys
 :map swiper-map
 ("M-%" . swiper-query-replace))


(provide 'my-keymap)
;;; my-keymap end here
