(menu-bar-mode 0)
(tool-bar-mode 0)
;; (scroll-bar-mode 0)

;; theme
(require 'gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)

;; my term
(defun my-term ()
  "This fuction opens terminal vertically at bottom"
  (interactive)
  (split-window-vertically 30)
  (other-window 1)
  (term "bash"))
(keymap-global-unset "M-s")
(keymap-global-set "M-s" 'my-term)

;; c bind
(defun c-add-if ()
  (interactive)
  (insert "if ()\n")
  (insert "{")
  (c-indent-line-or-region)
  (insert "\n")
  (insert "}")
  (c-indent-line-or-region)
  (insert "\n")

  (backward-paragraph)
  (forward-word)
  (forward-char)
  (forward-char))
(keymap-global-unset "C-c")
(keymap-global-set "C-c i" 'c-add-if)

;; selection
;;(defun my-make-

;; my binds
(keymap-global-set "M-h" 'backward-char)
(keymap-global-set "M-j" 'next-line)
(keymap-global-set "M-k" 'previous-line)
(keymap-global-set "M-l" 'forward-char)

(keymap-global-set "M-w" 'forward-word)
(keymap-global-set "M-b" 'backward-word)

(keymap-global-set "M-a" 'move-beginning-of-line)
(keymap-global-set "M-e" 'move-end-of-line)

;; (keymap-global-set "M-A" 'move-beginning-of-line)
;; (keymap-global-set "M-E" 'move-end-of-line)

(keymap-global-set "M-y" 'yank)

(keymap-global-set "M-/" 'undo)

;; (keymap-global-set "M-g" 'keyboard-quit)

(keymap-global-set "M-;" 'comment-line)

(keymap-global-set "M-K" 'kill-line)

