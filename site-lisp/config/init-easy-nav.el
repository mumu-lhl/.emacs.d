;;; init-easy-nav.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;; https://github.com/manateelazycat/lazycat-emacs/blob/master/site-lisp/config/init-easy-nav.el

;;; Code:

(require 'popweb)
(require 'init-lsp-bridge)
(require 'color-rg)
(require 'init-thing-edit)

(defvar easy-nav-map nil
  "Keymap used when popup is shown.")

(setq easy-nav-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "j") #'next-line)
        (define-key map (kbd "k") #'previous-line)
        (define-key map (kbd "J") #'scroll-up-one-line)
        (define-key map (kbd "K") #'scroll-down-one-line)
        (define-key map (kbd "g") #'beginning-of-buffer)
        (define-key map (kbd "G") #'end-of-buffer)
        (define-key map (kbd "h") #'backward-char)
        (define-key map (kbd "l") #'forward-char)
        (define-key map (kbd "H") #'backward-word)
        (define-key map (kbd "L") #'forward-word)
        (define-key map (kbd "c") #'one-key-menu-thing-edit)
        (define-key map (kbd "e") #'scroll-down)
        (define-key map (kbd "SPC") #'scroll-up)
        (define-key map (kbd "s") #'color-rg-search-symbol)
        (define-key map (kbd "i") #'color-rg-search-input)
        (define-key map (kbd ",") #'color-rg-search-symbol-in-current-file)
        (define-key map (kbd ".") #'color-rg-search-input-in-current-file)
        (define-key map (kbd "<") #'remember-init)
        (define-key map (kbd ">") #'remember-jump)
        (define-key map (kbd "7") #'lsp-bridge-jump-back)
        (define-key map (kbd "8") #'easy-nav-jump)
        (define-key map (kbd "9") #'lsp-bridge-popup-documentation)
        (define-key map (kbd ";") #'popweb-dict-bing-input)
        (define-key map (kbd "y") #'popweb-dict-bing-pointer)
        (define-key map (kbd "q") #'easy-nav-exist)
        map))

(define-minor-mode easy-nav-mode
  "Easy navigator."
  :keymap easy-nav-map
  :init-value nil)

(defun easy-nav-enter ()
  (interactive)
  (read-only-mode 1)
  (easy-nav-mode 1)
  (message "Enter easy navigator."))

(defun easy-nav-exist ()
  (interactive)
  (read-only-mode -1)
  (easy-nav-mode -1)
  (message "Exit easy navigator."))

(defun easy-nav-jump ()
  (interactive)
  (lsp-bridge-jump)
  (easy-nav-enter))

(provide 'init-easy-nav)
;;; init-easy-nav.el ends here
