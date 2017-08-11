(require 'distinguished-theme)
					;Change title-bar text
(setq frame-title-format
      "super-emacs")

;Disable menu-bar
(menu-bar-mode t)

;Disable tool-bar
(tool-bar-mode -1)

;Disable scroll-bar
(scroll-bar-mode t)

;Activate material theme
;(load-theme 'material
;            t)
(load-theme 'distinguished t)
;Set font
(custom-set-faces
 '(default ((t (:height 120)))))
(set-default-font "monospace-16")
