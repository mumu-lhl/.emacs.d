;;; init-cns.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'cns)

(setq
 cns-prog
 "/home/mumulhl/.emacs.d/site-lisp/extensions/emacs-chinese-word-segmentation/cnws"
 cns-dict-directory "/home/mumulhl/.emacs.d/site-lisp/extensions/emacs-chinese-word-segmentation/cppjieba/dict"
 cns-debug nil)

(dolist (hook '(org-mode-hook markdown-mode-hook text-mode-hook))
  (add-hook hook 'cns-mode))

(provide 'init-cns)
;;; init-cns.el ends here
