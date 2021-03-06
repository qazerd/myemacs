(setq elfeed-db-directory "~/Documents/emacs_utils/elfeeddb")


(defun elfeed-mark-all-as-read ()
      (interactive)
      (mark-whole-buffer)
      (elfeed-search-untag-all-unread))


;;functions to support syncing .elfeed between machines
;;makes sure elfeed reads index from disk before launching
(defun bjm/elfeed-load-db-and-open ()
  "Wrapper to load the elfeed db from disk before opening"
  (interactive)
  (elfeed-db-load)
  (elfeed)
  (elfeed-search-update--force))

;;write to disk when quiting
(defun bjm/elfeed-save-db-and-bury ()
  "Wrapper to save the elfeed db to disk before burying buffer"
  (interactive)
  (elfeed-db-save)
  (quit-window))



(with-eval-after-load 'elfeed (defalias 'elfeed-toggle-star
  (elfeed-expose #'elfeed-search-toggle-all 'star)))

(use-package elfeed
  :ensure t
  :bind (:map elfeed-search-mode-map
	      ("q" . bjm/elfeed-save-db-and-bury)
	      ("Q" . bjm/elfeed-save-db-and-bury)
	      ("m" . elfeed-toggle-star)
	      ("M" . elfeed-toggle-star)
	      )
  )

(use-package elfeed-goodies
  :ensure t
  :config
  (elfeed-goodies/setup))


(use-package elfeed-org
  :ensure t
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/Documents/emacs_utils/elfeed.org")))
