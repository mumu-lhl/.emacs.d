;;; init-mode.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(dolist (elt-cons
         '(("\\.rs\\'" . rust-ts-mode)
           ("\\.lua\\'" . lua-ts-mode)
           ("\\.vue\\'" . web-mode)
           ("\\.html?\\'" . web-mode)
           ("\\.ya?ml\\'" . yaml-ts-mode)
           ("\\.js[mx]?\\'" . js-ts-mode)
           ("\\.h\\'" . c-or-c++-ts-mode)
           ("\\.c\\'" . c-ts-mode)))
  (push elt-cons auto-mode-alist))

(setq major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (js-mode . js-ts-mode)
        (js-json-mode . json-ts-mode)
        (python-mode . python-ts-mode)
        (css-mode . css-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (c-mode . c-ts-mode)))

(provide 'init-mode)
;;; init-mode.el ends here
