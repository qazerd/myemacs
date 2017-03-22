(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(setq mu4e-mu-binary "/usr/local/bin/mu")
(require 'mu4e)
;;location of my maildir
(setq mu4e-maildir (expand-file-name "~/Maildir"))

;;command used to get mail
;; use this for testing
;;(setq mu4e-get-mail-command "true")
;; use this to sync with mbsync
(setq mu4e-get-mail-command "mbsync qazerd")

;;rename files when moving
;;NEEDED FOR MBSYNC
(setq mu4e-change-filenames-when-moving t)

;;set up queue for offline email
;;use mu mkdir  ~/Maildir/queue to set up first
(setq smtpmail-queue-mail nil  ;; start in normal mode
      smtpmail-queue-dir   "~/Maildir/queue/cur")
