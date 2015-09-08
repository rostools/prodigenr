#===================================================================
# This makefile is for the rstatsToolkit package.  Running this
# Makefile will update the documentation and install the package.
# 
# @author Luke Johnston
# @date 2014-11-04
# 
#===================================================================
# Settings
SHELL := /bin/sh 
R_PKG_DIR = /home/luke/R
#-------------------------------------------------------------------
# To not lead to mistakes, use the default make target list the
# commands, rather than run anything.
all : commands
##------------------------------------------------------------------
## commands   : Show all commands in Makefile.
commands :
	@grep -E '^##' Makefile | sed -e 's/##//g'
##------------------------------------------------------------------
## install    : Update the documentation and install the R package.
install :
	@Rscript install.R

## doc_pdf    : Create or update the pdf documentation
doc_pdf :
	@R CMD Rd2pdf --no-preview --force --batch \
		--output=doc/rstatsToolkit.pdf \
		$(R_PKG_DIR)/rstatsToolkit
##------------------------------------------------------------------

