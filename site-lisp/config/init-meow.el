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

(meow-define-keys
 'normal
 '("(" . my/prev-error)
 '(")" . my/next-error)
 '("!" . my/show-buffer-diagnostics)
 '("~" . flymake-show-project-diagnostics)
 '("0" . meow-expand-0)
 '("9" . meow-expand-9)
 '("8" . meow-expand-8)
 '("7" . meow-expand-7)
 '("6" . meow-expand-6)
 '("5" . meow-expand-5)
 '("4" . meow-expand-4)
 '("3" . meow-expand-3)
 '("2" . meow-expand-2)
 '("1" . meow-expand-1)
 '("-" . negative-argument)
 '(";" . meow-reverse)
 '("," . meow-inner-of-thing)
 '("." . meow-bounds-of-thing)
 '("[" . meow-beginning-of-thing)
 '("]" . meow-end-of-thing)
 '("a" . meow-append)
 '("A" . meow-open-below)
 '("b" . meow-back-word)
 '("B" . meow-back-symbol)
 '("c" . meow-change)
 '("d" . meow-delete)
 '("D" . meow-backward-delete)
 '("e" . meow-next-word)
 '("E" . meow-next-symbol)
 '("f" . meow-find)
 '("g" . meow-cancel-selection)
 '("G" . meow-grab)
 '("h" . meow-left)
 '("H" . meow-left-expand)
 '("i" . meow-insert)
 '("I" . meow-open-above)
 '("j" . meow-next)
 '("J" . meow-next-expand)
 '("k" . meow-prev)
 '("K" . meow-prev-expand)
 '("l" . meow-right)
 '("L" . meow-right-expand)
 '("m" . meow-join)
 '("n" . meow-search)
 '("N" . my/jump-out-pair-and-newline-or-backward-kill-word)
 '("o" . meow-block)
 '("O" . meow-to-block)
 '("p" . meow-yank)
 '("q" . meow-quit)
 '("Q" . meow-goto-line)
 '("r" . meow-replace)
 '("R" . meow-swap-grab)
 '("s" . meow-kill)
 '("t" . meow-till)
 '("v" . meow-visit)
 '("w" . meow-mark-word)
 '("W" . meow-mark-symbol)
 '("x" . meow-line)
 '("X" . meow-goto-line)
 '("y" . meow-save)
 '("Y" . meow-sync-grab)
 '("z" . meow-pop-selection)
 '("Z" . meow-pop-grab)
 '("'" . repeat)
 '("%" . my/match-paren)
 '("RET" . my/newline)
 '("<escape>" . ignore))

(meow-define-keys 'motion '("j" . meow-next) '("k" . meow-prev))

(lazy-load-set-keys
 '(("/" . meow-keypad-describe-key)
   ("?" . meow-cheatsheet)
   ("1" . meow-digit-argument)
   ("2" . meow-digit-argument)
   ("3" . meow-digit-argument)
   ("4" . meow-digit-argument)
   ("5" . meow-digit-argument)
   ("6" . meow-digit-argument)
   ("7" . meow-digit-argument)
   ("8" . meow-digit-argument)
   ("9" . meow-digit-argument)
   ("0" . meow-digit-argument))
 nil "C-c")

(meow-global-mode)

(provide 'init-meow)
;;; init-meow.el ends here
