;Load package.el
(require 'package)

					;Add melpa to list of repositories
;(add-to-list 'load-path "~/.emacs.d/org-caldav")
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("melpa2" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa3" . "http://www.mirrorservice.org/sites/melpa.org/packages/"))
(add-to-list 'package-archives
'("melpa4" . "http://www.mirrorservice.org/sites/stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

					;Initialize package.el
(package-initialize)
