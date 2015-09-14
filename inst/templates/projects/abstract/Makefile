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
## abstract : Run all Make targets, creating the final manuscript file.
abstract : abstract.R
	Rscript -e 'rmarkdown::render($<)'

## get_data : Run the fetchData.R script
get_data :
	(cd src/ && Rscript fetchData.R)

## readme   : Only need to run if you have edited the README file.
readme : README.Rmd
	@Rscript -e 'rmarkdown::render("README.Rmd")'

##-------------------------------------------------------------------

.PHONY : abstract get_data readme

