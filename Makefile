#===================================================================
# This makefile is for the prodigenr package.  Running this
# Makefile will update the documentation and install the package.
#===================================================================
# Settings
SHELL := /bin/sh 
PKG = prodigenr
#-------------------------------------------------------------------
# Show options when typing just 'make'
all :
	@grep -E '^##' Makefile | sed -e 's/##//g'
##------------------------------------------------------------------
## These are the possible commands that make will accept.
##------------------------------------------------------------------
## install     : Update the documentation and install the R package.
install : clean doc_pkg install_pkg

## install_pkg : Only install the package
install_pkg :
	@Rscript -e "devtools::install()"

## doc_pkg     : Update the documentation only
doc_pkg :
	@Rscript -e "devtools::document()"

## pdf_pkg     : Create or update the pdf documentation
doc_pdf :
	@R CMD Rd2pdf --no-preview --force --batch \
		--output=inst/doc/$(PKG).pdf \
		../$(PKG)
## clean       : Remove extra files.
clean :
	@find . -type f -iname '*~' -delete
##------------------------------------------------------------------

.PHONY : doc_pkg doc_pdf install_pkg install clean
