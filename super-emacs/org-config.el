(require 'ox-reveal)
(require 'htmlize)
(require 'ob-ipython)

;(require 'org-caldav)
(require 'org-gcal)
(require 'org-ref)
(require 'google-translate)
(require 'google-translate-default-ui)
(require 'org-bullets)
(require 'org-mu4e)
;(require 'org-latex)

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
                               "~/ownCloud/Documents/Teachbook/teachnotes.org"
                               "~/ownCloud/Documents/Labbook/labnotes.org"
                               "~/ownCloud/org/gcal.org"
                               "~/ownCloud/org/todo.org"
                               "~/ownCloud/org/schedule.org"
                                )))
(setq org-confirm-babel-evaluate nil)   ;don't prompt me to confirm everytime I want to evaluate a block
(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CANCELED")))
(setq flyspell-issue-message-flag nil)
;; configuration des calendriers ;;
 (setq package-check-signature nil)


(setq org-gcal-client-id "949586297211-efks3vf8m9rb5vavrl47earqg65t16ub.apps.googleusercontent.com"
      org-gcal-client-secret "4ykiLGSST07WBMFzDj31NdEx"
      org-gcal-file-alist '(("bertrand.simon@uha.fr" .  "~/ownCloud/org/gcal.org")))
(setq org-agenda-files (list "~/ownCloud/org/gcal.org"
			     "~/ownCloud/org/todo.org"
			     "~/ownCloud/org/schedule.org"))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync)))


(setq org-agenda-custom-commands
      '(("P" ((tags "TIMESTAMP<=\"<now>\"")))))
(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
	 ((agenda "")
	  (alltodo "")))))


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
  (with-eval-after-load 'org
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
                                        (shell . t)
                                        ;(sql . nil)
                                        ;(sqlite . t)
   ;; other languages..
   )))
(setq org-latex-pdf-process '("pdflatex -interaction nonstopmode %f" "biber %b" "pdflatex -interaction nonstopmode %f" "pdflatex -interaction nonstopmode --synctex=-1 %f"))
(setq org-latex-create-formula-image-program 'imagemagick)
(setq org-src-fontify-natively t
      org-export-latex-listings t
      org-export-latex-packages-alist 
      '(("" "graphicx")
	("" "longtable")
	("" "wrapfig")
	("" "soul")
	("" "hyperref")
	("latin1" "inputenc")
	("a4" "")
	("" "fancyheadings")
	("" "palatino")
	("frenchb" "babel")
	("french" "varioref")
	("" "float")
	("" "lastpage")
	("" "color")
	("osf,sc" "mathpazo")
	("" "MnSymbol")
	("babel=true" "microtype")
	("" "marvosym")))

(setq org-export-latex-template 
      "\\documentclass[a4paper,oneside]{scrartcl}
\\oddsidemargin -0.5 cm
\\evensidemargin -0.5 cm
\\marginparwidth 0.0 in
\\parindent 0.0 in
\\topmargin -1.5 cm
\\textheight 25.7 cm
\\textwidth 17 cm
\\advance\\headsep 2 ex
\\advance\\textheight -2 cm
\\renewcommand{\\baselinestretch}{1.14}
\\addtolength{\\parskip}{1.2 ex}

\\usepackage{color}
\\usepackage{listings}
\\usepackage{fancyheadings}}

\\definecolor{lightgray}{RGB}{230,230,230}
\\definecolor{orange}{RGB}{255,127,0}
\\lstset{
breaklines=true,
breakindent=40pt,
prebreak=\\raisebox {0 ex }[0 ex ][0 ex ]{ \\ensuremath { \\hookleftarrow }},
basicstyle=\\ttfamily\\small,
keywordstyle=\\color{black}\\bfseries\\underbar,
identifierstyle=,
stringstyle=\\color{orange},
commentstyle=\\color{red},
language=bash,
backgroundcolor=\\color{lightgray},
showstringspaces=false}

\\lstdefinelanguage{diff}{
  morecomment=[f][\\color{black}\\bfseries\\underbar]{diff},
  morecomment=[f][\\color{blue}]{@@},
  morecomment=[f][\\color{red}]-,
  morecomment=[f][\\color{green}]+,
  morecomment=[f][\\color{black}]{---},
  morecomment=[f][\\color{black}]{+++},
}
\\fancyhf{}
\\fancyhf[HRE,HLO]{\\leftmark}
\\fancyhf[HLE,HRO]{\\includegraphics[width=2cm]{%s}}
\\fancyhf[FLE,FLO]{\\bfseries \\THETITLE}
\\fancyhf[FRE,FRO]{\\bfseries \\thepage/\\pageref*{LastPage}}

\\pagestyle{fancy}
\\linespread{1.05}

\\def\\title#1{\\gdef\\@title{#1}\\gdef\\THETITLE{#1}}
\\makeatletter
\\renewcommand\\maketitle{
  \\thispagestyle{empty}
  \\begin{center}
    \\includegraphics[width=8cm]{%s}\\par
    {\\Huge \\bfseries \\THETITLE\\par}
    {\\Large \\@author\\par}
    {\\large \\@date\\par}
  \\end{center}
}
\\makeatother")
(setq org-export-latex-classes nil)
(add-to-list 
 'org-export-latex-classes
 `("IOGS"
   ,(format org-export-latex-template "/home/bs/.emacs.d/super-emacs/imgs/IOGS.png" "/home/bs/.emacs.d/super-emacs/imgs/IOGS.png")
   ("\\section{%s}" . "\\section*{%s}")
   ("\\subsection{%s}" . "\\subsection*{%s}")
   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
   ("\\paragraph{%s}" . "\\paragraph*{%s}")
   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
