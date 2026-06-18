;;; early-init.el --- Early emacs configuration -*- lexical-binding: t; -*-

(set-language-environment "UTF-8")

(setq inhibit-startup-message 1)
(setq-default
 default-frame-alist
 '((bottom-divider-width . 1)
   (horizontal-scroll-bars . nil)
   (menu-bar-lines . 0)
   (tool-bar-lines . 0)
   (set-fringe-mode 10)
   (vertical-scroll-bars . nil))
 tab-width 2 
 indent-tabs-mode nil
)

