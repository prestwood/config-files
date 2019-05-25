;; Begin MELPA boilerplate
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
;; End MELPA boilerplate

;; Move custom settings to their own file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Enable evil mode
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; Set theme
(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow-day)

;; Disable UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Make 'jj' be an escape chord
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;; Highlight current line
(global-hl-line-mode +1)

;; Show column number
(setq column-number-mode t)

;; Show line numbers
(global-display-line-numbers-mode)

;; Make C-r redo a change
(define-key undo-tree-map (kbd "C-r") nil)

;; Enable mouse support when running in the terminal
(xterm-mouse-mode 1)

;; Highlight lines that are longer than 80 chars long
(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face tab trailing lines-tail))
(global-whitespace-mode +1)

;; Disable the bell
(setq ring-bell-function 'ignore)

;; Enable verison control diff
(global-diff-hl-mode)
(diff-hl-margin-mode t)

;; Disable scroll bar
(toggle-scroll-bar -1)

;; Force case sensitive search
(setq case-fold-search nil)
(setq evil-ex-search-case 'sensitive)

;; List number of search results
(global-anzu-mode +1)
