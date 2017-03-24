(defvar super-emacs--my-keyboard-bindings 
  '(
    ("C-<f1>" . mu4e)
    ("C-<f12>" . eval-buffer)
    ("\C-cc" . org-capture)
    ("C-<down>" . copy-current-line-under)
    ("C-<up>" . copy-current-line-above)
    ("M-S-<down>" . move-text-down)
    ("C--" . decrement-number-at-point)
    ("C-+" . increment-number-at-point)
    ("M-S-<up>" . move-text-up)    
    ("C-M-<" . vectra-indent-hilit-buffer)
    ("C-}" . mc/mark-next-like-this)
    ("C-{" . mc/mark-previous-like-this)
    ("C-|" . mc/mark-all-like-this)
    ("C->" . ace-jump-mode)
    ("C-<" . ace-jump-mode-pop-mark)
    ("M-/" . undo-tree-visualize)
    ("C-\," . neotree-toggle)
    ("C-\"" . theme-looper-enable-next-theme)
    ("C-M-'" . myterminal-controls-open-controls)
    ("C-c M-x" . execute-extended-command)
    ("M-x" . helm-M-x)
    ("C-x b" . helm-mini)
    ("C-x C-b" . helm-buffers-list)
    ("C-x C-f" . helm-find-files)
    ("C-x C-r" . helm-recentf)
    ("M-y" . helm-show-kill-ring)
    ("C-M-z" . switch-window)
    ("C-S-<up>" . buf-move-up)
    ("C-S-<down>" . buf-move-down)
    ("C-S-<left>" . buf-move-left)
    ("C-S-<right>" . buf-move-right)
    ("C-x g" . magit-status)
    ("<f5>" . super-emacs-reload-current-file)))
(defun super-emacs-apply-keyboard-bindings (pair)
  "Apply keyboard-bindings for supplied list of key-pair values"
  (global-set-key (kbd (car pair))
                  (cdr pair)))

(mapc 'super-emacs-apply-keyboard-bindings
      super-emacs--my-keyboard-bindings)
