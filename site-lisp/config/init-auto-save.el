;;; init-auto-save.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'auto-save)

(setq
 auto-save-silent t
 auto-save-delete-trailing-whitespace t)

(auto-save-enable)

(provide 'init-auto-save)
;;; init-auto-save.el ends here
