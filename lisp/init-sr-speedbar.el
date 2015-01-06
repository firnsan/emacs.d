(add-hook 'speedbar-mode-hook 'semantic-mode) ;;没有semantic做代码分析的话，tags列表不准确
(autoload 'sr-speedbar-toggle "sr-speedbar")

;; sr-speedbar config
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-skip-other-window-p t)
;; no auto-refresh
(setq sr-speedbar-auto-refresh nil)

(setq sr-speedbar-width 30)
;; (setq sr-speedbar-default-width 20)
;; (setq sr-speedbar-width-console 20)
;; (setq sr-speedbar-width-x 20)
;; (setq sr-speedbar-max-width 20)

;; regular speedbar config
(setq speedbar-show-unknown-files t)
(setq speedbar-verbosity-level 0)
;(setq speedbar-use-images nil)

(defun speedbar-edit-line-and-switch-to-window ()
  (interactive)
  (speedbar-edit-line)
  (other-window 1))

(global-set-key (kbd "C-c j s") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c j r") 'sr-speedbar-refresh-toggle)
(provide 'init-sr-speedbar)
