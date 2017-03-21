(require 'ox-reveal)
(require 'htmlize)
(require 'ob-ipython)
(require 'org-caldav)

;; 1. hook flyspell into org-mode
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))

(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
(setq flyspell-issue-message-flag nil)

;; configuration des calendriers ;;
(setq org-caldav-save-directory "~/ownCloud/org")
(setq org-directory "~/ownCloud/org")
(setq org-default-notes-file "~/ownCloud/org/notes.org")
(setq org-agenda-files (quote (
                               "~/ownCloud/org/perso.org"
                               "~/ownCloud/org/pro.org"
                               "~/ownCloud/org/todo.org"
                                )))
(setq org-caldav-files (quote (
                               "~/ownCloud/org/perso.org"
                               "~/ownCloud/org/pro.org"
                               "~/ownCloud/org/todo.org"
                                )))
(setq org-caldav-inbox (quote (
                               "~/ownCloud/org/perso.org"
                               "~/ownCloud/org/pro.org"
                               "~/ownCloud/org/todo.org"
                                )))
(setq org-agenda-files (quote (
                               "~/ownCloud/org/perso.org"
                               "~/ownCloud/org/pro.org"
                               "~/ownCloud/org/todo.org"
                                )))
(setq org-icalendar-timezone "Europe/paris")
(setq org-caldav-url "https://ncloud.zaclys.com/remote.php/dav/calendars/21366")
(setq org-caldav-calendars  ; clalendriers
      (quote(
        (:calendar-id "bertrand-simon-perso"
                      :files ("~/ownCloud/org/perso.org")
                      :inbox ("~/ownCloud/org/perso.org"))
        (:calendar-id "bertrand-simon-pro"
                      :files ("~/ownCloud/org/pro.org")
                      :inbox ("~/ownCloud/org/pro.org"))

        (:calendar-id "pro"
                      :files ("~/ownCloud/org/todo.org" "professionnel")
                      :inbox ("~/ownCloud/org/todo.org" "profesionnel"))
        (:calendar-id "perso"
                      :files ("~/ownCloud/org/todo.org" "personnel")
                      :inbox ("~/ownCloud/org/todo.org" "personnel"))
        (:calendar-id "famille"
                      :files ("~/ownCloud/org/todo.org" "famille")
                      :inbox ("~/ownCloud/org/todo.org" "famille"))
        (:calendar-id "emacs"
                      :files ("~/ownCloud/org/todo.org" "emacs")
                      :inbox ("~/ownCloud/org/todo.org" "emacs"))
        (:calendar-id "associations"
                      :files ("~/ownCloud/org/todo.org" "associations")
                      :inbox ("~/ownCloud/org/todo.org" "associations"))
        )))
(setq org-agenda-custom-commands
      '(("P" ((tags "TIMESTAMP<=\"<now>\"")))))

                                        ;capture templates
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
