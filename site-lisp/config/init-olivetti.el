;;; init-olivetti.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'olivetti)

(dolist (hook '(markdown-mode-hook org-mode-hook))
  (add-hook hook 'olivetti-mode))

(provide 'init-olivetti)
;;; init-olivetti.el ends here
