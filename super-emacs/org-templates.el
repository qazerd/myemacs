(setq org-capture-templates
      (quote
       (("e" "A voir dans emacs" entry
         (file "~/ownCloud/org/perso.org")
         "* TODO %?
:emacs:
SCHEDULED: %t"))))
