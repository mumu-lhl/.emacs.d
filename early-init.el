;;; early-init.el --- My emacs config                -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(load (locate-user-emacs-file "site-lisp/config/init-load-path.el"))
(require 'init-load-path)

(let ((gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 1)
      (file-name-handler-alist nil))
  (when (fboundp 'startup-redirect-eln-cache)
    (startup-redirect-eln-cache
     (convert-standard-filename (locate-user-emacs-file "var/eln-cache/"))))

  (add-subdirs-to-load-path (locate-user-emacs-file "site-lisp"))
  (require 'init))

(provide 'early-init)
;;; early-init.el ends here
