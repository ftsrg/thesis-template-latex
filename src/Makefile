DOCUMENT=diploma

xelatex:
	xelatex $(DOCUMENT)
	bibtex $(DOCUMENT)
	xelatex $(DOCUMENT)
	xelatex $(DOCUMENT)
	mv $(DOCUMENT).pdf ../pdf

pdflatex:
	pdflatex $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex $(DOCUMENT)
	pdflatex $(DOCUMENT)
	mv $(DOCUMENT).pdf ../pdf

test: xelatex pdflatex
	mv ../pdf/$(DOCUMENT).pdf ../pdf/$(DOCUMENT)-xelatex.pdf
	mv ../pdf/$(DOCUMENT).pdf ../pdf/$(DOCUMENT)-pdflatex.pdf

clean:
	rm -f *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg
