;Démarrage effectué en  2 seconds

;Bonjour Bertrand SIMON!

                                        ;Date du jour : mars 16 2017

(setq data '(
             ("Family" . family-capture)
             ("Pro" . pro-capture)
             ("Emacs" . emacs-capture)
             ("perso" . perso-capture)
))
(setq some-helm-source
      `((name . "HELM at the Emacs")
        (candidates . ,data)
        (action . (lambda (candidate)
                    (helm-marked-candidates)))))

(defun helm-select-and-insert-emails ()
  (interactive)
  (insert
   (mapconcat 'identity
              (helm :sources '(some-helm-source))
              ",")))
