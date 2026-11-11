(require 'org)

(defun build-and-install (org-source-filepath lisp-destination-filepath)
  "Extract the ELisp expressions within the Org code blocks in the root
`org-source-filepath' file, then write the result into
`lisp-destination-filepath'. It also compiles the ELisp files once
installed."
  (org-babel-tangle-file org-source-filepath
			 lisp-destination-filepath
			 "emacs-lisp")
  (load-file lisp-destination-filepath)
  (byte-compile-file lisp-destination-filepath))

(defun all ()
  "Install then compile my ELisp configuration."
  (unless (file-exists-p user-emacs-directory)
    (make-directory user-emacs-directory))
  (build-and-install "init.org"
		     (expand-file-name "init.el" user-emacs-directory)))

(all)
