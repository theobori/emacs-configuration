(require 'org)

;; Create the emacs user directory if it does not exist
(unless (file-exists-p user-emacs-directory)
  (make-directory user-emacs-directory))

(let ((init_dest (expand-file-name "init.el" user-emacs-directory)))
  ;; Extract the Emacs LISP expressions within the Org code blocks in the root init.org file
  ;; Then write the result into init.el at the project root
  (org-babel-tangle-file "init.org" init_dest "emacs-lisp")
  ;; Load the file
  (load-file init_dest)
  ;; Compile the tangled code
  (byte-compile-file init_dest))
