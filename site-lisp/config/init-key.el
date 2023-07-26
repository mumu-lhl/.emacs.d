;;; init-key.el ---                                  -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'lazy-load)

(lazy-load-unset-keys
 '("C-x C-f"
   "C-z"
   "C-q"
   "s-T"
   "s-W"
   "s-z"
   "M-h"
   "C-x C-c"
   "s-c"
   "s-x"
   "s-v"
   "C-6"
   "M-."
   "M-,"))

;;;;;;;;;
;; Avy ;;
;;;;;;;;;
(with-eval-after-load 'init-meow
  (lazy-load-local-keys
   '((":" . avy-goto-char-2) ("\"" . avy-goto-char))
   meow-normal-state-keymap
   "avy"))

;;;;;;;;;;;;
;; Buffer ;;
;;;;;;;;;;;;
(lazy-load-set-keys '(("b i" . ibuffer)) nil "C-c")

;;;;;;;;;;;;
;; Search ;;
;;;;;;;;;;;;
(lazy-load-global-keys '(("C-c s b" . blink-search)) "init-blink-search")
(lazy-load-set-keys
 '(("s i" . isearch-forward) ("s r" . isearch-backward)) nil "C-c")
(lazy-load-global-keys
 '(("s p" . color-rg-search-input)
   ("s f" . color-rg-search-input-in-current-file))
 "init-color-rg" "C-c")
(with-eval-after-load 'init-color-rg
  (lazy-load-local-keys
   '(("h" . color-rg-jump-prev-file)
     ("l" . color-rg-jump-next-file))
   color-rg-mode-map "init-color-rg"))

;;;;;;;;;;;;;;
;; Bookmark ;;
;;;;;;;;;;;;;;
(lazy-load-set-keys '(("b l" . list-bookmarks)) nil "C-c")

;;;;;;;;;;;;;
;; Desktop ;;
;;;;;;;;;;;;;
(lazy-load-set-keys '(("f r" . desktop-read)) nil "C-c")

;;;;;;;;;
;; EAF ;;
;;;;;;;;;
(defun my/open-music-player ()
  "Open EAF music player."
  (interactive)
  (eaf-open (expand-file-name "~/Music/no-voice") "music-player"))

(lazy-load-global-keys
 '(("M-1" . eaf-open-in-file-manager)
   ("M-2" . eaf-open-file-manager))
 "init-eaf")
(lazy-load-global-keys
 '(("e b" . eaf-open-browser)
   ("e g" . eaf-open-git)
   ("e m" . my/open-music-player)
   ("e o" . eaf-open)
   ("e r" . eaf-open-rss-reader)
   ("t t" . eaf-open-pyqterminal)
   ("t y" . eaf-open-ipython))
 "init-eaf" "C-c")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Execute extended commands ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(lazy-load-set-keys '((";" . execute-extended-command)) nil "C-c")

;;;;;;;;;;;
;; Error ;;
;;;;;;;;;;;
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

(with-eval-after-load 'init-meow
  (lazy-load-set-keys
   '(("(" . my/prev-error)
     (")" . my/next-error)
     ("!" . my/show-buffer-diagnostics)
     ("~" . flymake-show-project-diagnostics))
   meow-normal-state-keymap))

;;;;;;;;;;;;
;; Format ;;
;;;;;;;;;;;;
(defun my/format ()
  "Format."
  (interactive)
  (if (eq major-mode 'emacs-lisp-mode)
      (elisp-autofmt-buffer)
    (lsp-bridge-code-format))
  (message "Done."))
(lazy-load-global-keys '(("f f" . my/format)) "" "C-c")

;;;;;;;;;;;
;; Theme ;;
;;;;;;;;;;;
(with-eval-after-load 'init-crazy-theme
  (lazy-load-set-keys '(("t r" . reload-crazy-theme)) nil "C-c"))

;;;;;;;;;;;;;;
;; Sort tab ;;
;;;;;;;;;;;;;;
(lazy-load-global-keys
 '(("C-s-2" . sort-tab-select-next-tab)
   ("C-s-1" . sort-tab-select-prev-tab)
   ("C-s-3" . sort-tab-select-first-tab)
   ("C-s-4" . sort-tab-select-last-tab)
   ("C-s-8" . sort-tab-close-current-tab))
 "init-sort-tab")

;;;;;;;;;;
;; Meow ;;
;;;;;;;;;;
(defun my/open-round ()
  "Insert open round."
  (interactive)
  (if fingertip-mode
      (fingertip-open-round)
    (insert "(")))
(defun my/open-bracket ()
  "Insert open bracket."
  (interactive)
  (if fingertip-mode
      (fingertip-open-bracket)
    (insert "[")))
(defun my/open-curly ()
  "Insert open curly."
  (interactive)
  (if fingertip-mode
      (fingertip-open-curly)
    (insert "{")))
(defun my/close-round ()
  "Insert open round."
  (interactive)
  (if fingertip-mode
      (fingertip-close-round)
    (insert ")")))
(defun my/close-bracket ()
  "Insert open bracket."
  (interactive)
  (if fingertip-mode
      (fingertip-close-bracket)
    (insert "]")))
(defun my/close-curly ()
  "Insert open curly."
  (interactive)
  (if fingertip-mode
      (fingertip-close-curly)
    (insert "}")))
(defun my/equal ()
  "Insert equal."
  (interactive)
  (if fingertip-mode
      (fingertip-equal)
    (insert "=")))
(defun my/match-paren ()
  "Insert match paren."
  (interactive)
  (if fingertip-mode
      (fingertip-match-paren 1)
    (insert "%")))
(defun my/double-quote ()
  "Insert double quote."
  (interactive)
  (if fingertip-mode
      (fingertip-double-quote)
    (insert "\"")))
(defun my/single-quote ()
  "Insert single quote."
  (interactive)
  (if fingertip-mode
      (fingertip-single-quote)
    (insert "'")))
(defun my/space ()
  "Insert space."
  (interactive)
  (if fingertip-mode
      (fingertip-space 1)
    (insert " ")))
(defun my/newline ()
  "Insert newline."
  (interactive)
  (if fingertip-mode
      (fingertip-newline 1)
    (newline-and-indent)))
(defun my/forward-word (n)
  "Forward word."
  (interactive "p")
  (if (derived-mode-p 'org-mode)
      (deno-bridge-jieba-forward-word)
    (meow-next-word n)))
(defun my/backward-word (n)
  "Backward word."
  (interactive "p")
  (if (derived-mode-p 'org-mode)
      (deno-bridge-jieba-backward-word)
    (meow-back-word n)))

(lazy-load-global-keys
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
 "init-meow" "C-c")
(with-eval-after-load 'init-meow
  (lazy-load-local-keys
   '(("0" . meow-expand-0)
     ("9" . meow-expand-9)
     ("8" . meow-expand-8)
     ("7" . meow-expand-7)
     ("6" . meow-expand-6)
     ("5" . meow-expand-5)
     ("4" . meow-expand-4)
     ("3" . meow-expand-3)
     ("2" . meow-expand-2)
     ("1" . meow-expand-1)
     ("-" . negative-argument)
     (";" . meow-reverse)
     ("," . meow-inner-of-thing)
     ("." . meow-bounds-of-thing)
     ("[" . meow-beginning-of-thing)
     ("]" . meow-end-of-thing)
     ("a" . meow-append)
     ("A" . meow-open-below)
     ("b" . my/backward-word)
     ("B" . meow-back-symbol)
     ("c" . meow-change)
     ("d" . meow-delete)
     ("D" . meow-backward-delete)
     ("e" . my/forward-word)
     ("E" . meow-next-symbol)
     ("f" . meow-find)
     ("g" . meow-cancel-selection)
     ("G" . meow-grab)
     ("h" . meow-left)
     ("H" . meow-left-expand)
     ("i" . meow-insert)
     ("I" . meow-open-above)
     ("j" . meow-next)
     ("J" . meow-next-expand)
     ("k" . meow-prev)
     ("K" . meow-prev-expand)
     ("l" . meow-right)
     ("L" . meow-right-expand)
     ("m" . meow-join)
     ("n" . meow-search)
     ("N" . my/jump-out-pair-and-newline-or-backward-kill-word)
     ("M" . my/kill-word)
     ("o" . meow-block)
     ("O" . meow-to-block)
     ("p" . meow-yank)
     ("q" . meow-quit)
     ("Q" . meow-goto-line)
     ("r" . meow-replace)
     ("R" . meow-swap-grab)
     ("s" . meow-kill)
     ("t" . meow-till)
     ("v" . meow-visit)
     ("w" . meow-mark-word)
     ("W" . meow-mark-symbol)
     ("x" . meow-line)
     ("X" . meow-goto-line)
     ("y" . meow-save)
     ("Y" . meow-sync-grab)
     ("z" . meow-pop-selection)
     ("Z" . meow-pop-grab)
     ("'" . repeat)
     ("%" . my/match-paren)
     ("RET" . my/newline)
     ("<escape>" . ignore))
   meow-normal-state-keymap "init-meow")
  (lazy-load-set-keys
   '(("(" . my/open-round)
     ("[" . my/open-bracket)
     ("{" . my/open-curly)
     (")" . my/close-round)
     ("]" . my/close-bracket)
     ("}" . my/close-curly)
     ("=" . my/equal)
     ("%" . my/match-paren)
     ("\"" . my/double-quote)
     ("'" . my/single-quote)
     ("SPC" . my/space))
   meow-insert-state-keymap)
  (lazy-load-local-keys
   '(("j" . meow-next) ("k" . meow-prev)) meow-motion-state-keymap "init-meow"))

;;;;;;;;;;;;
;; Popweb ;;
;;;;;;;;;;;;
(lazy-load-global-keys
 '(("t p" . popweb-dict-bing-pointer)
   ("t i" . popweb-dict-bing-input))
 "init-popweb" "C-c")

;;;;;;;;;;;;;;;;
;; LSP Bridge ;;
;;;;;;;;;;;;;;;;
(defun my/lsp-bridge-ret ()
  "LSP Bridge return."
  (interactive)
  (if (minibufferp)
      (exit-minibuffer)
    (newline-and-indent)))

(lazy-load-global-keys
 '(("l D" . lsp-bridge-find-def-other-window)
   ("l I" . lsp-bridge-find-impl-other-window)
   ("l T" . lsp-bridge-find-type-def-other-window)
   ("l a" . lsp-bridge-code-action)
   ("l d" . lsp-bridge-find-def)
   ("l f" . lsp-bridge-find-references)
   ("l i" . lsp-bridge-find-impl)
   ("l r" . lsp-bridge-rename)
   ("l s" . lsp-bridge-workspace-list-symbols)
   ("l t" . lsp-bridge-find-type-def)
   ("l w" . lsp-bridge-popup-documentation)
   ("l z" . lsp-bridge-find-def-return))
 "init-lsp-bridge" "C-c")
(with-eval-after-load 'init-lsp-bridge
  (lazy-load-local-keys
   '(("RET" . my/lsp-bridge-ret)
     ("TAB" . indent-for-tab-command))
   acm-mode-map "init-lsp-bridge")
  (lazy-load-local-keys
   '(("h" . lsp-bridge-ref-jump-prev-file)
     ("l" . lsp-bridge-ref-jump-next-file))
   lsp-bridge-ref-mode-map "init-lsp-bridge"))

;;;;;;;;;;;;
;; Window ;;
;;;;;;;;;;;;
(lazy-load-set-keys
 '(("C-s-5" . other-window)
   ("C-s-q" . quit-window)
   ("C-s-y" . toggle-one-window)))

;;;;;;;;;;
;; Quit ;;
;;;;;;;;;;
(lazy-load-set-keys '(("q q" . kill-emacs) ("q r" . restart-emacs)) nil "C-c")

;;;;;;;;;;
;; Help ;;
;;;;;;;;;;
(lazy-load-global-keys
 '(("C-f" . helpful-function)
   ("C-m" . helpful-macro)
   ("C-s" . helpful-symbol)
   ("k" . helpful-key)
   ("v" . helpful-variable))
 "init-helpful" "C-h")
(lazy-load-global-keys '(("q h" . helpful-kill-buffers)) "init-helpful" "C-c")

;;;;;;;;;;;
;; Undo ;;
;;;;;;;;;;;
(with-eval-after-load 'init-meow
  (lazy-load-local-keys '(("u" . vundo)) meow-normal-state-keymap "init-vundo")
  (lazy-load-set-keys '(("U" . undo-only)) meow-normal-state-keymap))

;;;;;;;;;
;; Org ;;
;;;;;;;;;
(lazy-load-set-keys '(("o c" . org-capture)) nil "C-c")

;;;;;;;;;;;;;;;
;; Icomplete ;;
;;;;;;;;;;;;;;;
(with-eval-after-load 'icomplete
  (lazy-load-set-keys
   '(("C-n" . icomplete-forward-completions)
     ("C-p" . icomplete-backward-completions))
   icomplete-fido-mode-map))

;;;;;;;;;;;;;
;; Webjump ;;
;;;;;;;;;;;;;
(lazy-load-global-keys '(("C-c w j" . webjump)) "init-webjump")

;;;;;;;;;;;;;;;;;;;;
;; Symbol Overlay ;;
;;;;;;;;;;;;;;;;;;;;
(lazy-load-global-keys
 '(("C-c s o" . symbol-overlay-put)) "init-symbol-overlay")

;;;;;;;;;;;;;;;
;; Fingertip ;;
;;;;;;;;;;;;;;;
(defun my/kill ()
  "Kill."
  (interactive)
  (if fingertip-mode
      (fingertip-kill)
    (kill-line)))
(defun my/backward-delete ()
  "Backward delete."
  (interactive)
  (if fingertip-mode
      (fingertip-backward-delete)
    (backward-delete-char-untabify 1)))
(defun my/forward-delete ()
  "Forward delete."
  (interactive)
  (if fingertip-mode
      (fingertip-forward-delete)
    (backward-delete-char-untabify -1)))
(defun my/jump-out-pair-and-newline-or-backward-kill-word ()
  "Jump out pair and newline or backward kill word."
  (interactive)
  (if (derived-mode-p 'org-mode)
      (deno-bridge-jieba-backward-kill-word)
    (fingertip-jump-out-pair-and-newline)
    (meow-insert-mode)))
(defun my/kill-word ()
  "Kill word."
  (interactive)
  (deno-bridge-jieba-kill-word))

(lazy-load-set-keys '(("C-k" . my/kill) ("C-d" . my/forward-delete)))
(lazy-load-set-keys '(("DEL" . my/backward-delete)))
(lazy-load-set-keys '(("DEL" . my/backward-delete)) lisp-mode-shared-map)
(with-eval-after-load 'python
  (lazy-load-set-keys '(("DEL" . my/backward-delete)) python-ts-mode-map))

(provide 'init-key)
;;; init-key.el ends here
