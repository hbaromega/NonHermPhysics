TEXFILE = paper_nhse.tex



LATEX = latexmk -f -pdf --shell-escape
#LATEX = pdflatex --shell-escape
#LATEX = latexmk -pdf
#LATEX = latex  # use when there's no .bib file

.PHONY: dvi ps pdf clean

pdf:	$(TEXFILE:.tex=.pdf)
dvi:	$(TEXFILE:.tex=.dvi)

%.pdf: %.tex
	( \
	$(LATEX) $<; \
	while grep -q "Rerun to get cross-references right." $(<:.tex=.log); \
	do \
		latex $<; \
	done \
	)


clean:
	@rm -f \
	$(TEXFILE:.tex=.aux) \
	$(TEXFILE:.tex=.log) \
	$(TEXFILE:.tex=.out) \
	$(TEXFILE:.tex=.dvi) \
	$(TEXFILE:.tex=.pdf) \
	$(TEXFILE:.tex=.ps)

# For more instructions, visit: http://www.math.umbc.edu/~rouben/prosper/makefile.html
