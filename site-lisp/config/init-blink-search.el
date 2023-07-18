;;; init-blink-search.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'blink-search)

(setq
 blink-search-db-path
 (expand-file-name "blink-search.db" no-littering-var-directory)
 blink-search-history-path (expand-file-name "blink-search/history.txt" no-littering-var-directory)
 blink-search-search-backends
 '("Buffer List"
   "Find File"
   "Elisp Symbol"
   "Recent File"
   "IMenu"
   "EAF Browser"))

(provide 'init-blink-search)
;;; init-blink-search.el ends here
