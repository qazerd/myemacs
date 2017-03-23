;Load package.el
(require 'package)

;Add melpa to list of repositories
(add-to-list 'load-path "~/.emacs.d/org-caldav")
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") 
             t)

;Initialize package.el
(package-initialize)
