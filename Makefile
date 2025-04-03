EMACS = emacs
EMACS_BATCH = ${EMACS} -Q --batch
EMACS_EVAL = ${EMACS_BATCH} --eval
EMACS_SCRIPT = ${EMACS_BATCH} --script
EMACS_USER_DIR ?= ${shell ${EMACS_EVAL} "(princ user-emacs-directory)"}

.PHONY: all
all: install

.PHONY: install
install:
	${EMACS_SCRIPT} init.el

.PHONY: clean
clean:
	${RM} ${EMACS_USER_DIR}init.{el,elc}
