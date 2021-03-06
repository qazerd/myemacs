(require 'ox-reveal)
(require 'htmlize)
(require 'ob-ipython)
;(require 'org-caldav)
;(require 'org-gcal)
(require 'org-ref)
(require 'google-translate)
(require 'google-translate-default-ui)
(require 'org-bullets)
;(require 'org-mu4e)
;(require 'org-latex)
(require 'org-protocol)

(server-start)

(set-fontset-font "fontset-default" nil 
                  (font-spec :size 20 :name "Symbola"))

(set-face-attribute
 'default nil :stipple nil :height 130 :width 'normal :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant 'normal :weight 'light :foundry "outline" :family "DejaVu Sans Mono for Powerline")

(setq utf-translate-cjk-mode nil)
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

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

(require 'org-bullets)

(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq org-bullets-bullet-list '("✙" "♱" "♰" "☥" "✞" "✟" "✝" "†" "✠" "✚" "✜" "✛" "✢" "✣" "✤" "✥"))

(setq org-ellipsis " ➤➤➤")

(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
;(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))

(setq org-file-apps (append '(("\\.pdf\\'" . "okular %s")) org-file-apps ))

(setq org-reveal-root "/home/bs/Applications/reveal/reveal.js")
(use-package ox-reveal
:ensure ox-reveal)
(use-package htmlize
:ensure t)

(setq org-ref-bibliography-notes "~/ownCloud/Documents/Recherche/bibliography/notes.org"
      org-ref-default-bibliography '("~/ownCloud/Documents/Recherche/bibliography/my.bib")
      org-ref-default-bibliography '("~/ownCloud/Documents/Recherche/bibliography/my.bib")
      org-ref-pdf-directory "~/ownCloud/Documents/Recherche/bibliography/pdf/")
(setq bibtex-completion-bibliography "~/ownCloud/Documents/Recherche/bibliography/my.bib"
      bibtex-completion-library-path "~/ownCloud/Documents/Recherche/bibliography/pdf"
      bibtex-completion-notes-path "~/ownCloud/Documents/Recherche/bibliography/helm-bibtex-notes")

(with-eval-after-load 'org
(org-babel-do-load-languages
'org-babel-load-languages
'(
(ipython . t)
(latex . t)
(emacs-lisp .t)
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
   )))

(with-eval-after-load 'ob-ipython
  (setq org-babel-python-command "Users/user/anaconda3/bin/pythonw3"))
