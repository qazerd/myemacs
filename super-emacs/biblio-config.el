
(autoload 'helm-bibtex "helm-bibtex" "" t)
(setq bibtex-completion-bibliography
      '("~/ownCloud/bibliography/bubliography.bib"
        ;".emacs.d/bibliography/other.bib"
        ))
(setq bibtex-completion-library-path '("~/owncCloud/bibliography/pdf/"))


(pdf-tools-install)
;; see https://github.com/politza/pdf-tools
