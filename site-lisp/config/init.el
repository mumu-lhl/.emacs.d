;;; init.el --- My emacs config                      -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-subword-mode)

;; 增加长行处理性能
(setq bidi-inhibit-bpa t)
(setq-default bidi-paragraph-direction 'left-to-right)

;; 增加IO性能
(setq process-adaptive-read-buffering nil)
(setq read-process-output-max (* 1024 1024))

(setq
 auto-save-default nil
 confirm-kill-processes nil
 frame-inhibit-implied-resize t
 inhibit-splash-screen t
 inhibit-compacting-font-caches t
 inhibit-startup-message t
 initial-scratch-message ";; Happy hacking :)"
 make-backup-files nil
 use-file-dialog nil
 overflow-newline-into-fringe nil
 initial-major-mode 'fundamental-mode
 package-enable-at-startup nil
 use-dialog-box nil
 load-prefer-newer t
 custom-file (locate-user-emacs-file "custom.el")

 scroll-step 1
 scroll-conservatively 10000

 ring-bell-function 'ignore)
(setq-default
 fill-column 80
 cursor-in-non-selected-windows nil
 yas-verbosity 0
 warning-minimum-level
 :emergency
 bidi-display-reordering nil)

(global-visual-line-mode)
(global-word-wrap-whitespace-mode)
(kill-ring-deindent-mode)
(blink-cursor-mode -1)

(fset 'display-startup-echo-area-message 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)

(dolist (hook '(text-mode-hook prog-mode-hook))
  (add-hook hook 'auto-revert-mode))

(add-hook
 'after-init-hook
 #'(lambda ()
     (require 'init-meow)
     (require 'init-font)
     (require 'init-sort-tab)
     (require 'gcmh)

     (toggle-frame-fullscreen)))

(with-temp-message ""
  (require 'no-littering)
  (when (file-exists-p custom-file)
    (load custom-file))

  (require 'init-desktop)
  (require 'init-key)
  (require 'init-minibuffer)
  (require 'init-orderless)
  (require 'init-recentf)
  (require 'init-prog)
  (require 'init-treesit)
  (require 'init-savehist)
  (require 'init-saveplace)
  (require 'init-cns))

(run-with-idle-timer
 1 nil
 #'(lambda ()
     (with-temp-message ""
       (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
       (autoload 'web-mode "web-mode" "Web mode" t)
       (require 'find-orphan)
       (require 'init-awesome-tray)
       (require 'init-auto-save)
       (require 'init-autoinsert)
       (require 'init-blog)
       (require 'init-copyright)
       (require 'init-diff-hl)
       (require 'init-eaf)
       (require 'init-elisp)
       (require 'init-fingertip)
       (require 'init-holo-layer)
       (require 'init-insert-translated-name)
       (require 'init-lsp-bridge)
       (require 'init-mode)
       (require 'init-olivetti)
       (require 'init-org)
       (require 'init-python)
       (require 'init-rime)
       (require 'init-symbol-overlay)
       (require 'init-toggle-one-window)
       (require 'init-typst)
       (require 'init-wraplish)
       (require 'init-yas)
       (require 'init-vundo)
       (require 'recursive-search-references)
       (require 'init-key-echo))))

(provide 'init)
;;; init.el ends here
