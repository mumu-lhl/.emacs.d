;;; init-vundo.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'vundo)

(meow-define-keys 'normal '("u" . vundo) '("U" . undo-only))

(provide 'init-vundo)
;;; init-vundo.el ends here
