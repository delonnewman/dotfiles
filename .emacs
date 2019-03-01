;; load package system

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
 (require 'package)
 (add-to-list
  'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/")
  '("marmalade" . "http://marmalade-repo.org")))

;; Evil
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(package-selected-packages
   (quote
    (yaml-mode web-mode company-inf-ruby color-theme-solarized evil-magit evil-org evil-rails evil-tutor flycheck flymake-coffee flymake-haml flymake-jslint flymake-json flymake-ruby flymake-sass flymake-shell flymake-yaml helm helm-ack helm-dash inf-ruby magit rubocop ruby-tools rvm ack coffee-mode csv-mode flymake json-mode org))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; font
(set-face-attribute 'default nil :font "Consolas-11")
(set-frame-font "Consolas-11" nil t)

;; theme
(load-theme 'solarized t)
(set-frame-parameter nil 'background-mode 'dark)
(enable-theme 'solarized)

(column-number-mode t)
(tool-bar-mode -1)
