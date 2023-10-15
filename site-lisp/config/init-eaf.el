;;; init-eaf.el ---                                  -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'eaf)
(require 'eaf-browser)
(require 'eaf-file-manager)
(require 'eaf-git)
(require 'eaf-image-viewer)
(require 'eaf-markdown-previewer)
(require 'eaf-music-player)
(require 'eaf-org-previewer)
(require 'eaf-pdf-viewer)
(require 'eaf-rss-reader)
(require 'eaf-js-video-player)
(require 'eaf-pyqterminal)

(defalias 'browse-web #'eaf-open-browser)

(eaf-bind-key clear_focus "<escape>" eaf-browser-keybinding)
(eaf-bind-key eaf-send-backspace-key "M-o" eaf-browser-keybinding)
(eaf-bind-key eaf-send-alt-backspace-key "C-M-o" eaf-browser-keybinding)

(eaf-bind-key eaf-send-backspace-key "M-o" eaf-pyqterminal-keybinding)
(eaf-bind-key eaf-send-alt-backspace-sequence "C-M-o" eaf-pyqterminal-keybinding)

(defun my/open-music-player ()
  "Open EAF music player."
  (interactive)
  (eaf-open (expand-file-name "~/Music/no-voice") "music-player"))

(setq
 browse-url-browser-function 'eaf-open-browser

 eaf-config-location (expand-file-name "eaf/" no-littering-var-directory)
 eaf-rebuild-buffer-after-crash nil

 eaf-find-file-ext-blacklist '("md" "org" "html" "htm")

 eaf-browser-continue-where-left-off t
 eaf-browser-default-search-engine "duckduckgo"

 eaf-webengine-download-path (expand-file-name "~/Downloads")
 eaf-webengine-font-family "Fira Code"
 eaf-webengine-font-size 18
 eaf-webengine-fixed-font-family "Fira Code"
 eaf-webengine-fixed-font-size 18

 eaf-music-extension-list '("mp3" "opus")
 eaf-music-play-order "random"

 eaf-pdf-dark-mode "force"

 eaf-pyqterminal-font-family "Fira Code"
 eaf-pyqterminal-font-size 18
 eaf-pyqterminal-cursor-type "hbar"
 eaf-pyqterminal-cursor-size 2
 eaf-pyqterminal-cursor-alpha -1
 eaf-pyqterminal-enable-bell-sound t

 eaf-file-manager-show-hidden-file nil)

(defun eaf-goto-left-tab ()
  (sort-tab-select-prev-tab))

(defun eaf-goto-right-tab ()
  (sort-tab-select-next-tab))

(defun eaf-translate-text (text)
  (popweb-dict-bing-input text))

(provide 'init-eaf)
;;; init-eaf.el ends here
