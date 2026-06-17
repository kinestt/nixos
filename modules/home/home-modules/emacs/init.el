;;; init.el --- Emacs configuration -*- lexical-binding: t; -*-

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Catppuccin theme for the time being till I write a nix package with rose-pine theme for nixos 
(load-theme 'catppuccin :no-confirm)

;; Font 
(set-frame-font "Iosevka Nerd Font Mono 12" nil t)

;; qol customizations
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(global-hl-line-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Binding vterm
(use-package vterm
	:bind ("C-x C-t" . vterm))
