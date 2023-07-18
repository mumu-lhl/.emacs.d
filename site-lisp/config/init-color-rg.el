;;; init-color-rg.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'color-rg)

(setq color-rg-search-ignore-rules
      "-g '!node_modules' -g '!dist' -g '!var' -g '!site-lisp'")

(provide 'init-color-rg)
;;; init-color-rg.el ends here
