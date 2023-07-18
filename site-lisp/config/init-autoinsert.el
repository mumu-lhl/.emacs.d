;;; init-autoinsert.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'autoinsert)
(require 'spdx)

(setq auto-insert-directory (locate-user-emacs-file "site-lisp/config/"))

(define-auto-insert
  '(emacs-lisp-mode . "Emacs Lisp")
  '("Emacs Lisp auto insert"
    ";;; " (file-name-nondirectory (buffer-file-name)) " --- " (skeleton-read "Short description: ") "-*- lexical-binding: t -*-\n\n"
    ";; Copyright (C) " (substring (current-time-string) -4) " by " user-full-name " <" user-mail-address ">" \n
    ";; " (spdx-license-format) \n \n
    ";;; Commentary:\n\n"
    ";;; Code:\n\n"
    _ \n \n
    "(provide '" (file-name-base (buffer-file-name)) ")\n"
    ";;; " (file-name-nondirectory (buffer-file-name)) " ends here"))

(auto-insert-mode)

(provide 'init-autoinsert)
;;; init-autoinsert.el ends here
