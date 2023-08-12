;;; init-key-echo.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'key-echo)

(key-echo-enable)

(defun key-echo-shift-to-switch-input-method (key)
  (interactive)
  (when (string-equal key "Key.shift")
    (my/toggle-input-method)))

(setq key-echo-single-key-trigger-func 'key-echo-shift-to-switch-input-method)

(provide 'init-key-echo)
;;; init-key-echo.el ends here
