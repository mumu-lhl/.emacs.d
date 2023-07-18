;;; init-python.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'python)

(setq-default
 python-indent-offset 4
 python-indent-guess-indent-offset nil
 python-indent-guess-indent-offset-verbose nil)

(provide 'init-python)
;;; init-python.el ends here
