(require 'ox-reveal)
(require 'htmlize)
(require 'ob-ipython)
(require 'org-caldav)
(require 'org-ref)
(require 'google-translate)
(require 'google-translate-default-ui)

;; 1. hook flyspell into org-mode
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))

(setq org-directory "~/ownCloud/org")
(setq org-default-notes-file "~/ownCloud/org/notes.org")
(setq org-caldav-save-directory "~/ownCloud/org/")
(setq org-agenda-files (quote (
                               "~/ownCloud/org/perso.org"
                               "~/ownCloud/org/pro.org"
                               "~/ownCloud/org/todo.org"
                               "~/ownCloud/org/fromperso.org"
                               "~/ownCloud/org/frompro.org"
                                )))
(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
(setq flyspell-issue-message-flag nil)
;; configuration des calendriers ;;
 (setq org-icalendar-timezone "Europe/paris")
 (setq org-caldav-url "https://ncloud.zaclys.com/remote.php/dav/calendars/21366")
 (setq org-caldav-calendars
       '(
         (:calendar-id "bertrand-simon-perso"
                       :files ("~/ownCloud/org/perso.org")
                       :inbox "~/ownCloud/org/fromperso.org")
         (:calendar-id "bertrand-simon-pro"
                      :files ("~/ownCloud/org/pro.org")
                       :inbox "~/ownCloud/org/frompro.org")
         ))
(setq org-agenda-custom-commands
      '(("P" ((tags "TIMESTAMP<=\"<now>\"")))))


;; REVEAL
(setq org-reveal-root "http://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)
                                        ; org-ref (see https://github.com/jkitchin/org-ref)
;; see org-ref for use of these variables
(setq org-ref-bibliography-notes "~/ownCloud/bibliography/notes.org"
      org-ref-default-bibliography '("~/ownCloud/bibliography/bibliography.bib")
      org-ref-pdf-directory "~/ownCloud/bibliography/pdf/")
(setq bibtex-completion-bibliography "~/ownCloud/bibliography/bibliography.bib"
      bibtex-completion-library-path "~/ownCloud/bibliography/pdf"
      bibtex-completion-notes-path "~/ownCloud/bibliography/helm-bibtex-notes")
                                        ;org-babel
;;LANGUAGES

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
