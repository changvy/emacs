;; add cedet
(require-package 'cc-mode)
(semantic-mode nil)

;; add .inl and .h to c++ mode
(add-to-list 'auto-mode-alist '("\\.inl$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; add rainbow bucket
(require-package 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(require-package 'mic-paren)
(paren-activate)
(add-hook 'c-mode-common-hook
          (function (lambda ()
                      (paren-toggle-open-paren-context t))))

;;(add-hook 'c-mode-common-hook 'highlight-indent-guides-mode)
;;(setq highlight-indent-guides-method 'column)

;; Available C style:
;; gnu The default style for GNU projects
;; k&r What Kernighan and Ritchie, the authors of C used in their book
;; bsd What BSD developers use, aka Allman style after Eric Allman.
;; whitesmith Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; stroustrup What Stroustrup, the author of C++ used in his book
;; ellemtel Popular C++ coding standards as defined by Programming in C++, Rules and Recommendations, Erik Nyquist and Mats Henricson, Ellemtel
;; linux What the Linux developers use for kernel development
;; python What Python developers use for extension modules
;; java The default style for java-mode (see below)
;; user When you want to define your own style
(setq c-default-style "bsd")
(setq c-basic-offset 4)

(provide 'setup-c)
