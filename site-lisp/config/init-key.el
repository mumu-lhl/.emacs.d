;;; init-key.el ---                                  -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;; https://github.com/manateelazycat/lazycat-emacs/blob/master/site-lisp/config/init-key.el

;;; Code:

(require 'lazy-load)

(lazy-load-unset-keys
 '("C-x C-f" "C-z" "C-q" "s-T" "s-W" "s-z" "M-h" "C-x C-c"
   "s-c" "s-x" "s-v" "C-6" "M-." "M-,"))

(lazy-load-global-keys '(("s-s" . blink-search)) "init-blink-search")

;; edit
(lazy-load-set-keys '(("M-o" . backward-delete-char-untabify)))

;; thing edit
(lazy-load-global-keys '(("s-t" . one-key-menu-thing-edit)) "init-thing-edit")

;; smex
(lazy-load-set-keys '(("M-x" . smex+) ("<menu>" . smex+)))

;; buffer
(lazy-load-set-keys '(("b i" . ibuffer)) nil "C-c")

;; search
(lazy-load-set-keys
 '(("s i" . isearch-forward) ("s r" . isearch-backward)) nil "C-c")
(lazy-load-global-keys
 '(("s p" . color-rg-search-input)
   ("s f" . color-rg-search-input-in-current-file))
 "init-color-rg" "C-c")

;; bookmark
(lazy-load-set-keys '(("b l" . list-bookmarks)) nil "C-c")

;; desktop
(lazy-load-set-keys '(("f r" . desktop-read)) nil "C-c")

;; EAF
(lazy-load-global-keys
 '(("M-1" . eaf-open-in-file-manager)
   ("M-2" . eaf-open-file-manager))
 "init-eaf")
(lazy-load-global-keys
 '(("e b" . eaf-open-browser)
   ("e g" . eaf-open-git)
   ("e h" . eaf-git-show-history)
   ("e m" . my/open-music-player)
   ("e o" . eaf-open)
   ("e r" . eaf-open-rss-reader)
   ("t t" . eaf-open-pyqterminal)
   ("t y" . eaf-open-ipython))
 "init-eaf" "C-c")

;; Sort tab
(lazy-load-global-keys
 '(("C-s-2" . sort-tab-select-next-tab)
   ("C-s-1" . sort-tab-select-prev-tab)
   ("C-s-3" . sort-tab-select-first-tab)
   ("C-s-4" . sort-tab-select-last-tab)
   ("C-s-8" . sort-tab-close-current-tab))
 "init-sort-tab")

;; LSP Bridge
(lazy-load-global-keys
 '(
   ("C-7" . lsp-bridge-find-def-return)
   ("C-8" . lsp-bridge-find-def)
   ("M-," . lsp-bridge-code-action)
   ("M-." . lsp-bridge-find-references)
   ("C-9" . lsp-bridge-popup-documentation)
   ("C-0" . lsp-bridge-rename)
   ("C-!" . lsp-bridge-diagnostic-list)
   ("M-s-j" . lsp-bridge-popup-documentation-scroll-up)   ;向下滚动文档
   ("M-s-k" . lsp-bridge-popup-documentation-scroll-down) ;向上滚动文档
   )
 "init-lsp-bridge")

;; window
(lazy-load-set-keys
 '(("C-s-5" . holo-layer-jump-to-window)
   ("C-s-y" . toggle-one-window)
   ("C-x ;" . delete-other-windows)
   ("s-q" . delete-window)))

;; Quit
(lazy-load-set-keys '(("q q" . kill-emacs) ("q r" . restart-emacs)) nil "C-c")

;; Org
(lazy-load-set-keys '(("o c" . org-capture)) nil "C-c")

;; Webjump
(lazy-load-global-keys '(("C-c w j" . webjump)) "init-webjump")

;; symbol overlay
(lazy-load-global-keys '(("M-s" . symbol-overlay-put)) "symbol-overlay")

;; delete block
(lazy-load-global-keys
 '(("M-N" . delete-block-forward)
   ("M-P" . delete-block-backward))
 "delete-block")

;; undo
(lazy-load-global-keys '(("s-u" . vundo)) "vundo")

;; move
(lazy-load-set-keys
 '(
   ("C-z k" . beginning-of-buffer)      ;缓存开始
   ("C-z j" . end-of-buffer)            ;缓存结尾
   ))
(lazy-load-global-keys
 '(("s-P" . move-text-up)
   ("s-N" . move-text-down))
 "move-text")
(lazy-load-global-keys
 '(("s-K" . duplicate-line-or-region-above)
   ("s-J" . duplicate-line-or-region-below)
   ("C-s-k" . duplicate-line-above-comment)
   ("C-s-j" . duplicate-line-below-comment)
   ("C-;" . comment-or-uncomment-region+))
 "duplicate-line")
(lazy-load-global-keys
 '(("C-o" . open-newline-below)
   ("s-o" . open-newline-above))
 "open-newline")

;; goto line
(lazy-load-global-keys '(("M-g" . goto-line-preview)) "goto-line-preview")

;; effortless indent
(lazy-load-global-keys
 '(("C-s-r" . effortless-indent-right)
   ("C-s-e" . effortless-indent-left))
 "effortless-indent")

;; basic toolkit
(lazy-load-global-keys
 '(("M-s-n" . comment-part-move-down)
   ("M-s-p" . comment-part-move-up)
   ("C-s-n" . comment-dwim-next-line)
   ("C-s-p" . comment-dwim-prev-line)
   ("C-2" . indent-buffer)
   ("C-x u" . mark-line)
   ("C-," . remember-init)
   ("C-." . remember-jump)
   ("s-j" . scroll-up-line)
   ("s-k" . scroll-down-line)
   ("<f2>" . refresh-file)
   ("s-f" . find-file-root))
 "basic-toolkit")

;; help
(lazy-load-global-keys
 '(("f" . helpful-function)
   ("v" . helpful-variable)
   ("m" . helpful-macro)
   ("M" . describe-mode)
   ("k" . helpful-key))
 "init-helpful"
 "C-h")

;; watch other window
(lazy-load-global-keys
 '(("M-J" . watch-other-window-up)
   ("M-K" . watch-other-window-down)
   ("M-<" . watch-other-window-up-line)
   ("M->" . watch-other-window-down-line))
 "watch-other-window")

;; mark macro
(lazy-load-global-keys
 '(
   ("s-h" . one-key-menu-mark-macro)     ;one-key菜单
   ("s-M" . markmacro-rect-set)          ;记录矩形编辑开始的位置
   ("s-D" . markmacro-rect-delete)       ;删除矩形区域
   ("s-F" . markmacro-rect-replace)      ;替换矩形区域的内容
   ("s-I" . markmacro-rect-insert)       ;在矩形区域前插入字符串
   ("s-C" . markmacro-rect-mark-columns) ;转换矩形列为标记对象
   ("s-S" . markmacro-rect-mark-symbols) ;转换矩形列对应的符号为标记对象
   ("s-<" . markmacro-apply-all)         ;应用键盘宏到所有标记对象
   ("s->" . markmacro-apply-all-except-first) ;应用键盘宏到所有标记对象, 除了第一个， 比如下划线转换的时候
   )
 "init-markmacro")

;; buffer
(lazy-load-set-keys
 '(
   ("s-," . bury-buffer)                ;隐藏当前buffer
   ("s-." . unbury-buffer)              ;反隐藏当前buffer
   ("s-[" . eval-expression)            ;执行表达式
   ("C-s-q" . quoted-insert)            ;读取系一个输入字符并插入
   ))
(lazy-load-global-keys '(("s-R" . re-builder)) "init-rebuilder")

;; goto-last-change
(lazy-load-global-keys '(("C-'" . goto-last-change)) "goto-last-change")

;; English Helper
(lazy-load-global-keys '(("M-r" . lsp-bridge-toggle-sdcv-helper)) "init-lsp-bridge")

;; woman
(lazy-load-set-keys '(("<f1>" . woman)))

(provide 'init-key)
;; init-key.el ends here
