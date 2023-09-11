;;; init-org.el --- -*- lexical-binding: t -*-

;; Copyright (C) 2023 by Mumulhl <mumulhl@duck.com>
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:

;;; Code:

(require 'org)
(require 'org-appear)
(require 'org-capture)
(require 'org-modern)
(require 'org-src)
(require 'ox)
(require 'ox-html)

(require 'valign)

(setq
 org-capture-templates
 '(("t"
    "Tasks"
    entry
    (file+headline "tasks.org" "Reminders")
    "* TODO %i%?"
    :empty-lines-after 1
    :prepend t))
 org-appear-autolinks t
 org-appear-autosubmarkers t
 org-appear-autoentities t
 org-appear-autoemphasis t
 org-appear-autokeywords t
 org-appear-inside-latex t)

(defun my/org-prettify-symbols ()
  (setq prettify-symbols-alist
        (mapcan
         (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
         '(("[ ]" . 9744)
           ("[X]" . 9745)
           ("[-]" . 8863)
           ("#+begin_src" . 9998)
           ("#+end_src" . 9633)
           ("#+begin_example" . 129083)
           ("#+end_example" . 129081)
           ("#+results:" . 9776)
           ("#+attr_latex:" . "🄛")
           ("#+attr_html:" . "🄗")
           ("#+attr_org:" . "🄞")
           ("#+name:" . "🄝")
           ("#+caption:" . "🄒")
           ("#+date:" . "📅")
           ("#+author:" . "💁")
           ("#+setupfile:" . 128221)
           ("#+email:" . 128231)
           ("#+startup:" . 10034)
           ("#+options:" . 9965)
           ("#+title:" . 10162)
           ("#+subtitle:" . 11146)
           ("#+downloaded:" . 8650)
           ("#+language:" . 128441)
           ("#+begin_quote" . 187)
           ("#+end_quote" . 171)
           ("#+begin_results" . 8943)
           ("#+end_results" . 8943)))))

(setq
 org-blank-before-new-entry '((heading . t) (plain-list-item . auto))
 org-default-notes-file (expand-file-name "capture.org" org-directory)
 org-fontify-whole-heading-line t
 org-ellipsis " ▾"
 org-loop-over-headlines-in-active-region t
 org-fontify-todo-headline t
 org-fontify-done-headline t
 org-fontify-quote-and-verse-blocks t
 org-hide-macro-markers t
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-indent-mode-turns-on-hiding-stars t
 org-startup-indented nil
 org-adapt-indentation nil
 org-startup-with-inline-images t
 org-startup-folded 'overview
 org-list-allow-alphabetical t
 org-list-demote-modify-bullet '(("-" . "+") ("+" . "1.") ("1." . "a."))
 org-fold-catch-invisible-edits 'smart
 org-insert-heading-respect-content nil
 org-image-actual-width nil
 org-imenu-depth 4
 org-return-follows-link t
 org-clone-delete-id t
 org-yank-adjusted-subtrees t
 org-use-fast-todo-selection 'expert
 org-enforce-todo-dependencies t
 org-enforce-todo-checkbox-dependencies t
 org-priority-faces '((?A :foreground "red") (?B :foreground "orange") (?C :foreground "yellow"))
 org-global-properties
 '(("EFFORT_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00")
   ("APPT_WARNTIME_ALL" . "0 5 10 15 20 25 30 45 60")
   ("RISK_ALL" . "Low Medium High")
   ("STYLE_ALL" . "habit"))
 org-columns-default-format "%25ITEM %TODO %SCHEDULED %DEADLINE %3PRIORITY %TAGS %CLOCKSUM %EFFORT{:}"
 org-closed-keep-when-no-todo t
 org-log-done 'time
 org-log-repeat 'time
 org-log-redeadline 'note
 org-log-reschedule 'note
 org-log-into-drawer t
 org-log-state-notes-insert-after-drawers nil

 org-refile-use-cache t
 org-refile-targets '((org-agenda-files . (:maxlevel . 9)))
 org-refile-use-outline-path 'file
 org-outline-path-complete-in-steps nil
 org-refile-allow-creating-parent-nodes 'confirm

 org-auto-align-tags t
 org-use-tag-inheritance nil
 org-agenda-use-tag-inheritance nil
 org-use-fast-tag-selection t
 org-fast-tag-selection-single-key t
 org-track-ordered-property-with-tag t

 org-archive-location "%s_archive::datetree/"

 ;; org-src
 org-src-lang-modes
 '(("C" . c)
   ("C++" . c++)
   ("asymptote" . asy)
   ("bash" . sh)
   ("beamer" . latex)
   ("calc" . fundamental)
   ("cpp" . c++)
   ("desktop" . conf-desktop)
   ("ditaa" . artist)
   ("dot" . fundamental)
   ("elisp" . emacs-lisp)
   ("mysql" . sql)
   ("ocaml" . tuareg)
   ("python" . python)
   ("screen" . shell-script)
   ("shell" . sh)
   ("sqlite" . sql)
   ("toml" . conf-toml))
 org-babel-load-languages
 '((C . t)
   (awk . t)
   (calc . t)
   (css . t)
   (emacs-lisp . t)
   (eshell . t)
   (shell . t)
   (sql . t)
   (python . t))

 ;; ox
 org-export-with-smart-quotes t
 org-export-coding-system 'utf-8
 org-export-with-broken-links 'mark
 org-export-default-language "zh-TW"
 org-export-global-macros '(("timestamp" . "@@html:<span class=\"timestamp\">[$1]</span>@@"))

 ;; ox-html
 org-html-doctype "html5"
 org-html-html5-fancy t
 org-html-checkbox-type 'unicode
 org-html-validation-link nil)

(dolist (hook '(org-mode-hook org-agenda-finalize-hook))
  (add-hook hook 'org-modern-mode))
(dolist (mode '(org-appear-mode my/org-prettify-symbols valign-mode))
  (add-hook 'org-mode-hook mode))

(provide 'init-org)
;;; init-org.el ends here
