;;; init-fingertip.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'fingertip)

;; https://github.com/manateelazycat/lazycat-emacs/blob/master/site-lisp/config/init-key.el
(defvar fingertip-key-alist nil)
(setq fingertip-key-alist
      '(
        ;; 移动
        ("M-n" . fingertip-jump-right)
        ("M-p" . fingertip-jump-left)
        ;; 符号插入
        ("%" . fingertip-match-paren)       ;括号跳转
        ("(" . fingertip-open-round)        ;智能 (
        ("[" . fingertip-open-bracket)      ;智能 [
        ("{" . fingertip-open-curly)        ;智能 {
        (")" . fingertip-close-round)       ;智能 )
        ("]" . fingertip-close-bracket)     ;智能 ]
        ("}" . fingertip-close-curly)       ;智能 }
        ("\"" . fingertip-double-quote)     ;智能 "
        ("'" . fingertip-single-quote)      ;智能 '
        ("=" . fingertip-equal)             ;智能 =
        ("SPC" . fingertip-space)           ;智能 space
        ("RET" . fingertip-newline)         ;智能 newline
        ;; 删除
        ("M-o" . fingertip-backward-delete) ;向后删除
        ("C-d" . fingertip-forward-delete)  ;向前删除
        ("C-k" . fingertip-kill)            ;向前kill
        ;; 包围
        ("M-\"" . fingertip-wrap-double-quote) ;用 " " 包围对象, 或跳出字符串
        ("M-'" . fingertip-wrap-single-quote) ;用 ' ' 包围对象, 或跳出字符串
        ("M-[" . fingertip-wrap-bracket)      ;用 [ ] 包围对象
        ("M-{" . fingertip-wrap-curly)        ;用 { } 包围对象
        ("M-(" . fingertip-wrap-round)        ;用 ( ) 包围对象
        ("M-)" . fingertip-unwrap)            ;去掉包围对象
        ;; 跳出并换行缩进
        ("M-:" . fingertip-jump-out-pair-and-newline) ;跳出括号并换行
        ;; 向父节点跳动
        ("C-j" . fingertip-jump-up)))
(lazy-load-unset-keys
 '("M-J" "M-r" "M-s" "M-;" "C-M-f" "C-M-b" "M-)")
 fingertip-mode-map)
(lazy-load-set-keys fingertip-key-alist fingertip-mode-map)

(dolist (hook
         '(python-ts-mode-hook
           emacs-lisp-mode-hook
           rust-ts-mode-hook
           css-ts-mode-hook
           toml-ts-mode-hook
           yaml-ts-mode-hook
           json-ts-mode-hook
           js-ts-mode-hook
           typescript-ts-mode-hook
           bash-ts-mode-hook
           toml-ts-mode-hook
	   c-ts-mode-hook))
  (add-hook hook #'fingertip-mode))

(provide 'init-fingertip)
;;; init-fingertip.el ends here
