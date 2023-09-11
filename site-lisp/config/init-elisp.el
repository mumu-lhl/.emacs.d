;;; init-elisp.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(add-hook
 'emacs-lisp-mode-hook
 #'(lambda ()
     (require 'eldoc)
     (require 'eldoc-extension)

     (setq eldoc-idle-delay 0.1)))

(provide 'init-elisp)
;;; init-elisp.el ends here
