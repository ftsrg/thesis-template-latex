thesis-template-latex
=====================

[![Build status](https://travis-ci.org/FTSRG/thesis-template-latex.svg?branch=master)](https://travis-ci.org/FTSRG/thesis-template-latex)

A [continuously maintained](https://github.com/FTSRG/thesis-template-latex/graphs/contributors) thesis template for LaTeX documents, forked from the [official thesis template](http://diplomaterv.vik.bme.hu/) of BME-VIK (Budapest University of Technology and Economics, Faculty of Electrical Engineering and Informatics). There is also a [Microsoft Word template](https://github.com/FTSRG/thesis-template-word) available.

The latest PDF outputs of the build:

* [`[XeLaTeX HU]`](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-xelatex-hu.pdf) | [`[PDFLaTeX HU]`](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-pdflatex-hu.pdf) | [`[LuaLaTeX HU]`](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-lualatex-hu.pdf)
* [`[XeLaTeX EN]`](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-xelatex-en.pdf) | [`[PDFLaTeX EN]`](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-pdflatex-en.pdf) | [`[LuaLaTeX EN]`](http://docs.inf.mit.bme.hu/thesis-template-latex/thesis-lualatex-en.pdf)

## User's Guide

If you fork this repository, please revise the Travis integration:

* Remove the Slack notification or redirect it.
* Remove the call for the deployment script (`./deploy.sh`) or redirect it. To do this, you will need to use a GitHub token and encrypt it for Travis, which requires Ruby. For details, see [this guide].

Please rename the `thesis.tex` file to something more descriptive, e.g. `john-doe-msc-thesis.tex`. If you are using [`make`](https://www.gnu.org/software/make/) to build the document, also update the [`Makefile`](https://github.com/FTSRG/thesis-template-latex/blob/master/src/Makefile#L1).

For writing LaTeX documents, we recommend the [TeXstudio](http://www.texstudio.org/) editor.

## Troubleshooting

### Build fails

Make sure you get a clean run. For example, to run PDFLaTeX, invoke the build with the following command:

```console
make clean pdflatex
```

### xcolor

The `xcolor` package tends to be problematic on some platforms with outdated TeX distributions.
If you experience problems, try to place the [`xcolor.sty`](https://github.com/FTSRG/thesis-template-latex/blob/8fc7f9d10b1f0f65d8da0ad362492ec65134304f/src/xcolor.sty) file to the `src` directory.

## Improvements

If you found any bugs or missing features that should be included, please raise an [issue](https://github.com/FTSRG/thesis-template-latex/issues). Pull requests are also welcome!
