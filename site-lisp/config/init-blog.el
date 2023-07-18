;;; init-blog.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

;; https://liujiacai.net/blog/2020/12/05/hexo-to-hugo/
(defun my/hugo-newpost (slug title tags categories)
  (interactive "sSlug: \nsTitle: \nsTags: \nsCategories: ")
  (let* ((now (current-time))
         (basename (concat (format-time-string "%Y-%m-%d-" now) slug ".org"))
         (postdir (expand-file-name "~/blog/content/blog"))
         (filename (expand-file-name basename postdir))
         (create-date (format-time-string "%Y-%m-%dT%T+08:00" now)))
    (when (file-exists-p filename)
      (error "%s already exists!" filename))
    (find-file filename)
    (insert
     (format
      "#+TITLE: %s\n#+DATE: %s\n#+LASTMOD: %s\n#+TAGS[]: %s\n#+CATEGORIES[]: %s\n"
      title create-date create-date tags categories))
    (goto-char (point-max))
    (save-buffer)))

(provide 'init-blog)
;;; init-blog.el ends here
