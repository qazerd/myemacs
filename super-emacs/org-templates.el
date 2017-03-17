(setq org-capture-templates
      (quote
       (
        ("e" "Improve my emacs" entry
         (file "~/ownCloud/org/todo.org")
         "* TODO %?
:emacs:
SCHEDULED: %t")
        )))
(setq org-capture-templates
      (quote
       (("f" "Famille" entry
         (file "~/ownCloud/org/todo.org")
         "* TODO %?
:famille:
SCHEDULED: %t"))))
(setq org-capture-templates
      (quote
       (("r" "Rugby" entry
         (file "~/ownCloud/org/todo.org")
         "* TODO %?
:rugby:
SCHEDULED: %t"))))
(setq org-capture-templates
      (quote
       (("m" "Musique" entry
         (file "~/ownCloud/org/todo.org")
         "* TODO %?
:musique:
SCHEDULED: %t"))))
(setq org-capture-templates
      (quote
       (("F" "Finances"     entry
         (file "~/ownCloud/org/todo.org")
         "* TODO %? :Finances: 
SCEDULED: %t"))))
(setq org-capture-templates
      (quote
       (("R" "Recherche"    entry
         (file "~/ownCloud/org/todo.org")
         "* TODO %? :Recherche: 
SCHEDULED: %t"))))
(setq org-capture-templates
      (quote
       (("a" "astro"        entry
         (file "~/ownCloud/org/todo.org") "* TODO %? :astro: 
SCHEDULED: %t"))))
(setq org-capture-templates
      (quote
       (("m" "maison"       entry
         (file "~/ownCloud/org/todo.org") "* TODO %? :maison: 
SCHEDULED: %t"))))
(setq org-capture-templates
      (quote
       (("d" "déménagement" entry
         (file "~/ownCloud/org/todo.org")
         "* TODO %? :déménagement: 
SCHEDULED: %t"))))
