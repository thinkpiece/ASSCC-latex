ENGINE ?= xelatex
MAIN ?= sample
SRC ?= $(MAIN)

.PHONY: pdf clean

pdf:
	$(ENGINE) -interaction=nonstopmode -halt-on-error $(SRC).tex
	$(ENGINE) -interaction=nonstopmode -halt-on-error $(SRC).tex

clean:
	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.fls *.fdb_latexmk
