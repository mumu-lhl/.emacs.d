;;; init-minibuffer.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'icomplete)
(require 'smex)

(fido-mode)
(smex-initialize)

;; https://github.com/manateelazycat/lazycat-emacs/blob/master/site-lisp/config/init-smex.el
(defun smex+ ()
  (interactive)
  (let ((resize-mini-windows nil))
    (smex)))

(provide 'init-minibuffer)
;;; init-minibuffer.el ends here
