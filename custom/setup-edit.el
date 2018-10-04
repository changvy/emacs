(set-terminal-coding-system 'gb2312)
(set-keyboard-coding-system 'gb2312)
(set-language-environment "Chinese-GB")
(prefer-coding-system 'gb2312)

(require-package 'iedit)
(setq iedit-toggle-key-default nil)

(require-package 'ztree)
(setq ztree-diff-additional-options '("-w"))

;; 增加窗口大小调整
(require-package 'windsize)
(windsize-default-keybindings) ; C-S-<left/right/up/down>

(require-package 'window-numbering)
(window-numbering-mode 1)

;; 窗口自动编号切换
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

;; 平滑滚动
;;(require-package 'smooth-scrolling)
;;(smooth-scrolling-mode 1)

;;保存时自动删除行尾空格
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; cquery等的函数参数补全依赖这个
;; Package: yasnippet
;; GROUP: Editing -> Yasnippet
;; Package: yasnippet
(use-package yasnippet
  :defer t
  :init
  (add-hook 'prog-mode-hook 'yas-minor-mode))

;; 增加行号
(global-display-line-numbers-mode)

(provide 'setup-edit)
