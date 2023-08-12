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

(defun my/next-error ()
  "Next error."
  (interactive)
  (if (eq major-mode 'emacs-lisp-mode)
      (flymake-goto-next-error)
    (lsp-bridge-diagnostic-jump-next)))
(defun my/prev-error ()
  "Prev error."
  (interactive)
  (if (eq major-mode 'emacs-lisp-mode)
      (flymake-goto-prev-error)
    (lsp-bridge-diagnostic-jump-prev)))
(defun my/show-buffer-diagnostics ()
  "Show buffer diagnostics."
  (interactive)
  (if (eq major-mode 'emacs-lisp-mode)
      (flymake-show-buffer-diagnostics)
    (lsp-bridge-diagnostic-list)))

(show-paren-mode)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(provide 'init-prog)
;;; init-prog.el ends here
