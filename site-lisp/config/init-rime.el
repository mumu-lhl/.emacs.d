;;; init-rime.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'rime)

(setq default-input-method "rime"
      rime-show-candidate 'posframe)

(add-to-list 'rime-translate-keybindings "C-`")

(provide 'init-rime)
;;; init-rime.el ends here
