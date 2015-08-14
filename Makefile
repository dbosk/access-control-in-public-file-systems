PUB_SITES?=			csc sys
PUB_FILES= 			anobe-paper.pdf anobe-slides.pdf
PUB_CATEGORY= 		

PUB_SERVER-csc= 	u-shell.csc.kth.se
PUB_METHOD-csc= 	ssh
PUB_DIR-csc= 		~/public_html

PUB_SERVER-sys= 	sftp.sys.kth.se
PUB_METHOD-sys= 	ssh
PUB_DIR-sys= 		~/public_html

.PHONY: all
all: anobe-paper.pdf anobe-slides.pdf

ANOBE_DEPENDS= 		anobe-content.tex
ANOBE_DEPENDS+= 	libbib.sty
ANOBE_DEPENDS+= 	anon.bib crypto.bib
ANOBE_DEPENDS+= 	meta.bib surveillance.bib osn.bib
ANOBE_DEPENDS+= 	ac.bib be.bib
ANOBE_DEPENDS+= 	rfc.bib
ANOBE_DEPENDS+= 	de-centralized.pdf_tex de-centralized.pdf
ANOBE_DEPENDS+= 	decentralized.pdf_tex decentralized.pdf

anobe-paper.pdf: anobe-paper.tex ${ANOBE_DEPENDS}
anobe-paper.pdf: llncs biblatex-lncs

de-centralized.pdf_tex de-centralized.pdf: de-centralized.svg
decentralized.pdf_tex decentralized.pdf: decentralized.svg

anobe-slides.pdf: anobe-slides.tex ${ANOBE_DEPENDS}

makefiles libbib:
	git submodule update --init $@

### INCLUDES ###

INCLUDE_MAKEFILES=makefiles
include ${INCLUDE_MAKEFILES}/depend.mk
include ${INCLUDE_MAKEFILES}/tex.mk
include ${INCLUDE_MAKEFILES}/pub.mk

INCLUDE_LIBBIB=libbib
include ${INCLUDE_LIBBIB}/libbib.mk
