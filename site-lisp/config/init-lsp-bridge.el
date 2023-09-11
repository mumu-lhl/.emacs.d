;;; init-lsp-bridge.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'lsp-bridge)

(setq
 acm-enable-quick-access t
 acm-enable-yas nil
 acm-enable-tabnine nil
 acm-backend-codeium-api-key-path "/home/mumulhl/.emacs.d/etc/lsp-bridge/codeium_api_key.txt"
 lsp-bridge-symbols-enable-which-func t
 lsp-bridge-code-action-enable-popup-menu nil
 lsp-bridge-completion-hide-characters '(":" ";" "(" ")" "[" "]" "{" "}" "," "\"" "@")
 lsp-bridge-enable-org-babel t
 lsp-bridge-signature-help-fetch-idle 0.1)

(setq lsp-bridge-get-project-path-by-filepath
      (lambda (filepath)
        (when (string-prefix-p (expand-file-name "site-lisp/extensions/emacs-application-framework/app")
                               (expand-file-name filepath))
          (expand-file-name "site-lisp/extensions/emacs-application-framework/"))))

(defun my/lsp-bridge-ret ()
  "LSP Bridge return."
  (interactive)
  (if (minibufferp)
      (exit-minibuffer)
    (newline-and-indent)))

(lazy-load-set-keys
 '(("RET" . my/lsp-bridge-ret)
   ("TAB" . indent-for-tab-command))
 acm-mode-map)

(lazy-load-set-keys
 '(("h" . lsp-bridge-ref-jump-prev-file)
   ("l" . lsp-bridge-ref-jump-next-file))
 lsp-bridge-ref-mode-map)

(global-lsp-bridge-mode)

(provide 'init-lsp-bridge)
;;; init-lsp-bridge.el ends here
