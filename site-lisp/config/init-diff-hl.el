;;; init-diff-hl.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'diff-hl)

(add-hook 'prog-mode-hook 'diff-hl-mode)

(provide 'init-diff-hl)
;;; init-diff-hl.el ends here
