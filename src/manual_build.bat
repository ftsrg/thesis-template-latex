pdflatex --quiet diploma
bibtex -quiet diploma
pdflatex --quiet diploma
pdflatex --quiet diploma

@REM move diploma.pdf ../pdf/diploma.pdf

@del  *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg

