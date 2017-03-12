(require 'ox-reveal)
(require 'htmlize)
(require 'ob-ipython)

;; 1. hook flyspell into org-mode
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
(setq flyspell-issue-message-flag nil)
(setq org-directory "~/ownCloud/org")
(setq org-default-notes-file "~/ownCloud/org/notes.org")
(setq org-agenda-files "~/ownCloud/org/todo.org")
(setq org-mobile-directory "~/ownCloud/org")
(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
;capture templates
(setq org-capture-templates
      (quote
       (("t" "My TODO task format." entry
         (file "todo.org")
         "* TODO %?
SCHEDULED: %t"))))

(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (ipython . t)
   ;(R . t)
   ;(org . t)
   ;(ditaa . t)
   ;(latex . t)
   ;(dot . t)
   ;(emacs-lisp . t)
   ;(gnuplot . t)
   ;(screen . nil)
   ;(shell . t)
   ;(sql . nil)
   ;(sqlite . t)
   ;; other languages..
   ))
