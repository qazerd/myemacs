;Record startup timestamp

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq package-enable-at-startup nil)
(package-initialize)

(defvar super-emacs/invokation-time
  (current-time))
(setq debug-on-error t)
;Load configuration files
(load-file "~/.emacs.d/super-emacs/repositories.el")
(load-file "~/.emacs.d/super-emacs/packages.el")
(load-file "~/.emacs.d/super-emacs/interface.el")
(load-file "~/.emacs.d/super-emacs/misc.el")
(load-file "~/.emacs.d/super-emacs/my-functions.el")
(load-file "~/.emacs.d/super-emacs/key-bindings.el")
(load-file "~/.emacs.d/super-emacs/edit_tex.el")
(load-file "~/.emacs.d/super-emacs/helm-config.el")
(load-file "~/.emacs.d/super-emacs/org-config.el")
(load-file "~/.emacs.d/super-emacs/org-templates.el")

                                        ;(load-file "~/.emacs.d/super-emacs/elpy-config.el")
;;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

;Print welcome message
(princ (cl-concatenate 'string
                       "Démarrage effectué en  "
                       (number-to-string (cadr (time-subtract (current-time)
                                                              super-emacs/invokation-time)))
                       " seconds\n\n"
                       "Bonjour Bertrand SIMON!\n\n"
                       "Date du jour : "
                       (format-time-string "%B %d %Y"))
       (get-buffer-create (current-buffer)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ztree yasnippet which-key wc-mode wc-goal-mode undo-tree theme-looper switch-window powerline ox-reveal org-caldav org-bullets ob-ipython neotree myterminal-controls multiple-cursors meta-presenter material-theme magit htmlize helm distinguished-theme dired-launch buffer-move auto-complete ace-jump-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120)))))
