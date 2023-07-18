;;; init-awesome-tray.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'awesome-tray)

(setq
 awesome-tray-active-modules
 '("location" "belong" "file-path" "input-method" "date")
 awesome-tray-location-format " %p"
 awesome-tray-location-info-top " T"
 awesome-tray-location-info-bottom " B")
(with-eval-after-load 'init-rime
  (setq awesome-tray-input-method-zh-style rime-title))
(setq-default mode-line-format t)

(add-hook
 'after-init-hook
 #'(lambda ()
     (setq awesome-tray-mode-line-active-color
           (frame-parameter nil 'foreground-color))
     (setq awesome-tray-mode-line-inactive-color
           (frame-parameter nil 'background-color))
     (awesome-tray-mode)))

(provide 'init-awesome-tray)
;;; init-awesome-tray.el ends here
