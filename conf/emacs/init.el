;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                      tomes emacs configuration                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Aesthetics
(tool-bar-mode -1)                  ; Disable the button bar atop screen
(scroll-bar-mode -1)                ; Disable scroll bar
(setq inhibit-startup-screen t)     ; Disable startup screen with graphics
(set-default-font "Monaco 12")      ; Set font and size
(setq-default indent-tabs-mode nil) ; Use spaces instead of tabs
(setq tab-width 2)                  ; Four spaces is a tab
(setq visible-bell nil)             ; Disable annoying visual bell graphic
(setq ring-bell-function 'ignore)   ; Disable super annoying audio bell
;; enable the line-numbers-bar and add a space
(global-linum-mode 1)
(setq linum-format "%3d \u2502 ")

;; Alter keybindings
;; Make keyboard bindings not suck
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; Setup package repositories to browse when running M-x package-install
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; set theme
(load-theme 'monokai t)

;; enable evil mode
(require 'evil)
(evil-mode 1)

;; Snag the user's PATH and GOPATH
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

;; enable autocomplete
(ac-config-default)

;; enable auto pairing brackets and braces
(electric-pair-mode 1)
(setq electric-pair-preserve-balance nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (smartparens flycheck web-mode php-mode jetbrains phpunit go-complete xpm flymake-go go-autocomplete auto-complete exec-path-from-shell go-mode evil which-key use-package try solarized-theme monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
