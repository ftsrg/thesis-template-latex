DOCUMENT=thesis
#MODE=-interaction=batchmode

all: clean xelatex
	echo

xelatex: compile_xelatex
	mv $(DOCUMENT)-xelatex.pdf ../pdf/$(DOCUMENT).pdf

compile_xelatex:
	xelatex $(MODE) $(DOCUMENT)
	bibtex $(DOCUMENT)
	xelatex $(MODE) $(DOCUMENT)
	xelatex $(MODE) $(DOCUMENT)
	mv $(DOCUMENT).pdf $(DOCUMENT)-xelatex.pdf

pdflatex: compile_pdflatex
	mv $(DOCUMENT)-pdflatex.pdf ../pdf/$(DOCUMENT).pdf

compile_pdflatex:
	pdflatex $(MODE) $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex $(MODE) $(DOCUMENT)
	pdflatex $(MODE) $(DOCUMENT)
	mv $(DOCUMENT).pdf $(DOCUMENT)-pdflatex.pdf

lualatex: compile_lualatex
	mv $(DOCUMENT)-lualatex.pdf ../pdf/$(DOCUMENT).pdf

compile_lualatex:
	lualatex $(MODE) $(DOCUMENT)
	bibtex $(DOCUMENT)
	lualatex $(MODE) $(DOCUMENT)
	lualatex $(MODE) $(DOCUMENT)
	mv $(DOCUMENT).pdf $(DOCUMENT)-lualatex.pdf

switch_to_hungarian:
	sed -i "s|^\\\input{include/thesis-en}|%\\\input{include/thesis-en}|" $(DOCUMENT).tex
	sed -i "s|^%\\\input{include/thesis-hu}|\\\input{include/thesis-hu}|" $(DOCUMENT).tex

test_hu:
	${MAKE} clean compile_xelatex
	${MAKE} clean compile_pdflatex
	${MAKE} clean compile_lualatex
	mv $(DOCUMENT)-xelatex.pdf ../pdf/$(DOCUMENT)-xelatex-hu.pdf
	mv $(DOCUMENT)-pdflatex.pdf ../pdf/$(DOCUMENT)-pdflatex-hu.pdf
	mv $(DOCUMENT)-lualatex.pdf ../pdf/$(DOCUMENT)-lualatex-hu.pdf

switch_to_english:
	sed -i "s|^\\\input{include/thesis-hu}|%\\\input{include/thesis-hu}|" $(DOCUMENT).tex
	sed -i "s|^%\\\input{include/thesis-en}|\\\input{include/thesis-en}|" $(DOCUMENT).tex

test_en:
	${MAKE} switch_to_english
	${MAKE} clean compile_xelatex
	${MAKE} clean compile_pdflatex
	${MAKE} clean compile_lualatex
	mv $(DOCUMENT)-xelatex.pdf ../pdf/$(DOCUMENT)-xelatex-en.pdf
	mv $(DOCUMENT)-pdflatex.pdf ../pdf/$(DOCUMENT)-pdflatex-en.pdf
	mv $(DOCUMENT)-lualatex.pdf ../pdf/$(DOCUMENT)-lualatex-en.pdf
	${MAKE} switch_to_hungarian

test: test_hu test_en
	echo

clean:
	echo Cleaning temporary files...
	rm -f *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg
