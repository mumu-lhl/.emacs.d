;;; init-copyright.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'copyright)

(setq copyright-year-ranges t)

(defun my/copyright-update-directory (DIRECTORY MATCH)
  "Update copyright notice for all files in DIRECTORY matching MATCH."
  (interactive "DDirectory: \nMFilenames matching (regexp): ")
  (copyright-update-directory DIRECTORY MATCH t))

(provide 'init-copyright)
;;; init-copyright.el ends here
