(let ()
(keymap-global-unset "M-h" )
(keymap-global-unset "M-j" )
(keymap-global-unset "M-k" )
(keymap-global-unset "M-l" )

(keymap-global-set "M-h" 'backward-char)
(keymap-global-set "M-j" 'next-line)
(keymap-global-set "M-k" 'previous-line)
(keymap-global-set "M-l" 'forward-char)

(keymap-global-unset "M-H" )
(keymap-global-unset "M-J" )
(keymap-global-unset "M-K" )
(keymap-global-unset "M-L" )

(keymap-global-set "M-H" 'backward-word)
(keymap-global-set "M-J" 'next-line)
(keymap-global-set "M-K" 'previous-line)
(keymap-global-set "M-L" 'forward-word)

)

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
  (forward-char)
  )


(keymap-global-unset "M-s")
(keymap-global-set "M-s" 'c-add-if)
