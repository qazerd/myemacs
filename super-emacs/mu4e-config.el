(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(setq mu4e-mu-binary "/usr/local/bin/mu")
(require 'mu4e)
;;location of my maildir
(setq mu4e-maildir (expand-file-name "~/ownCloud/Maildir"))
;; give me ISO(ish) format date-time stamps in the header list
(setq  mu4e-headers-date-format "%Y-%m-%d %H:%M")
;;command used to get mail
;; use this for testing
;;(setq mu4e-get-mail-command "true")
;; use this to sync with mbsync
(setq mu4e-get-mail-command "mbsync qazerd")

;;rename files when moving
;;NEEDED FOR MBSYNC
(setq mu4e-change-filenames-when-moving t)

;;set up queue for offline email
;;use mu mkdir  ~/ownCloud/Maildir/queue to set up first
(setq smtpmail-queue-mail nil  ;; start in normal mode
      smtpmail-queue-dir   "~/ownCloud/Maildir/queue/cur")
;; customize the reply-quote-string
;; M-x find-function RET message-citation-line-format for docs
(setq message-citation-line-format "%N @ %Y-%m-%d %H:%M %Z:\n")
(setq message-citation-line-function 'message-insert-formatted-citation-line);; show full addresses in view message (instead of just names)
;; toggle per name with M-RET
(setq mu4e-view-show-addresses 't)
;; without this, "symbol's value as variable is void: mml2014-use" when signing
;; then found http://www.gnu.org/software/emacs/manual/html_node/gnus/Security.html
;; so set to epg and all was good!
;; to sign a mail: M-x mml-secure-sign-pgpmime
(setq mml2015-use 'epg)
(setq mu4e-user-mail-address-list '("bertrand.simon@qazerd.fr"
                                    "bertrand.simon-asso@qazerd.fr"
                                    "bertrand.simon-enseignant@qazerd.fr"
                                    "bertrand.simon-famille@qazerd.fr"
                                    "bertrand.simon-finances@qazerd.fr"
                                    "bertrand.simon-lab@qazerd.fr"
                                     "bertrand.simon-shopping@qazerd.fr"
                                    "bs.billing@qazerd.fr"
                                    "bs.finances@qazerd.fr"
                                    "bs.fm@qazerd.fr"
                                    "famille.simon@qazerd.fr"
                                    ))
;; when you want to use some external command for html->text
;; conversion, e.g. the 'html2text' program
;; (cpbotha: html2text sees to work better than the built-in one)
(setq mu4e-html2text-command "html2text")

;; mu4e-action-view-in-browser is built into mu4e
;; by adding it to these lists of custom actions
;; it can be invoked by first pressing a, then selecting
(add-to-list 'mu4e-headers-actions
             '("in browser" . mu4e-action-view-in-browser) t)
(add-to-list 'mu4e-view-actions
             '("in browser" . mu4e-action-view-in-browser) t)


;; the headers to show in the headers list -- a pair of a field
;; and its width, with `nil' meaning 'unlimited'
;; (better only use that for the last field.
;; These are the defaults:
(setq mu4e-headers-fields
    '( (:date          .  25)
       (:flags         .   6)
       (:from          .  22)
       (:subject       .  nil)))
;; program to get mail; alternatives are 'fetchmail', 'getmail'
;; isync or your own shellscript. called when 'U' is pressed in
;; main view.

;; If you get your mail without an explicit command,
;; use "true" for the command (this is the default)
;(setq mu4e-get-mail-command "offlineimap")
;
;;; setup default identity here:
;;; general emacs mail settings; used when composing e-mail
;;; the non-mu4e-* stuff is inherited from emacs/message-mode
;(setq user-mail-address "info@charlbotha.com"
;      user-full-name  "Charl P. Botha")
;
;;; set this to nil so signature is not included by default
;;; you can include in message with C-c C-w
;(setq mu4e-compose-signature-auto-include 't)
;(setq mu4e-compose-signature (with-temp-buffer
;                               (insert-file-contents "~/.signature.personal")
;                               (buffer-string)))
;;; message-signature-file NOT used by mu4e
;(setq message-signature-file "~/.signature.personal")
;
;;; many recipes online use an alist with the different email identities
;;; I like to use these functions, because then I have more flexibility
;(defun cpb-mu4e-personal()
;  (interactive)
;  (message "personal mail account")
;  (setq  user-mail-address "info@charlbotha.com"
;         mu4e-compose-signature (get-string-from-file "~/.signature.personal"))
;  )
;
;(defun cpb-mu4e-vxlabs()
;  (interactive)
;  (message "vxlabs mail account")
;  (setq  user-mail-address "cpbotha@vxlabs.com"
;         mu4e-compose-signature (get-string-from-file "~/.signature.vxlabs"))
;)
;
;(defun cpb-mu4e-trep()
;  (interactive)
;  (message "treparel mail account")
;  (setq  user-mail-address "charl.botha@treparel.com"
;         mu4e-compose-signature (get-string-from-file "~/.signature.treparel"))
;  )
;
;(defun cpb-mu4e-medvis()
;  (interactive)
;  (message "medvis mail account")
;  (setq  user-mail-address "cpbotha@medvis.org"
;         mu4e-compose-signature (get-string-from-file "~/.signature.medvis"))
;  )
;
;;; quickly change account. got his idea from:
;;; https://github.com/skybert/my-little-friends/blob/master/emacs/.emacs.d/tkj-mu4e.el
;(define-key mu4e-main-mode-map (kbd "<f1>") 'cpb-mu4e-personal)
;(define-key mu4e-main-mode-map (kbd "<f2>") 'cpb-mu4e-vxlabs)
;(define-key mu4e-main-mode-map (kbd "<f4>") 'cpb-mu4e-trep)
;(define-key mu4e-main-mode-map (kbd "<f6>") 'cpb-mu4e-medvis)
;(define-key mu4e-headers-mode-map (kbd "<f1>") 'cpb-mu4e-personal)
;(define-key mu4e-headers-mode-map (kbd "<f2>") 'cpb-mu4e-vxlabs)
;(define-key mu4e-headers-mode-map (kbd "<f4>") 'cpb-mu4e-trep)
;(define-key mu4e-headers-mode-map (kbd "<f6>") 'cpb-mu4e-medvis)
;
;
;;; for sendmail read this http://www.gnus.org/manual/message_36.html
;;; am using nullmailer, so my mail sending just became STUPID fast
;(setq message-send-mail-function 'message-send-mail-with-sendmail)
;
;;; smtp mail setting - if you DON'T want to use nullmailer, instead
;;; connecting to your smtp server and waiting...
;;; (setq
;;;    message-send-mail-function 'smtpmail-send-it
;;;    smtpmail-stream-type 'starttls
;;;    smtpmail-default-smtp-server "mymailserver.com"
;;;    smtpmail-smtp-server "mymailserver.com"
;;;    smtpmail-smtp-service 587
;
;;;    ;; if you need offline mode, set these -- and create the queue dir
;;;    ;; with 'mu mkdir', i.e.. mu mkdir /home/user/Maildir/queue
;;;    smtpmail-queue-mail  nil
;;;    smtpmail-queue-dir  "/home/user/Maildir/queue/cur")
;
;;; don't keep message buffers around
;(setq message-kill-buffer-on-exit t)
;;; attachments go here
;(setq mu4e-attachment-dir  "~/Downloads")
;
;;; when you reply to a message, use the identity that the mail was sent to
;;; the cpbotha variation -- function that checks to, cc and bcc fields
;(defun cpb-mu4e-is-message-to (msg rx)
;  "Check if to, cc or bcc field in MSG has any address in RX."
;  (or (mu4e-message-contact-field-matches msg :to rx)
;      (mu4e-message-contact-field-matches msg :cc rx)
;      (mu4e-message-contact-field-matches msg :bcc rx)))
;
;;; we only do something if we recognize something (i.e. no stupid default)
;(add-hook 'mu4e-compose-pre-hook
;          (defun my-set-from-address ()
;            "Set current identity based on to, cc, bcc of original."
;            (let ((msg mu4e-compose-parent-message)) ;; msg is shorter...
;              (if msg
;                  (cond
;                   ((cpb-mu4e-is-message-to msg (list "cpbotha@cpbotha.net"
;                                                      "info@charlbotha.com"))
;                    (cpb-mu4e-personal))
;                   ((cpb-mu4e-is-message-to msg (list "cpbotha@vxlabs.com"
;                                                      "charl@stonethree.com"))
;                    (cpb-mu4e-vxlabs))
;                   ((cpb-mu4e-is-message-to msg (list "charl.botha@treparel.com"
;                                                      "charl@treparel.com"))
;                    (cpb-mu4e-trep))
;                   ((cpb-mu4e-is-message-to msg "cpbotha@medvis.org")
                                        ;                    (cpb-mu4e-medvis)))))))

