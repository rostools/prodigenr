#===================================================================
# Running this Makefile will run the analysis files in SAS and R to
# create the output files in the output directory.  Before submitting
# the paper to a Journal or writing up the final version of the
# manuscript, type "make" to see all the commands to run and create
# the final report
# ==================================================================
all : 
	@grep -E '^##' Makefile | sed -e 's/##//g'
##-------------------------------------------------------------------
## These are the options available to use in Make:
##-------------------------------------------------------------------

## create_slides      : Create the pdf slides.
create_slides : slides. pdf

slides.pdf : slides.Rmd
	Rscript -e 'rmarkdown::render($<)'

## readme : Only need to run if you have edited the README file.
readme : README.Rmd
	@Rscript -e 'rmarkdown::render($<)'

##-------------------------------------------------------------------

.PHONY : create_slides readme

