;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; refresh' after modifying this file!


;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "SauceCodePro Nerd Font" :size 20))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
(require 'rubocopfmt)
(setq rubocopfmt-on-save-use-lsp-format-buffer t)
(require 'projector)
(setq alert-default-style 'notifier)

(add-hook 'ruby-mode-hook #'rubocopfmt-mode)

(setq evil-normal-state-cursor '(box "light blue")
      evil-insert-state-cursor '(bar "medium sea green")
      evil-visual-state-cursor '(hollow "orange"))

(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

(require 'evil-replace-with-register)
;; change default key bindings (if you want) HERE
(setq evil-replace-with-register-key (kbd "s"))
(evil-replace-with-register-install)
(map! :leader :desc "Clear highlights" "s c" #'evil-ex-nohighlight)

(map! :leader :desc "Rename buffer" "b R" #'rename-buffer)

(setq auto-revert-check-vc-info t)
(defun company-complete-if-selected ()
  (interactive)
  (if (eq company-selection nil) (newline-and-indent) (company-complete)))
(map! :i "C-p" #'dabbrev-expand)
(map! :i "C-o" #'yas-expand)

(after! company
  (setq company-dabbrev-downcase 0)
  (setq company-show-numbers t)
  (setq company-idle-delay 0))

(add-hook 'after-init-hook 'company-tng-mode)

(setq company-dabbrev-code-everywhere t)
(setq company-dabbrev-code-other-buffers t)

(map! :after company
      :map company-tng-map
      "C-o" 'yas-expand
      "C-p" 'dabbrev-expand
      "RET" 'company-complete-if-selected)
(setq display-line-numbers 'relative)
(global-spell-fu-mode)

(defun j-company-remove-dabbrev-dups-keep-order (candidates)
  "Loop over CANDIDATES and remove duplicate candidates if they belong to
  `company-dabbrev' or `company-dabbrev-code'."
  (let ((hash (make-hash-table :test 'equal :size (length candidates)))
        (new-list nil))
    (dolist (candidate candidates)
      (let ((stripped-candidate (substring-no-properties candidate))
            (candidate-backend (get-text-property 0 'company-backend candidate)))
        (cond
         ;; Candidate is `company-yasnippet', always push this.
         ((eq (get-text-property 0 'company-backend candidate)
              'company-yasnippet)
          (push candidate new-list))
         ;; Candidate has not been seen.
         ((not (gethash stripped-candidate hash))
          (puthash stripped-candidate candidate hash)
          (push candidate new-list))
         ;; Candidate has been seen.
         ;; `company-dabbrev' or `company-dabbrev-code' is the candidate.
         ((or candidate-backend
              (eq candidate-backend 'company-dabbrev-code)
              (eq candidate-backend 'company-dabbrev))
          t)
         ;; Candidate has been seen but is not `company-dabbrev'
         ;; or `company-dabbrev-code'.
         (:seen-but-candidate-not-dabbrev
          ;; If the candidate in the hash table is dabbrev, replace it.
          ;; Otherwise, we are fine with duplicates as long as the backends
          ;; are meaningful.
          (let* ((hash-candidate (gethash stripped-candidate hash))
                 (hash-backend (get-text-property
                                0 'company-backend hash-candidate)))
            (if (or hash-backend
                    (eq hash-backend 'company-dabbrev)
                    (eq hash-backend 'company-dabbrev-code))
                (progn
                  (setcar
                   (nthcdr
                    (cl-position hash-candidate new-list :test 'eq)
                    new-list)
                   candidate)
                  (puthash stripped-candidate candidate hash)
                  t)
              ;; Only need one candidate in the hash table.
              (push candidate new-list)))))))
    (reverse new-list)))

(after! company
  (set-company-backend! 'inf-ruby-mode 'company-dabbrev-code)
  (setq +lsp-company-backends '(:separate company-capf company-dabbrev-code company-yasnippet))

  (add-to-list 'company-transformers
               #'j-company-remove-dabbrev-dups-keep-order))

(setq spell-fu-ignore-modes (list 'dired-mode))

(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol)
    ;; make evil-search-word look for symbol rather than word boundaries
    (setq-default evil-symbol-word-search t))
