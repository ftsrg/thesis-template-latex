DOCUMENT=diploma

xelatex: compile_xelatex
	mv $(DOCUMENT)-xelatex.pdf ../pdf/$(DOCUMENT).pdf

compile_xelatex:
	xelatex $(DOCUMENT)
	bibtex $(DOCUMENT)
	xelatex $(DOCUMENT)
	xelatex $(DOCUMENT)
	mv $(DOCUMENT).pdf $(DOCUMENT)-xelatex.pdf

pdflatex: compile_pdflatex
	mv $(DOCUMENT)-pdflatex.pdf ../pdf/$(DOCUMENT).pdf

compile_pdflatex:
	pdflatex $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex $(DOCUMENT)
	pdflatex $(DOCUMENT)
	mv $(DOCUMENT).pdf $(DOCUMENT)-pdflatex.pdf
	
test_hu: clean compile_xelatex clean compile_pdflatex
	mv $(DOCUMENT)-xelatex.pdf ../pdf/$(DOCUMENT)-xelatex-hu.pdf
	mv $(DOCUMENT)-pdflatex.pdf ../pdf/$(DOCUMENT)-pdflatex-hu.pdf
	
switch_to_english:
	sed -i "s|\\\input{include/thesis-hu}|%\\\input{include/thesis-hu}|" $(DOCUMENT).tex
	sed -i "s|%\\\input{include/thesis-en}|\\\input{include/thesis-en}|" $(DOCUMENT).tex

test_en: switch_to_english clean compile_xelatex clean compile_pdflatex
	mv $(DOCUMENT)-xelatex.pdf ../pdf/$(DOCUMENT)-xelatex-en.pdf
	mv $(DOCUMENT)-pdflatex.pdf ../pdf/$(DOCUMENT)-pdflatex-en.pdf

test: test_hu test_en
	;

clean:
	rm -f *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg
