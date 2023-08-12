;;; init-color-rg.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'color-rg)

(setq color-rg-search-ignore-rules
      "-g '!node_modules' -g '!dist' -g '!var' -g '!site-lisp'")

(lazy-load-set-keys
 '(("h" . color-rg-jump-prev-file)
   ("l" . color-rg-jump-next-file))
 color-rg-mode-map)

(provide 'init-color-rg)
;;; init-color-rg.el ends here
