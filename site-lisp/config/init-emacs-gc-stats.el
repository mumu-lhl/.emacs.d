;;; init-emacs-stat-gc.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'emacs-gc-stats)

(setq emacs-gc-stats-remind t)

(emacs-gc-stats-mode)

(provide 'init-emacs-gc-stats)
;;; init-emacs-gc-stats.el ends here
