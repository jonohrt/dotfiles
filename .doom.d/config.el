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
(setq doom-font (font-spec :family "FuraCode NF" :size 19))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. These are the defaults.
(setq doom-theme 'doom-monokai-ristretto)
;; (setq-default line-spacing 3)
;; (setq default-text-properties '(line-spacing 0.05 line-height 1.05))
;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")

(global-set-key (kbd "C-h")  'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-k")    'windmove-up)
(global-set-key (kbd "C-j")  'windmove-down)

;; Enable text wrapping.
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(require 'evil-matchit)
(global-evil-matchit-mode 1)

;; If you want to change the style of line numbers, change this to `relative' or
;; `nil' to disable it:
(setq display-line-numbers-type t)

(after! doom-thems
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

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

(add-hook 'ruby-mode-hook #'rubocopfmt-mode)

(setq evil-normal-state-cursor '(box "light blue")
      evil-insert-state-cursor '(bar "medium sea green")
      evil-visual-state-cursor '(hollow "orange"))

;; (remove-hook 'doom-first-input-hook #'evil-snipe-mode)

(require 'evil-replace-with-register)
;; change default key bindings (if you want) HERE
(setq evil-replace-with-register-key (kbd "gr"))
(evil-replace-with-register-install)
(map! :leader :desc "Clear highlights" "s c" #'evil-ex-nohighlight)

(map! :leader :desc "Rename buffer" "b R" #'rename-buffer)

(setq auto-revert-check-vc-info t)
;; (defun company-complete-if-selected ()
;;   (interactive)
;;   (if (eq company-selection nil) (newline-and-indent) (company-complete)))
;; (map! :i "C-p" #'dabbrev-expand)
;; (map! :i "C-o" #'yas-expand)

;; (after! company
;;   (setq company-dabbrev-downcase 0)
;;   (setq company-show-numbers t)
;;   (setq company-idle-delay 0.2))

;; (add-hook 'after-init-hook 'company-tng-mode)

;; (setq company-dabbrev-code-everywhere t)
;; (setq company-dabbrev-code-other-buffers t)

;; (map! :after company
;;       :map company-tng-map
;;       "C-o" 'yas-expand
;;       "C-p" 'dabbrev-expand
;;       "RET" 'company-complete-if-selected)
;; (setq display-line-numbers-type 'relative)
;; (global-spell-fu-mode)

;; (defun j-company-remove-dabbrev-dups-keep-order (candidates)
;;   "Loop over CANDIDATES and remove duplicate candidates if they belong to
;;   `company-dabbrev' or `company-dabbrev-code'."
;;   (let ((hash (make-hash-table :test 'equal :size (length candidates)))
;;         (new-list nil))
;;     (dolist (candidate candidates)
;;       (let ((stripped-candidate (substring-no-properties candidate))
;;             (candidate-backend (get-text-property 0 'company-backend candidate)))
;;         (cond
;;          ;; Candidate is `company-yasnippet', always push this.
;;          ((eq (get-text-property 0 'company-backend candidate)
;;               'company-yasnippet)
;;           (push candidate new-list))
;;          ;; Candidate has not been seen.
;;          ((not (gethash stripped-candidate hash))
;;           (puthash stripped-candidate candidate hash)
;;           (push candidate new-list))
;;          ;; Candidate has been seen.
;;          ;; `company-dabbrev' or `company-dabbrev-code' is the candidate.
;;          ((or candidate-backend
;;               (eq candidate-backend 'company-dabbrev-code)
;;               (eq candidate-backend 'company-dabbrev))
;;           t)
;;          ;; Candidate has been seen but is not `company-dabbrev'
;;          ;; or `company-dabbrev-code'.
;;          (:seen-but-candidate-not-dabbrev
;;           ;; If the candidate in the hash table is dabbrev, replace it.
;;           ;; Otherwise, we are fine with duplicates as long as the backends
;;           ;; are meaningful.
;;           (let* ((hash-candidate (gethash stripped-candidate hash))
;;                  (hash-backend (get-text-property
;;                                 0 'company-backend hash-candidate)))
;;             (if (or hash-backend
;;                     (eq hash-backend 'company-dabbrev)
;;                     (eq hash-backend 'company-dabbrev-code))
;;                 (progn
;;                   (setcar
;;                    (nthcdr
;;                     (cl-position hash-candidate new-list :test 'eq)
;;                     new-list)
;;                    candidate)
;;                   (puthash stripped-candidate candidate hash)
;;                   t)
;;               ;; Only need one candidate in the hash table.
;;               (push candidate new-list)))))))
;;     (reverse new-list)))

;; (after! company
;;   (set-company-backend! 'inf-ruby-mode 'company-dabbrev-code)
;;   (setq +lsp-company-backends '(:separate company-capf company-dabbrev-code company-yasnippet))

;;   (add-to-list 'company-transformers
;;                #'j-company-remove-dabbrev-dups-keep-order))

;; (setq spell-fu-ignore-modes (list 'dired-mode))
;; ;; (setq ispell-dictionary "en_US")
;; (with-eval-after-load 'evil
;;     (defalias #'forward-evil-word #'forward-evil-symbol)
;;     ;; make evil-search-word look for symbol rather than word boundaries
;;     (setq-default evil-symbol-word-search t))

(setq lsp-ui-doc-enable nil)
(setq-default fill-column 100)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(map! :leader :desc "jump to ruby begin block" "m j b" 'ruby-beginning-of-block)
(map! :leader :desc "jump to ruby begin block" "m j e" 'ruby-end-of-block)

(require 'epa-file)
(custom-set-variables '(epg-gpg-program  "/usr/local/bin/gpg"))
(epa-file-enable)

(setq flycheck-check-syntax-automatically '(save mode-enabled))

;; This is usually just annoying
(setq compilation-ask-about-save nil)

;; No confirm on exit
(setq confirm-kill-emacs nil)

(after! so-long
  (setq so-long-threshold 10000))

;; Truncate compiilation buffers, otherwise Emacs gets slow
;; https://stackoverflow.com/questions/11239201/can-i-limit-the-length-of-the-compilation-buffer-in-emacs
(add-hook 'compilation-filter-hook 'comint-truncate-buffer)
(setq comint-buffer-maximum-size 2000)

(setq recentf-max-saved-items 10000)

;; (map! :leader :desc "Find file in project" "p f" 'counsel-fzf)
(setq doom-modeline-vcs-max-length 199)

(define-key (current-global-map)
  [remap async-shell-command] 'with-editor-async-shell-command)
(define-key (current-global-map)
  [remap shell-command] 'with-editor-shell-command)

;; (add-hook 'vterm-mode-hook  'with-editor-export-editor)
;; (setq ob-mermaid-cli-path "/usr/local/bin/mmdc")
;;  (setq plantuml-default-exec-mode 'executable)

(setq +org-capture-journal-file "/Users/johrt/org/work-journal.org")

(setq mouse-drag-copy-region t)

(setq magit-list-refs-sortby "-creatordate")

(use-package! fussy
  :config
  (setq fussy-filter-fn 'fussy-filter-default)
  (setq fussy-use-cache t)
  (setq fussy-compare-same-score-fn 'fussy-histlen->strlen<)

  (push 'fussy completion-styles)
  (setq
   ;; For example, project-find-file uses 'project-files which uses
   ;; substring completion by default. Set to nil to make sure it's using
   ;; flx.
   completion-category-defaults nil
   completion-category-overrides nil)

  ;; `eglot' defaults to flex, so set an override to point to flx instead.
  (with-eval-after-load 'eglot
    (add-to-list 'completion-category-overrides
                 '(eglot (styles fussy basic)))))

;; (use-package! company
;;   :config
;;   (defun j-company-capf (f &rest args)
;;     "Manage `completion-styles'."
;;     (if (length= company-prefix 0)
;;         ;; Don't use `company' for 0 length prefixes.
;;         (let ((completion-styles (remq 'fussy completion-styles)))
;;           (apply f args))
;;       (let ((fussy-max-candidate-limit 5000)
;;             (fussy-default-regex-fn 'fussy-pattern-first-letter)
;;             (fussy-prefer-prefix nil))
;;         (apply f args))))

;;   (defun j-company-transformers (f &rest args)
;;     "Manage `company-transformers'."
;;     (if (length= company-prefix 0)
;;         ;; Don't use `company' for 0 length prefixes.
;;         (apply f args)
;;       (let ((company-transformers '(fussy-company-sort-by-completion-score)))
;;         (apply f args))))

  (advice-add 'company-auto-begin :before 'fussy-wipe-cache)
  (advice-add 'company--transform-candidates :around 'j-company-transformers)
  (advice-add 'company-capf :around 'j-company-capf)

;;   (global-company-mode))

(use-package! company-fuzzy
  :hook (company-mode . company-fuzzy-mode)
  :init
  (setq company-fuzzy-sorting-backend 'flx
        company-fuzzy-prefix-on-top nil
        company-fuzzy-trigger-symbols '("." "->" "<" "\"" "'" "@")))
