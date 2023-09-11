;;; init-desktop.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'desktop)

(setq
 desktop-save t
 desktop-load-locked-desktop t
 desktop-restore-frames nil)

(add-hook 'kill-emacs-hook 'desktop-save-in-desktop-dir)

(provide 'init-desktop)
;;; init-desktop.el ends here
