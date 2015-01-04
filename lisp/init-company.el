(add-hook 'prog-mode-hook 'global-company-mode)
(add-hook 'cmake-mode-hook 'global-company-mode)

;; does not matter, I never use this hotkey
(global-set-key (kbd "C-c o") 'company-complete)
(setq company-require-match nil)

(if (fboundp 'evil-declare-change-repeat)
    (mapc #'evil-declare-change-repeat
          '(company-complete-common
            company-select-next
            company-select-previous
            company-complete-selection
            company-complete-number
            )))

(eval-after-load 'company
  '(progn
     (add-to-list 'company-backends 'company-cmake)
     (add-to-list 'company-backends 'company-c-headers)
     ;; can't work with TRAMP
     (setq company-backends (delete 'company-ropemacs company-backends))
     ;; (setq company-backends (delete 'company-capf company-backends))
     ;; I don't like the downcase word in company-dabbrev
     ;; for languages use camel case naming convention
     (setq company-dabbrev-downcase nil)
     (setq company-show-numbers t)
     (setq company-begin-commands '(self-insert-command))
     (setq company-idle-delay 0.2)
     (setq company-clang-insert-arguments nil)
     ))


(custom-set-faces
  `(company-tooltip ((t :background "white" :foreground "black")))
   `(company-tooltip-selection ((t :background "steelblue" :foreground "white")))
    `(company-tooltip-mouse ((t :background "blue" :foreground "white")))
     `(company-tooltip-common ((t :background "white" :foreground "black")))
      `(company-tooltip-common-selection ((t t :background "white" :foreground "black")))
       ;; `(company-tooltip-annotation ((t :background "" :foreground "")))
       `(company-scrollbar-fg ((t :background "black")))
        `(company-scrollbar-bg ((t :background "gray")))
         `(company-preview ((t :background nil :foreround "darkgray")))
          `(company-preview-common ((t :background nil :foreground "darkgray")))
)

(provide 'init-company)
