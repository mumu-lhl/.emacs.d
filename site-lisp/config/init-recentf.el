;;; init-recentf.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'recentf)

(setq
 recentf-exclude
 (list no-littering-etc-directory no-littering-var-directory "/tmp/")
 recentf-max-menu-items 350
 recentf-max-saved-items 400)

(recentf-mode)

(provide 'init-recentf)
;;; init-recentf.el ends here
