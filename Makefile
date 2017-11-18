SHELL := $(shell which bash) -O globstar -c

DOCUMENT := thesis
#MODE=-interaction=batchmode
HALT=-halt-on-error

FLAVOURS := pdflatex xelatex lualatex
LANGUAGES := en hu

OUTDIR := pdf

INPUT_FILES = $(shell ls **/*.{tex,bib} figures/**/*.{png,pdf,jpg,jpeg,svg,gif} 2>/dev/null)
OUTPUT_FILES := $(OUTDIR) $(DOCUMENT).pdf
AUX_FILES = $(shell ls **/*.{aux,dvi,thm,lof,log,lot,fls,out,toc,bbl,blg} 2>/dev/null)

$(OUTDIR)/$(DOCUMENT).pdf: $(OUTDIR)/$(DOCUMENT)-xelatex.pdf
	@cp $^ $@

define compile_template

$(1): $(OUTDIR)/$$(DOCUMENT)-$(1).pdf
.PHONY: $(1)

$(OUTDIR)/$$(DOCUMENT)-$(1).pdf: $(INPUT_FILES) | $(OUTDIR)
	$(1) $$(MODE) $(HALT) $$(DOCUMENT)
	bibtex $$(DOCUMENT)
	$(1) $$(MODE) $(HALT) $$(DOCUMENT)
	$(1) $$(MODE) $(HALT) $$(DOCUMENT)
	@mv $$(DOCUMENT).pdf $$@

endef

define switch_template

switch_to_$(1):
	@perl -i -p -e 's/^\\\input{include\/thesis-(?!$(1)})/%\\\input{include\/thesis-\1/' $$(DOCUMENT).tex
	@perl -i -p -e 's/^%\\\input{include\/thesis-$(1)}/\\\input{include\/thesis-$(1)}/' $$(DOCUMENT).tex
.PHONY: switch_to_$(1)

endef

$(foreach _,$(FLAVOURS),$(eval $(call compile_template,$_)))

$(foreach _,$(LANGUAGES),$(eval $(call switch_template,$_)))

clean: clean-pdf clean-aux
.PHONY: clean

clean-pdf:
	@rm -rf $(DOCUMENT).pdf $(OUTDIR)
.PHONY: clean-pdf

clean-aux:
	@rm -f $(AUX_FILES)
.PHONY: clean-aux

GH_REPO ?= FTSRG/thesis-template-latex
TGT_BRANCH ?= gh-pages
GIT_USER ?= "FTSRG BME"
GIT_EMAIL ?="ftsrg.bme@gmail.com"

gh-upload: | $(OUTDIR)
	@OUTDIR=$| GH_TOKEN=$(GH_TOKEN) GH_REPO=$(GH_REPO)\
	 GIT_USER=$(GIT_USER) TGT_BRANCH=$(TGT_BRANCH) GIT_EMAIL=$(GIT_EMAIL)\
	 ./scripts/gh_upload.sh

$(OUTDIR):
	@mkdir -p $@

