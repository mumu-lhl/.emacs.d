;;; init-markmacro.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'markmacro)

;; https://github.com/manateelazycat/lazycat-emacs/blob/master/site-lisp/config/init-markmacro.el
(one-key-create-menu
 "MARK-MACRO"
 '(
   (("w" . "Mark word") . markmacro-mark-words) ;标记当前符号的单词或者选中区域的单词
   (("s" . "Mark symbol") . markmacro-mark-symbols) ;标记当前符号
   (("l" . "Mark line") . markmacro-mark-lines)     ;标记非空行
   (("c" . "Mark char") . markmacro-mark-chars)     ;标记当前字符
   (("p" . "Mark parameters") . markmacro-mark-parameters) ;标记参数
   (("i" . "Mark imenu") . markmacro-mark-imenus) ;标记函数或变量
   (("h" . "Secondary region set") . markmacro-secondary-region-set) ;设置二级选中区域
   (("j" . "Secondary region mark cursor") . markmacro-secondary-region-mark-cursors) ;标记二级选中区域内的光标对象
   )
 t)

(provide 'init-markmacro)
;;; init-markmacro.el ends here
