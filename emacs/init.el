;;-----------------------------------
;;          SIMPLIFY THE UI          
;;-----------------------------------

;; Inhibit startup message 
(setq inhibit-startup-message t)

(scroll-bar-mode -1)          ;; Disable vivible scrollbar
(tool-bar-mode -1)            ;; Tool bar (new file, open, open directory, ...)
(tooltip-mode -1)             ;; Disable tooltips
(set-fringe-mode 10)          ;; Add lateral margin (left and right)
(menu-bar-mode -1)            ;; Menu bar disable (file, edit, options, buffers, tools, ...)

(setq visible-bell t)         ;; Add visible bell instead of beep noise

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height 175)     ;;Set font family and font size

(load-theme 'wombat)          ;; Set theme

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Add line numbers globaly
(display-line-numbers-mode 1)



;;-----------------------------------
;;          PACKAGE MANAGER         
;;-----------------------------------

(require 'package)            ;; Initialize package sources

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(global-set-key "\C-V" 'yank)
(global-set-key "\C-cc" 'kill-ring-save)



;;---------------------------------
;;          USED PACKAGES           Alt-x + Alt-e to evaluate 
;;---------------------------------

;; Display on a buffer the key presses (open buffer clm/toggle-command-log-buffer and use command-log-mode or global-command-log mode)
;;(use-package command-log-mode)

;; package used for searching the document
(use-package swiper :ensure t)

;; Package used for completions anf fuzzy find in file explorer, commands, and other things
(use-package ivy
  :diminish                                        ;; do not show the minimal mode of ivy
  :bind (("C-f" . swiper)                          ;; modify ivy keybinds
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))     
  :config
  (ivy-mode 1))

;; Add rich description of commands when using ivy
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

;; doom modeline, make modeline prettier
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;; Better ui for ivy, switching buffer, reverse search for minibuffer and descriptions (Alt-O on an element in the minibuffer)
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

;; Better documentation, describe function, describe command, describe variable and describe key
(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))



;;-----------------------------
;;          EVIL MODE          
;;-----------------------------

;; evil mode package allows modes like vim
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)) 



;;------------------------------
;;          MODE HOOKS          
;;------------------------------

;; disable line numbers in org mode, terminal mode and eshell mode
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))



;;----------------------------
;;          KEYBINDS          
;;----------------------------

;; package that allows you to set keybinds easier
;;(use-package general)
;;(general-define-key
;; "C-M-j" 'counsel-switch-buffer)

;;(general-create-definer adri/leader-keys
;; :keymaps '(normal insert visual emacs)
;; :prefix "SPC"
;; :global-prefix "C-SPC"))

;;(adri/leader-keys
;;  "t"  '(:ignore t :wich-key "toggles")
;;  "tt" '(counsel-load-theme :wich-key "choose-theme"))

;;----------------------------------
;;          AUTO GENERATED
;;----------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(command-log-mode counsel doom-modeline evil helpful ivy-rich swiper)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
