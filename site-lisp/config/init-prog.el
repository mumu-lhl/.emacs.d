;;; init-prog.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(setq
 show-paren-when-point-in-periphery t
 show-paren-when-point-inside-paren t)
(setq-default
 display-line-numbers-type 'relative
 indent-tabs-mode nil
 tab-width 4)

(show-paren-mode)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(provide 'init-prog)
;;; init-prog.el ends here
