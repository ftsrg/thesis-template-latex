::######################
:: Run Cleanup  
call:cleanup

:: Run pdflatex
pdflatex diploma.tex
bibtex  diploma.tex
pdflatex diploma.tex
pdflatex diploma.tex

:: Run Cleanup  
call:cleanup  

:: Cleanup Function  
:cleanup  
del *.dvi
del *.out
del *.log 
del *.aux  
del *.bbl    
del *.blg  
del *.brf  
del *.toc  
del *.thm  

goto:eof
::######################