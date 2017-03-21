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

(setq org-directory "~/ownCloud/org")
(setq org-default-notes-file "~/ownCloud/org/notes.org")
;; (defvar org-caldav-files  (quote (
;;                                "~/ownCloud/org/fromPerso.org"
;;                                "~/ownCloud/org/fromPro.org"
;;                                "~/ownCloud/org/perso.org"
;;                                "~/ownCloud/org/pro.org"
;;                                "~/ownCloud/org/todo-pro.org"
;;                                "~/ownCloud/org/todo-perso.org"
;;                                "~/ownCloud/org/todo-famille.org"
;;                                "~/ownCloud/org/todo-associations.org"
;;                                )))
(setq org-agenda-files (quote (
                               "~/ownCloud/org/fromPerso.org"
                               "~/ownCloud/org/fromPro.org"
                               "~/ownCloud/org/perso.org"
                               "~/ownCloud/org/pro.org"
                               "~/ownCloud/org/todo-pro.org"
                               "~/ownCloud/org/todo-perso.org"
                               "~/ownCloud/org/todo-famille.org"
                               "~/ownCloud/org/todo-associations.org"
                               )))
(setq org-icalendar-timezone "Europe/paris")
(setq org-caldav-url "https://ncloud.zaclys.com/remote.php/dav/calendars/21366")
(setq org-caldav-calendars


                                        ; clalendrier
      '(
        (:calendar-id "bertrand-simon-perso"
                      :files ("~/ownCloud/org/perso.org")
                      :inbox "~/ownCloud/org/fromPerso.org")
        (:calendar-id "bertrand-simon-pro"
                      :files ("~/ownCloud/org/pro.org")
                      :inbox "~/ownCloud/org/fromPro.org")

        (:calendar-id "pro"
                      :files ("~/ownCloud/org/todo-pro.org"))
        (:calendar-id "perso"
                      :files ("~/ownCloud/org/todo-perso.org"))
        (:calendar-id "famille"
                      :files ("~/ownCloud/org/todo-famille.org"))
        (:calendar-id "associations"
                      :files ("~/ownCloud/org/todo-associations.org"))
        ))
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
