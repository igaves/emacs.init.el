(electric-pair-mode t)                       ; 自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
(global-auto-revert-mode t)                  ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
(delete-selection-mode t)                    ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
(setq inhibit-startup-message t)             ; 关闭启动 Emacs 时的欢迎界面

(add-hook 'prog-mode-hook #'hs-minor-mode)   ; 编程模式下，可以折叠代码块
(add-hook 'dired-mode-hook 'auto-revert-mode) ; 创建文件后，自动刷新
(setq truncate-lines nil) ; 自动折行

(add-to-list 'auto-mode-alist  '("\\.org\\'" . org-mode)) ; 自动打开org-mode

(setq org-use-fast-todo-selection t) ; task 设置
(setq org-todo-keywords '((sequence "TODO(t)" "DOING(i)" "|" "DONE(d)" "ABORT(a)"))) ;task 设置
(setq org-todo-keyword-faces '(("TODO" . "red")
                               ("DOING" . "yellow")
                               ("DONE" . "green")))  ; 颜色调整一下

;;;;;;;;;;; caputure

(setq org-directory "~/Documents/my-daliy-notes") ; org 目录

(setq org-capture-templates nil)


(define-key global-map (kbd "C-c c") 'org-capture)

(add-to-list 'org-capture-templates
             '("n" "Notes" entry (file "~/Documents/my-daliy-notes/daliy-notes.org")
               "* %U - %^{heading}\n  %?"))
(add-to-list 'org-capture-templates
             '("b" "Book in Reading" entry (file "~/Documents/my-daliy-notes/daliy-notes.org")
               "* %U - 《%^{书}》笔记\n  %?"))

(add-to-list 'org-capture-templates
             '("i" "Inbox" entry (file "~/Documents/my-daliy-notes/inbox.org")
               "* %U - %^{来源}\n  %?"))

;;;;;;;;;

(let ((backup-dir "~/tmp/emacs/backups")
      (auto-saves-dir "~/tmp/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks                           
      delete-old-versions t  ; Clean up the backups                             
      version-control t      ; Use version numbers on backups,                  
      kept-new-versions 5    ; keep some new versions                           
      kept-old-versions 2)   ; and some old ones, too


;;;;;;;;;;;;

(when (display-graphic-p) (tool-bar-mode -1))                           ; 关闭 Tool bar
(when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条

(savehist-mode 1)                            ; （可选）打开 Buffer 历史记录保存
(save-place-mode 1)
(setq org-startup-truncated nil)                  ; 断行
(global-visual-line-mode 1)

(require 'package)           ;melpa配置，package install
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize) ;设置melpa的初始化配置，需要提前package install use-package

(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;; (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))


(setq use-package-always-ensure t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(writeroom-mode magit monokai use-package)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(load-theme 'monokai t)

(set-face-attribute 'default nil :height 150)
(setq line-spacing 0.5)

(when (display-graphic-p) (set-fringe-mode 20))
