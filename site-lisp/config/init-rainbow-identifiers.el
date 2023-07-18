;;; init-rainbow-identifiers.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'rainbow-identifiers)

(add-hook 'prog-mode-hook 'rainbow-identifiers)

(provide 'init-rainbow-identifiers)
;;; init-rainbow-identifiers.el ends here
