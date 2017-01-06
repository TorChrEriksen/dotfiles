;; Load init_w.el file when started from emacs command
;; e and ew are functions for loading different emacs files in my dotfiles

(if (file-readable-p "~/.emacs.d/init_w.el")
    (load "~/.emacs.d/init_w.el"))
