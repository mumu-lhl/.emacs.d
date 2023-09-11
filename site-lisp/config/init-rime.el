;;; init-rime.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'rime)

(setq
 default-input-method "rime"
 rime-show-candidate 'posframe)

(add-to-list 'rime-translate-keybindings "C-`")

(lazy-load-set-keys
 '(("M-o" . rime--backspace)
   ("M-m" . rime--return)
   ("M-h" . rime--escape))
 rime-active-mode-map)

(provide 'init-rime)
;;; init-rime.el ends here
