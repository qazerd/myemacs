
(autoload 'helm-bibtex "helm-bibtex" "" t)
(setq bibtex-completion-bibliography
      '("~/.emacs.d/bibliography/bibliography.bib"
        ;".emacs.d/bibliography/other.bib"
        ))
(setq bibtex-completion-library-path '("~/owncCloud/bibliography/pdf/"))


(pdf-tools-install)
;; see https://github.com/politza/pdf-tools
