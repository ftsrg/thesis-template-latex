DOCUMENT = thesis
#MODE=-interaction=batchmode

FLAVOURS := pdflatex xelatex lualatex
LANGUAGES := en hu

OUTDIR := pdf

INPUT_FILES := $(shell find . -type f -iregex '.*\.\(bib\|tex\)') $(shell find ./figures -type f -iregex '.*\.\(png\|pdf\|jpg\|jpeg\|svg\)')

default: pdf/$(DOCUMENT)-xelatex.pdf
	@cp $^ pdf/$(DOCUMENT).pdf
.PHONY: default
.DEFAULT: default


define compile_template

$(1): pdf/$$(DOCUMENT)-$(1).pdf
.PHONY: $(1)

pdf/$$(DOCUMENT)-$(1).pdf: $(INPUT_FILES) | $(OUTDIR)
	$(1) $$(MODE) $$(DOCUMENT)
	bibtex $$(DOCUMENT)
	$(1) $$(MODE) $$(DOCUMENT)
	$(1) $$(MODE) $$(DOCUMENT)
	@mv $$(DOCUMENT).pdf pdf/$$(DOCUMENT)-$(1).pdf

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
	@rm -rf pdf *.pdf
.PHONY: clean-pdf

clean-aux:
	@rm -f *.aux *.dvi *.thm *.lof *.log *.lot *.fls *.out *.toc *.bbl *.blg
.PHONY: clean-aux

$(OUTDIR):
	@mkdir -p $@

