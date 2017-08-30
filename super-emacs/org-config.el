(require 'ox-reveal)
(require 'htmlize)
(require 'ob-ipython)
(require 'org-caldav)
(require 'org-ref)
(require 'google-translate)
(require 'google-translate-default-ui)
(require 'org-bullets)
(require 'org-mu4e)
;; *. Beautifying emacs org-mode (https://zhangda.wordpress.com/2016/02/15/configurations-for-beautifying-emacs-org-mode/)
;; set the fall-back font
;; this is critical for displaying various unicode symbols, such as those used in my init-org.el settings
;; http://endlessparentheses.com/manually-choose-a-fallback-font-for-unicode.html
(set-fontset-font "fontset-default" nil 
                  (font-spec :size 20 :name "Symbola"))

;; Setting English Font
(set-face-attribute
 'default nil :stipple nil :height 130 :width 'normal :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant 'normal :weight 'light :foundry "outline" :family "DejaVu Sans Mono for Powerline")

;; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(setq utf-translate-cjk-mode nil)

(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; 1. hook flyspell into org-mode
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))

(setq org-directory "~/ownCloud/org")
(setq org-default-notes-file "~/ownCloud/org/notes.org")
(setq org-caldav-save-directory "~/ownCloud/org/")
(setq org-agenda-files (quote (
                               "~/ownCloud/org/todo.org"
                                )))
(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
(setq flyspell-issue-message-flag nil)
;; configuration des calendriers ;;
 (setq org-icalendar-timezone "Europe/paris")
 (setq org-caldav-url "https://ncloud.zaclys.com/remote.php/dav/calendars/21366")
 ;; (setq org-caldav-calendars
 ;;       '(
 ;;         (:calendar-id "bertrand-simon-perso"
 ;;                       :files ("~/ownCloud/org/perso.org")
 ;;                       :inbox "~/ownCloud/org/fromperso.org")
 ;;         (:calendar-id "bertrand-simon-pro"
 ;;                      :files ("~/ownCloud/org/pro.org")
 ;;                       :inbox "~/ownCloud/org/frompro.org")
 ;;         ))
(setq org-agenda-custom-commands
      '(("P" ((tags "TIMESTAMP<=\"<now>\"")))))


;; REVEAL
(setq org-reveal-root "")
(setq org-reveal-mathjax t)

;; org-ref (see https://github.com/jkitchin/org-ref)
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
   (latex . t)
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
