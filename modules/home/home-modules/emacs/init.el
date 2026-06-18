;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "custom" user-emacs-directory))
(load "rose-pine-color-theme")

;; Enable Evil
(require 'evil)
(evil-mode 1)

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
