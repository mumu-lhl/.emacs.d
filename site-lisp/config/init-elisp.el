;;; init-elisp.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'elisp-autofmt)

(setq elisp-autofmt-cache-directory
      (concat no-littering-var-directory "elisp-autofmt-cache"))

(add-hook
 'emacs-lisp-mode-hook
 #'(lambda ()
     (require 'eldoc)
     (require 'eldoc-extension)

     (setq eldoc-idle-delay 0.1)))

(provide 'init-elisp)
;;; init-elisp.el ends here
