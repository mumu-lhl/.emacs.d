;;; init-holo-layer.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'holo-layer)

(setq
 holo-layer-hide-mode-line t
 holo-layer-enable-place-info t
 holo-layer-enable-window-border t
 holo-layer-enable-smooth-cursor t
 holo-layer-enable-cursor-animation t
 holo-layer-cursor-animation-type "jelly easing"
 holo-layer-place-info-font-size 13)

;; (holo-layer-enable)

(provide 'init-holo-layer)
;;; init-holo-layer.el ends here
