#===================================================================
# Build process for creating the final or editable version of the
# manuscript.
#-------------------------------------------------------------------
KNIT := knit.R
#-------------------------------------------------------------------
# To not lead to mistakes, use the default make target list the
# commands, rather than run anything.
all : commands
#-------------------------------------------------------------------
# Targets and commands
##------------------------------------------------------------------
## commands   : Show all commands in Makefile
commands :
	@grep -E '^##' Makefile | sed -e 's/##//g'
##------------------------------------------------------------------
## create_doc : Run the knit.R script to generate html and pdf files
create_doc :
	@echo "Generating HTML and PDF documents from R scripts"
	@Rscript $(KNIT)
##------------------------------------------------------------------
