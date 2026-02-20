EMACS ?= emacs
EMACS_Q_ARG = -Q
EMACS_BATCH = ${EMACS} ${EMACS_Q_ARG} --batch
EMACS_EVAL = ${EMACS_BATCH} --eval
EMACS_LOAD = ${EMACS_BATCH} --load
EMACS_USER_DIR != ${EMACS_EVAL} "(princ user-emacs-directory)"

.PHONY: all
all: install

.PHONY: install
install:
	${EMACS_LOAD} init.el

.PHONY: clean
clean:
	${RM} ${EMACS_USER_DIR}init.{el,elc}
