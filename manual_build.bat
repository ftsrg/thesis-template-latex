pdflatex --quiet %DOCUMENT%
bibtex -quiet %DOCUMENT%
pdflatex --quiet %DOCUMENT%
pdflatex --quiet %DOCUMENT%

@REM move %DOCUMENT%.pdf ../pdf/%DOCUMENT%.pdf

@del  *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg
