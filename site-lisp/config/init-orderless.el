;;; init-orderless.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'orderless)

(setq
 completion-styles '(orderless basic)
 completion-category-overrides '((file (styles basic partial-completion))))

(provide 'init-orderless)
;;; init-orderless.el ends here
