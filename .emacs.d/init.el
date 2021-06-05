;; Initialize Emacs

(server-start)

;(setq debug-on-error t)
;; load package system
(require 'package)
(add-to-list
  'package-archives
  '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
;(package-refresh-contents)

;; Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

;; Show line numbers
(global-linum-mode)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Default frame size
(add-to-list 'default-frame-alist '(height . 100))
(add-to-list 'default-frame-alist '(width . 100))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(cider markdown-mode tide js2-mode counsel yaml-mode yari web-mode typescript-mode rake projectile popup magit lv jump inf-ruby evil company color-theme-solarized async)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Homebrew
(setq exec-path (append exec-path (list "/usr/local/bin")))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; Add elisp dir
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'fira-code-mode)

;; font
(set-face-attribute 'default nil :font "Fira Code-14")
(set-frame-font "Fira Code-14" nil t)

;; add theme directory to load path
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))

;; set theme
(load-theme 'nord t)
(set-frame-parameter nil 'background-mode 'dark)
(enable-theme 'nord)

(column-number-mode t)
(tool-bar-mode -1)

;; disable splash screen
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Counsel / Ivy
;(global-set-key (kbd "M-x") 'counsel-M-x)
(ivy-mode 1)

;; Projectile
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(setq projectile-project-search-path '("~/Projects/Personal", "~/Projects/Business", "~/Projects/Clients", "~/Projects/Open"))
(setq projectile-completion-system 'ivy)
(setq projectile-dynamic-mode-line t)

;; Company (completion framework)
(unless (package-installed-p 'company)
  (package-install 'company))

(setq company-idle-delay 0.5)
(setq company-show-numbers t)
(setq company-tooltip-limit 10)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-align-annotations t)
;; invert the navigation direction if the the completion popup-isearch-match
;; is displayed on top (happens near the bottom of windows)
(setq company-tooltip-flip-when-above t)
(global-company-mode 1)

;; Asdf VM (tool version manager)
(require 'asdf-vm)
(asdf-vm-init)

;; Flycheck
(unless (package-installed-p 'flycheck)
  (package-install 'flycheck))
(global-flycheck-mode)

;; Web Mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Ruby
(require 'ruby-electric)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

;; ERB for Web Mode
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(unless (package-installed-p 'inf-ruby)
  (package-install 'inf-ruby))

; install yari
;(defun ri-bind-key ()
;  (local-set-key [f1] 'yari)
;(add-hook 'ruby-mode-hook 'ri-bind-key)

;; TypeScript / JavaScript
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; TSX for Web Mode
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; JSX for Web Mode
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; configure jsx-tide checker to run after your default jsx checker
(flycheck-add-mode 'javascript-eslint 'web-mode)
;(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

