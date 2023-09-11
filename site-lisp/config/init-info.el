;;; init-info.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'info)

(lazy-load-set-keys
 '(("H" . Info-toc)
   ("T" . Info-up)
   ("D" . Info-prev)
   ("N" . Info-next))
 Info-mode-map)

(provide 'init-info)
;;; init-info.el ends here
