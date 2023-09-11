;;; init-webjump.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'webjump)

(dolist (link
         '(("Github" . [simple-query "github.com" "github.com/search?q=" ""])
           ("Ruanyifeng" . [simple-query "ruanyifeng.com" "duckduckgo.com/?q=" " site:ruanyifeng.com"])))
  (add-to-list 'webjump-sites link))

(provide 'init-webjump)
;;; init-webjump.el ends here
