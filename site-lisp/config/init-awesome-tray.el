;;; init-awesome-tray.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'awesome-tray)

(setq
 awesome-tray-active-modules
 '("location" "belong" "file-path" "date")
 awesome-tray-info-padding-right 1
 awesome-tray-location-format " %p"
 awesome-tray-location-info-top " T"
 awesome-tray-location-info-bottom " B")

(awesome-tray-mode)

(provide 'init-awesome-tray)
;;; init-awesome-tray.el ends here
