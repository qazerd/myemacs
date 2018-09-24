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

;; load particular paths

;Load configuration files
(load-file "~/.emacs.d/super-emacs/repositories.el")
(load-file "~/.emacs.d/super-emacs/packages.el")
(load-file "~/.emacs.d/super-emacs/interface.el")
(load-file "~/.emacs.d/super-emacs/auto-complete-conf.el")
(load-file "~/.emacs.d/super-emacs/misc.el")
(load-file "~/.emacs.d/super-emacs/my-functions.el")
(load-file "~/.emacs.d/super-emacs/key-bindings.el")
(load-file "~/.emacs.d/super-emacs/edit_tex.el")
(load-file "~/.emacs.d/super-emacs/helm-config.el")
(org-babel-load-file (expand-file-name "~/.emacs.d/super-emacs/org-config.org"))
(load-file "~/.emacs.d/super-emacs/elfeed_conf.el")
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
 '(custom-enabled-themes (quote (leuven)))
 '(custom-safe-themes
   (quote
    ("a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" default)))
 '(doc-view-continuous t)
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(package-selected-packages
   (quote
    (elfeed-org elfeed auto-complete helm helm-bibtex ein bbdb flycheck ztree yasnippet which-key wc-mode wc-goal-mode undo-tree theme-looper switch-window rtags powerline ox-reveal org-ref org-gcal org-bullets ob-ipython neotree myterminal-controls multiple-cursors meta-presenter material-theme magit interleave htmlize helm-bibtexkey google-translate flycheck-irony ein-mumamo distinguished-theme dired-launch company-irony-c-headers company-irony cmake-ide buffer-move bbdb-vcard bbdb-csv-import ace-jump-mode)))
 '(send-mail-function nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 120)))))
(put 'upcase-region 'disabled nil)
