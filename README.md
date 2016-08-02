thesis-template-latex
=====================

[![Build status](https://travis-ci.org/FTSRG/thesis-template-latex.svg?branch=master)](https://travis-ci.org/FTSRG/thesis-template-latex)

Thesis template for LaTeX documents, forked from the official thesis template of BME-VIK (Budapest University of Technology and Economics, Faculty of Electrical Engineering and Informatics). There is also a [Microsoft Word template](https://github.com/FTSRG/thesis-template-word) available.

Check out the latest PDF outputs:

* [XeLaTeX HU](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-xelatex-hu.pdf)
* [PDFLaTeX HU](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-pdflatex-hu.pdf)
* [XeLaTeX EN](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-xelatex-en.pdf)
* [PDFLaTeX EN](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-pdflatex-en.pdf)

For writing LaTeX documents, we recommend the [TeXstudio](http://www.texstudio.org/) editor.

You should rename the `thesis.tex` file to something more descriptive, e.g. `john-doe-msc-thesis.tex`.

Key improvements (see the Git log for details):
* The template can be imported to Eclipse as a TeXlipse project.
* The files use UTF-8 character encoding.
* The university logo uses vector graphics.
* Added separate directory for tex and bib source files.
* Supports Hungarian and English documents, uses correct date formatting and hyphenation settings for both.
* Added makefile.
* Added support for XeLaTeX.
