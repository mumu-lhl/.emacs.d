;;; init-fingertip.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'fingertip)

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

(meow-define-keys
 'insert
 '("(" . my/open-round)
 '("[" . my/open-bracket)
 '("{" . my/open-curly)
 '(")" . my/close-round)
 '("]" . my/close-bracket)
 '("}" . my/close-curly)
 '("=" . my/equal)
 '("%" . my/match-paren)
 '("\"" . my/double-quote)
 '("'" . my/single-quote)
 '("SPC" . my/space))

(dolist (hook
         '(python-ts-mode-hook
           emacs-lisp-mode-hook
           rust-ts-mode-hook
           css-ts-mode-hook
           toml-ts-mode-hook
           yaml-ts-mode-hook
           json-ts-mode-hook
           js-ts-mode-hook
           typescript-ts-mode-hook
           bash-ts-mode-hook
           toml-ts-mode-hook))
  (add-hook hook #'fingertip-mode))

(provide 'init-fingertip)
;;; init-fingertip.el ends here
