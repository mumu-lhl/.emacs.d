;;; init-treesit.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'treesit)
(require 'no-littering)

(setq
 treesit-language-source-alist
 '((yaml . ("https://github.com/ikatyang/tree-sitter-yaml"))
   (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
   (typescript
    .
    ("https://github.com/tree-sitter/tree-sitter-typescript"
     "master"
     "typescript/src"))
   (tsx
    .
    ("https://github.com/tree-sitter/tree-sitter-typescript"
     "master"
     "tsx/src"))
   (python . ("https://github.com/tree-sitter/tree-sitter-python"))
   (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
   (css . ("https://github.com/tree-sitter/tree-sitter-css"))
   (bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
   (toml . ("https://github.com/ikatyang/tree-sitter-toml"))
   (json . ("https://github.com/tree-sitter/tree-sitter-json"))
   (elisp . ("https://github.com/Wilfred/tree-sitter-elisp")))
 treesit-extra-load-path `(,(expand-file-name "treesit" no-littering-var-directory))
 treesit-font-lock-level 4)

(add-hook 'emacs-lisp-mode-hook (lambda () (treesit-parser-create 'elisp)))

(provide 'init-treesit)
;;; init-treesit.el ends here
