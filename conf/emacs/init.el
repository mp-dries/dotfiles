;; skip start screen on launching emacs
(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

;; set theme
(load-theme 'monokai t)

;; enable the line-numbers-bar and add a space
(global-linum-mode 1)
(setq linum-format "%3d \u2502 ")
