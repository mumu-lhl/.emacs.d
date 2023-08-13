;;; init-holo-layer.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'holo-layer)

(setq
 holo-layer-enable-cursor-animation t
 holo-layer-hide-mode-line t
 holo-layer-show-place-info-p t
 holo-layer-place-info-font-size 13)

(holo-layer-enable)

(provide 'init-holo-layer)
;;; init-holo-layer.el ends here
