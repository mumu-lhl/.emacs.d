;;; init-key-echo.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'key-echo)

(key-echo-enable)

(defun key-echo-shift-to-switch-input-method (key)
  (interactive)
  (cond
   ((and (string-equal key "Key.shift")
         (not buffer-read-only)
         (not (derived-mode-p 'eaf-mode)))
    (my/toggle-input-method))
   ((and (string-equal key "Key.alt")
         (require 'blink-search nil t)
         (not blink-search-start-buffer))
    (blink-search))))

(setq key-echo-single-key-trigger-func 'key-echo-shift-to-switch-input-method)

(provide 'init-key-echo)
;;; init-key-echo.el ends here
