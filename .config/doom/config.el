(use-package! gcmh
  :init
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 256 1024 1024))  ; 256MB during idle
  :config
  (gcmh-mode 1))

(setq gc-cons-threshold 200000000) ; previous 33554432

;; credentials
(setq user-full-name "Satz"
      user-mail-address "satz30@duck.com")

;; autosave and backup
(setq auto-save-default t
      make-backup-files t)

;; kill emacs without confiming
(setq confirm-kill-emacs nil)

;; remap <localleader> from SPC m to SPC l
;; (setq doom-localleader-key "SPC l"
;;       doom-localleader-alt-key "M-SPC l")

(setq doom-theme 'catppuccin)
(setq catppuccin-flavor 'mocha) ;; 'frappe, 'macchiato,'mocha or 'latte
;; (catppuccin-reload)

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 17)
      doom-serif-font (font-spec :family "Cantarell" :size 17)
      doom-variable-pitch-font (font-spec :family "Cantarell" :size 21)
      doom-emoji-font (font-spec :family "JetBrainsMono Nerd Font" :size 16)
      doom-symbol-font (font-spec :family "JetBrainsMono Nerd Font" :size 17))

(setq display-line-numbers-type 'relative)
;; (setq-default line-spacing 0.1)

(add-hook! display-line-numbers-mode
  (custom-set-faces!
    '(line-number :slant normal)
    '(line-number-current-line :slant normal)))

;; (setq global-hl-line-modes nil)

(setq display-fill-column-indicator-column 80)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; (pixel-scroll-precision-mode 1)
;; (pixel-scroll-mode 1)

(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 40))

;; (setq frame-title-format
;;       '(""
;;         (:eval
;;          (if (s-contains-p org-roam-directory (or buffer-file-name ""))
;;              (replace-regexp-in-string
;;               ".*/[0-9]*-?" "☰ "
;;               (subst-char-in-string ?_ ?  buffer-file-name))
;;            "%b"))
;;         (:eval
;;          (let ((project-name (projectile-project-name)))
;;            (unless (string= "-" project-name)
;;              (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))
(setq frame-title-format '("" (:eval buffer-name) "%b"))

(after! pdf-tools
  (setq pdf-view-midnight-colors '("#e0e0e0" . "#202020")))

(use-package pdf-tools
  :ensure t
  :config
  (pdf-tools-install))

(after! corfu
  (setq corfu-auto nil
        corfu-preselect 'first
        +corfu-want-tab-prefer-expand-snippets t))

(after! deft
  (setq deft-recursive t
        deft-use-filter-string-for-filename t
        deft-default-extension "org"
        deft-directory org-roam-directory))

(map! :leader
      :prefix "r"
      :desc "Search with deft"
      "s" #'deft)

(remove-hook! '+doom-dashboard-functions
  ;; #'doom-dashboard-widget-shortmenu ;; need that shortmenu
  #'doom-dashboard-widget-footer)

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(add-hook! '+doom-dashboard-functions :append
  (insert "\n" (+doom-dashboard--center +doom-dashboard--width "வணக்கம்!"))
  (setq mode-line-format nil)
  (hl-line-mode 0)
  (read-only-mode +1))

;; copied from https://github.com/emacs-dashboard/emacs-dashboard/blob/master/dashboard-widgets.el
;; (defcustom my/dashboard-footer-messages
;;   '("Born to yap, forced to study"
;;     "Never outsource thinking"
;;     "I showed you my source code, pls respond")
;;   "A list of messages, one of which dashboard chooses to display.")

;; (add-hook! '+doom-dashboard-functions :append
;;   (let* ((icon (propertize  #(" " 0 1 (display (height 1.5))) 'face `(:foreground ,(doom-color 'grey))))
;;          (msg  (nth (random (length my/dashboard-footer-messages))
;;                     my/dashboard-footer-messages))
;;          (line (concat icon msg)))
;;     (insert "\n" (+doom-dashboard--center +doom-dashboard--width line) "\n"))
;;   (setq mode-line-format nil)
;;   (hl-line-mode 0)
;;   (read-only-mode +1))

(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))

(defun my-weebery-is-always-greater ()
  (let* ((banner '( "                                                     "
                    "███████╗  █████╗  ████████╗ ███████╗                 "
                    "██╔════╝ ██╔══██╗ ╚══██╔══╝ ╚══███╔╝                 "
                    "███████╗ ███████║    ██║      ███╔╝                  "
                    "╚════██║ ██╔══██║    ██║     ███╔╝                   "
                    "███████║ ██║  ██║    ██║    ███████╗                 "
                    "╚══════╝ ╚═╝  ╚═╝    ╚═╝    ╚══════╝                 "
                    "                                ███████╗ ██╗ ███████╗"
                    "                                ╚══════╝ ╚═╝ ╚══════╝"
                    "               nonkloq.github.io                   "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(setq +doom-dashboard-ascii-banner-fn #'my-weebery-is-always-greater)

(after! doom-modeline
  (setq doom-modeline-buffer-file-name-style 'file-name
        doom-modeline-always-show-macro-register t
        doom-modeline-enable-word-count nil
        doom-modeline-buffer-encoding t
        doom-modeline-major-mode-icon t
        doom-modeline-bar-width 0
        doom-modeline-height 25
        doom-modeline-modal nil))

(use-package! centaur-tabs
  :init
  (remove-hook 'doom-first-file-hook #'centaur-tabs-mode)
  (when (daemonp)
    (remove-hook 'server-after-make-frame-hook #'centaur-tabs-mode))

  (map! :leader
        :prefix "t"
        :desc "Tabs"
        "t" #'centaur-tabs-mode
        :desc "Local tabs"
        "T" #'centaur-tabs-local-mode)
  :config
  (centaur-tabs-change-fonts my/sans-serif-font 140)
  :bind
  (:map evil-normal-state-map
        ("g t" . centaur-tabs-forward)
        ("g T" . centaur-tabs-backward)))

(add-hook! 'org-mode-hook #'mixed-pitch-mode)

(after! mixed-pitch
  (setq mixed-pitch-set-height t)
  (setq variable-pitch-serif-font doom-variable-pitch-font)
  (set-face-attribute 'variable-pitch nil :height 1.2))

(use-package! spacious-padding
  :ensure t
  :config
  (setq spacious-padding-widths
        '( :internal-border-width 15
           :header-line-width 4
           :mode-line-width 4
           :tab-width 4
           :right-divider-width 30
           :scroll-bar-width 8
           :fringe-width 0))
  (spacious-padding-mode 1))

(after! dirvish
  (setq! dirvish-quick-access-entries
         `(("h" "~/"           "Home")
           ("e" ,doom-user-dir "Doom config")
           ("c" "~/Codes/"     "Code")
           ("d" "~/Downloads/" "Downloads")
           ("g" "~/Projects/"  "Projects")
           ("t" "~/.Trash/"    "Trash"))))

(use-package! eglot-booster
  :after eglot
  :config (eglot-booster-mode))

(after! cc-mode
  (setq c-basic-offset 2))

;; (after! java-mode
;;   (setq c-basic-offset 2))

; use cdlatex completion instead of yasnippet
(map! :map cdlatex-mode-map
      :i "TAB" #'cdlatex-tab)

(map! :after latex
      :map cdlatex-mode-map
      :localleader
      :desc "Insert math symbol"
      "i" #'cdlatex-math-symbol
      :desc "Begin environment"
      "e" #'cdlatex-environment)

(setq org-directory "~/Documents/org"
      org-use-property-inheritance t ; fix weird issue with src blocks
      org-startup-with-inline-images t
      org-hide-emphasis-markers t
      org-edit-src-content-indentation 0
      org-startup-with-latex-preview t)

(after! org
  (add-to-list 'org-latex-packages-alist '("" "amsmath" t))
  (add-to-list 'org-latex-packages-alist '("" "amssymb" t))
  (add-to-list 'org-latex-packages-alist '("" "mathtools" t))
  (add-to-list 'org-latex-packages-alist '("" "mathrsfs" t)))

(use-package! org-latex-preview
 :after org
 :config
 (plist-put org-latex-preview-appearance-options
            :page-width 0.8)
 (setq org-latex-preview-process-default 'dvisvgm)
 (add-hook 'org-mode-hook 'org-latex-preview-auto-mode)
 (setq org-latex-preview-auto-ignored-commands
       '(next-line previous-line mwheel-scroll
         scroll-up-command scroll-down-command))
 (setq org-latex-preview-numbered t)
 (setq org-latex-preview-live t)
 (setq org-latex-preview-live-debounce 0.25))

(use-package! org-modern
  :after org
  :config
  (setq
   org-auto-align-tags t
   org-tags-column 0
   org-fold-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; agenda
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "⭠ now ─────────────────────────────────────────────────")

  (global-org-modern-mode))
(setq org-modern-hide-stars 'indent
      org-modern-star '("◉" "○" "✿" "✚" "✜" "◆" "◇"))

(use-package! org-roam
  :defer t
  :config
  (setq org-roam-directory (file-truename "~/Documents/roamkb")
        ; org-roam-db-location (file-truename "~/Documents/roamkb/org-roam.db")
        ; org-attach-id-dir "assets/"
        org-roam-capture-templates
        '(("d" "default" plain
         "%?"
         :if-new (file+head "rough/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :scratch:")
         :unnarrowed t)

        ("l" "Programming Language" plain
         "- tags ::  %?\n\n* Source\n\n"
         :if-new (file+head "langs/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :lang:\n")
         :unnarrowed t)

        ("p" "Paper" plain
         "- tags ::  %?\n\n* Source\n\n"
         :if-new (file+head "refs/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :paper:\n")
         :unnarrowed t)

        ("b" "Book" plain
         "- tags ::  %?\n\n* Source\n\n"
         :if-new (file+head "refs/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: :book:\n")
         :unnarrowed t)

        ("t" "Topic" plain
         "- tags ::  %?\n\n* Source\n\n"
         :if-new (file+head "tops/%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags:\n")
         :unnarrowed t)
        )
        )
  (org-roam-db-autosync-enable))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(map! :map evil-org-mode-map
        :leader
        (:prefix ("r")
         :desc "Insert node"
         "i" #'org-roam-node-insert
         :desc "Find node"
         "f" #'org-roam-node-find
         :desc "Capture to node"
         "c" #'org-roam-capture
         :desc "Toggle roam buffer"
         "b" #'org-roam-buffer-toggle
         :desc "Open random note"
         "r" #'org-roam-node-random
         :desc "Visit node"
         "v" #'org-roam-node-visit
         :desc "Open ORUI"
         "u" #'org-roam-ui-open))

(use-package! org-download
  :after org
  :config
  ;; Enable org-download in dired-mode
  (add-hook 'dired-mode-hook 'org-download-enable))


(defun my-org-download-method (link)
  (let ((filename
         (file-name-nondirectory
          (car (url-path-and-query
                (url-generic-parse-url link)))))
        (dirname (concat "~/Documents/roamkb/.media/" (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))))
    (setq org-download-image-dir dirname)
    (make-directory dirname t)
    (expand-file-name (funcall org-download-file-format-function filename) dirname)))
(setq org-download-method 'my-org-download-method)

(use-package! org-download
  :after org

  :config
  (setq org-download-annotate-function (lambda (_) "Return empty string" ""))
  (setq org-download-link-format "[[file:%s]]\n"
        org-download-abbreviate-filename-function #'file-relative-name)
  )

(after! org
  (map! :map org-mode-map
        :n "C-c y" #'org-download-clipboard
        :i "C-c y" #'org-download-clipboard
        :n "C-c d" #'org-download-delete
        :i "C-c d" #'org-download-delete))

(after! org-present
  (add-hook 'org-present-mode-hook
            (lambda ()
              (org-display-inline-images)
              (org-present-big)
              (hide-mode-line-mode 1)
              (org-indent-mode 0)
              (display-line-numbers-mode 0)
              (setq-local header-line-format " ")  ; Add top margin
              (setq-local org-format-latex-options
                          (plist-put org-format-latex-options :scale 2.0))
              (setq-local org-present-text-scale 3)
              (setq-local left-margin-width 8)     ; Add left margin
              (setq-local right-margin-width 8)    ; Add right margin
              (setq-local org-present-startup-with-latex t)
              ;; Apply the margin changes
              (set-window-buffer nil (current-buffer))))

  (add-hook 'org-present-mode-quit-hook
            (lambda ()
              (org-remove-inline-images)
              (org-present-small)
              (hide-mode-line-mode 0)
              (org-indent-mode 1)
              (display-line-numbers-mode 1)
              ;; Reset margins
              (setq-local header-line-format nil)
              (setq-local left-margin-width 0)
              (setq-local right-margin-width 0)
              ;; Apply the margin changes
              (set-window-buffer nil (current-buffer)))))

(after! eglot
  (add-to-list 'eglot-server-programs '(python-mode . ("pyright-langserver" "--stdio"))))

(add-hook! python-mode
  (setq python-shell-interpreter "python3.12"
        doom-modeline-env-python-executable "python3.12"))
