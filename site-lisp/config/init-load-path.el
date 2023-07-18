;;; init-load-path.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'cl-lib)

;; From https://github.com/manateelazycat/lazycat-emacs/blob/master/site-start.el
(defun add-subdirs-to-load-path (search-dir)
  "Add subdirs to load path."
  (interactive)
  (let* ((dir (file-name-as-directory search-dir)))
    (dolist (subdir
             ;; 过滤出不必要的目录，提升 Emacs 启动速度
             (cl-remove-if
              #'(lambda (subdir)
                  (or
                   ;; 不是目录的文件都移除
                   (not (file-directory-p (concat dir subdir)))
                   ;; 父目录、 语言相关和版本控制目录都移除
                   (member
                    subdir
                    '("."
                      ".."
                      "dist"
                      "node_modules"
                      "__pycache__"
                      "RCS"
                      "CVS"
                      "rcs"
                      "cvs"
                      ".git"
                      ".github"))))
              (directory-files dir)))
      (let ((subdir-path (concat dir (file-name-as-directory subdir))))
        ;; 目录下有 .el .so .dll 文件的路径才添加到 `load-path' 中，提升 Emacs 启动速度
        (when (cl-some
               #'(lambda (subdir-file)
                   (and (file-regular-p (concat subdir-path subdir-file))
                        ;; .so .dll 文件指非 Elisp 语言编写的 Emacs 动态库
                        (member
                         (file-name-extension subdir-file) '("el" "so" "dll"))))
               (directory-files subdir-path))

          ;; 注意：`add-to-list' 函数的第三个参数必须为 t ，表示加到列表末尾
          ;; 这样 Emacs 会从父目录到子目录的顺序搜索 Elisp 插件，顺序反过来会导致 Emacs 无法正常启动
          (add-to-list 'load-path subdir-path t))

        ;; 继续递归搜索子目录
        (add-subdirs-to-load-path subdir-path)))))

(provide 'init-load-path)
;;; init-load-path.el ends here
