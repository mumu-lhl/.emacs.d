;;; init-cursor-chg.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'cursor-chg)

(change-cursor-mode)
(toggle-cursor-type-when-idle)

(provide 'init-cursor-chg)
;;; init-cursor-chg.el ends here
