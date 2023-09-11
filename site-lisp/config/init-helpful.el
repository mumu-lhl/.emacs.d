;;; init-helpful.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'helpful)

(lazy-load-set-keys
 '(("j" . next-line)
   ("k" . previous-line)
   ("h" . backward-char)
   ("l" . forward-char)
   ("J" . scroll-up-line)
   ("K" . scroll-down-line))
 helpful-mode-map)

(provide 'init-helpful)
;;; init-helpful.el ends here
