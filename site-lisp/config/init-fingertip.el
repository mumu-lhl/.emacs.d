;;; init-fingertip.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'fingertip)

(dolist (hook
         '(python-ts-mode-hook
           emacs-lisp-mode-hook
           rust-ts-mode-hook
           css-ts-mode-hook
           toml-ts-mode-hook
           yaml-ts-mode-hook
           json-ts-mode-hook
           js-ts-mode-hook
           typescript-ts-mode-hook
           bash-ts-mode-hook
           toml-ts-mode-hook))
  (add-hook hook #'fingertip-mode))

(provide 'init-fingertip)
;;; init-fingertip.el ends here
