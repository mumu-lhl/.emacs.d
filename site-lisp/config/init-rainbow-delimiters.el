;;; init-rainbow-delimiters.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'rainbow-delimiters)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 'init-rainbow-delimiters)
;;; init-rainbow-delimiters.el ends here
