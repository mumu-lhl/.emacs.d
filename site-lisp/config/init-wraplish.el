;;; init-wraplish.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(autoload 'wraplish-mode "wraplish" "" t)

(setq wraplish-add-space-after-chinese-punctuation t)

(dolist (hook '(markdown-mode-hook org-mode-hook))
  (add-hook hook 'wraplish-mode))

(provide 'init-wraplish)
;;; init-wraplish.el ends here
