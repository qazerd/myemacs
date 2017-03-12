(require 'ox-reveal)
(require 'htmlize)
(require 'ob-ipython)

;; 1. hook flyspell into org-mode
(add-hook 'org-mode-hook 'flyspell-mode)
(add-hook 'org-mode-hook 'flyspell-buffer)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)
(add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))

(define-key global-map "\C-cc" 'org-capture)
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
; calling agenda
;(defun air-pop-to-org-agenda (split)
;  "Visit the org agenda, in the current window or a SPLIT."
;  (interactive "P")
;  (org-agenda-list)
 ; (when (not split)
 ;   (delete-other-windows)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; display/update images in the buffer after I evaluate
;; 3. ignore tex commands

;; 2. ignore message flags

(defun flyspell-ignore-tex ()
  (interactive)
  (set (make-variable-buffer-local 'ispell-parser) 'tex))

(add-hook 'org-mode-hook 'flyspell-ignore-tex)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(add-hook 'org-mode-hook 'wc-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

;; Make RefTeX faster
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-plug-into-AUCTeX t)

;; Make RefTeX work with Org-Mode
;; use 'C-c (' instead of 'C-c [' because the latter is already
;; defined in orgmode to the add-to-agenda command.
(defun org-mode-reftex-setup ()
  (load-library "reftex") 
  (and (buffer-file-name)
  (file-exists-p (buffer-file-name))
  (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c (") 'reftex-citation))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; RefTeX formats for biblatex (not natbib)
(setq reftex-cite-format
      '(
        (?\C-m . "\\cite[]{%l}")
        (?t . "\\textcite{%l}")
        (?a . "\\autocite[]{%l}")
        (?p . "\\parencite{%l}")
        (?f . "\\footcite[][]{%l}")
        (?F . "\\fullcite[]{%l}")
        (?x . "[]{%l}")
        (?X . "{%l}")
        ))

(setq font-latex-match-reference-keywords
      '(("cite" "[{")
        ("cites" "[{}]")
        ("autocite" "[{")
        ("footcite" "[{")
        ("footcites" "[{")
        ("parencite" "[{")
        ("textcite" "[{")
        ("fullcite" "[{") 
        ("citetitle" "[{") 
        ("citetitles" "[{") 
        ("headlessfullcite" "[{")))

(setq reftex-cite-prompt-optional-args nil)
(setq reftex-cite-cleanup-optional-args t)

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
