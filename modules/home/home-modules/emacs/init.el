;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

;; Custom folder which contains .el files that can be loaded by the load command
(add-to-list 'load-path (expand-file-name "custom" user-emacs-directory))
(load "rose-pine-color-theme")

(use-package evil
  :config
  (evil-mode 1))

;; Keybinds
(global-set-key (kbd "C-x a") #'org-agenda)
(global-set-key (kbd "C-x c") #'org-capture)

;; Rose Pine theme
(load-theme 'rose-pine-color t)

;; Font 
(set-frame-font "Iosevka Nerd Font Mono 12" nil t)

;; qol customizations
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-hl-line-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Binding vterm
(use-package vterm
	:bind ("C-x C-t" . vterm))

;; Nix Mode for syntax highlighting
(use-package nix-mode
	:mode "\\.nix\\'")

;; Nerd Icons
(use-package nerd-icons
	:custom
	(nerd-icons-color-icons nil))

;; Rainbow Mode
(use-package rainbow-mode
  :hook (after-change-major-mode . rainbow-mode))

;; pdf-tools
(use-package pdf-tools
  :defer t
  :mode "\\.pdf\\'"
  :commands (pdf-loader-install)
  :bind (:map pdf-view-mode-map
              ("j" . pdf-view-next-line-or-next-page)
              ("k" . pdf-view-previous-line-or-previous-page)
              ("C-=" . pdf-view-enlarge)
              ("C--" . pdf-view-shrink))
  :init (pdf-loader-install)
  :config (add-to-list 'revert-without-query ".pdf"))
(add-hook 'pdf-view-mode-hook #'(lambda () (interactive) (display-line-numbers-mode -1)))
(add-hook 'pdf-view-mode-hook #'pdf-view-roll-minor-mode)


