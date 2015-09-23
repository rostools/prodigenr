#===================================================================
# Running this Makefile will run the output from the R files.  Before
# submitting the paper to a journal or writing up the final version of
# the manuscript, type "make" to see all the commands to run and
# create the final report
# ==================================================================
all : 
	@grep -E '^##' Makefile | sed -e 's/##//g'
##-------------------------------------------------------------------
## These are the options available to use in Make:
##-------------------------------------------------------------------
## final  : Run all Make targets, creating the final manuscript file.
final : clean eda doc

## eda    : Run all statistical programs to output results.
eda : output/%.html
output/%.html : eda/%.R
	Rscript -e 'prodigenr::createDoc($<)'

## doc    : Create the manuscript in its final format. 
doc : doc/manuscript.Rmd doc/_output.Ryaml
	Rscript -e 'knitr::knit("doc/_output.Ryaml", "doc/_output.yaml")' \
		-e 'prodigenr::createDoc($<)'
		-e 'unlink("_output.yaml")'

## clean  : Clean up any extra or output files
clean :
	@find output -type f -delete

## readme : Only need to run if you have edited the README file.
readme : README.Rmd
	@Rscript -e 'rmarkdown::render("README.Rmd")'

##-------------------------------------------------------------------

.PHONY : doc analysis clean readme

