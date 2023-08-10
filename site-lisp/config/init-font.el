;;; init-font.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(defun load-font-setup ()
  (set-face-attribute 'default nil :height 130 :family "FiraCode Nerd Font"))

(load-font-setup)

(add-function :after after-focus-change-function #'load-font-setup)

(dolist (hook '(prog-mode-hook text-mode-hook))
  (add-hook hook #'load-font-setup))

(provide 'init-font)
;;; init-font.el ends here
