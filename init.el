 (electric-pair-mode t)                       ; 自动补全括号
  (add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
  (global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
  (delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
  (setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面
  
  (add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
  
  (when (display-graphic-p) (tool-bar-mode -1))                           ; 关闭 Tool bar
  (when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条
  
  (savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
  (save-place-mode 1)
  (setq-default word-wrap t)                   ; 断行
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize) ;设置melpa的初始化配置，需要提前package install use-package
  
  (eval-when-compile
    ;; Following line is not needed if use-package.el is in ~/.emacs.d
    ;; (add-to-list 'load-path "<path where use-package is installed>")
    (require 'use-package))
  
  
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(package-selected-packages '(monokai use-package)))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
