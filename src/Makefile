DOCUMENT=diploma

xelatex: compile_xelatex
	mv $(DOCUMENT)-xelatex.pdf ../$(DOCUMENT).pdf

compile_xelatex:
	xelatex $(DOCUMENT)
	bibtex $(DOCUMENT)
	xelatex $(DOCUMENT)
	xelatex $(DOCUMENT)
	mv $(DOCUMENT).pdf $(DOCUMENT)-xelatex.pdf

pdflatex: compile_pdflatex
	mv $(DOCUMENT).pdf ../pdf

compile_pdflatex:
	pdflatex $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex $(DOCUMENT)
	pdflatex $(DOCUMENT)
	mv $(DOCUMENT).pdf $(DOCUMENT)-pdflatex.pdf
	
test: clean compile_xelatex clean compile_pdflatex
	mv $(DOCUMENT)-xelatex.pdf ../pdf/
	mv $(DOCUMENT)-pdflatex.pdf ../pdf/

clean:
	rm -f *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg
