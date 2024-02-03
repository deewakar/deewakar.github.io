# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = docs
DOCTREESDIR   = doctrees
ORGSRCDIR     = org_src
ORG_FILES     = $(wildcard $(ORGSRCDIR)/*.org)
RST_FILES     = $(patsubst $(ORGSRCDIR)/%.org, $(SOURCEDIR)/%.rst, $(ORG_FILES))

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# use 'make convert' to convert all org files in org_src to rst files
convert: $(patsubst $(ORGSRCDIR)/%.org, $(SOURCEDIR)/%.rst, $(ORG_FILES))

$(SOURCEDIR)/%.rst: $(ORGSRCDIR)/%.org
	pandoc -s $< -o $@

.PHONY: convert help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
build: Makefile
	@$(SPHINXBUILD) -M html -d "$(DOCTREESDIR)" "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

