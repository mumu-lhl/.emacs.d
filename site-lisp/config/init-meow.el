;;; init-meow.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'meow)
(require 'repeat)

(setq
 meow-use-clipboard t
 meow-cheatsheet-layout meow-cheatsheet-layout-qwerty
 meow-keypad-message nil)

(fset 'meow-quit
      (lambda ()
        (interactive)
        (if (> (1- (seq-length (window-list (selected-frame)))) 1)
            (delete-window)
          (sort-tab-select-prev-tab))))

(defvar meow-emacs-keymap (make-keymap))

(meow-define-state
 emacs
 "Meow state for interacting with emacs"
 :lighter "[P]"
 :keymap meow-emacs-keymap)

(dolist (state
         '((blink-search-mode . emacs)
           (color-rg-mode . emacs)
           (eaf-mode . emacs)
           (eshell-mode . emacs)
           (ibuffer-mode . motion)
           (inferior-emacs-lisp-mode . emacs)
           (inferior-python-mode . emacs)
           (lsp-bridge-ref-mode . emacs)
           (term-mode . emacs)
           (blackbox-mode . emacs)
           (bubbles-mode . emacs)))
  (add-to-list 'meow-mode-state-list state))

(meow-global-mode)

(provide 'init-meow)
;;; init-meow.el ends here
