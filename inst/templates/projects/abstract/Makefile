#===================================================================
# Running this Makefile will generate the output file for the abstract.
# ==================================================================
# Settings
#-------------------------------------------------------------------
all : 
	@grep -E '^##' Makefile | sed -e 's/##//g'
##-------------------------------------------------------------------
## These are the options available to use in Make:
##-------------------------------------------------------------------
## abstract      : Run all Make targets, creating the final manuscript file.
abstract : abstract.Rmd
	Rscript -e 'rmarkdown::render($<)'
## clean      : Clean up any extra or output files
clean :
	@find output -type f -delete
	@find doc -type f \( \
		-iname "*.docx" -o \
		-iname "*.pdf" -o \
		-iname "*.html" \) \
		-delete

##-------------------------------------------------------------------

.PHONY : abstract clean

