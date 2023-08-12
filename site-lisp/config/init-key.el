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
   ("e h" . eaf-git-show-history)
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
  (fingertip-jump-out-pair-and-newline)
  (meow-insert-mode))

(lazy-load-set-keys '(("C-k" . my/kill) ("C-d" . my/forward-delete)))
(lazy-load-set-keys '(("DEL" . my/backward-delete)))
(lazy-load-set-keys '(("DEL" . my/backward-delete)) lisp-mode-shared-map)
(with-eval-after-load 'python
  (lazy-load-set-keys '(("DEL" . my/backward-delete)) python-ts-mode-map))

(provide 'init-key)
;;; init-key.el ends here
