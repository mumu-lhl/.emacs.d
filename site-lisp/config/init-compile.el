;;; init-compile.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(load (locate-user-emacs-file "site-lisp/config/init-load-path.el"))

(require 'cl-lib)
(require 'bytecomp)
(require 'init-load-path)

(defun compile-byte-elisp-files (search-dir)
  "Compile elisp files.
SEARCH-DIR search dir."
  (dolist (file
           (directory-files (file-name-as-directory search-dir) t "\\.el$"))
    (or (member
         (file-name-base file)
         '("blink-search-current-buffer" "blink-search-grep-file"))
        (batch-byte-compile-file file)))
  (dolist (subdir
           (cl-remove-if
            #'(lambda (subdir)
                (or (not
                     (file-directory-p (expand-file-name subdir search-dir)))
                    (member
                     subdir
                     '("."
                       ".."
                       "node_modules"
                       "__pycache__"
                       ".git"
                       ".github"
                       "css"
                       "js"
                       "dist"
                       "assets"
                       "img"
                       "screenshot"
                       "langserver"
                       "multiserver"
                       "test"
                       "tests"))))
            (directory-files search-dir)))
    (compile-byte-elisp-files
     (concat (file-name-as-directory search-dir) subdir))))

(defun compile-byte-all-submodules ()
  "Compile all byte submodules."
  (with-temp-message ""
    (let* ((extensions-dir (locate-user-emacs-file "site-lisp/extensions/"))
           (dirs (directory-files extensions-dir)))
      (dolist (dir
               (cl-remove-if
                #'(lambda (subdir)
                    (member
                     subdir
                     '("."
                       ".."
                       "auto-save"
                       "awesome-tray")))
                dirs))
        (compile-byte-elisp-files (expand-file-name dir extensions-dir))))))

(let ((gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 1))
  (when (fboundp 'startup-redirect-eln-cache)
    (startup-redirect-eln-cache
     (convert-standard-filename (locate-user-emacs-file "var/eln-cache/"))))

  (add-subdirs-to-load-path (locate-user-emacs-file "site-lisp"))

  (require 'no-littering))

(provide 'init-compile)
;;; init-compile.el ends here
