#===================================================================
# Running this Makefile will run the analysis files in SAS and R to
# create the output files in the output directory.  Before submitting
# the paper to a Journal or writing up the final version of the
# manuscript, type "make" to see all the commands to run and create
# the final report
# ==================================================================
# Settings
# Tells make to use shell for shell commands
SHELL:=/bin/sh 

# Location of project, report, scripts and functions folder
SCRIPTS_DIR = ./scripts
REP_DIR = ./report

#-------------------------------------------------------------------
all : 
	@grep -E '^##' Makefile | sed -e 's/##//g'
##-------------------------------------------------------------------
## These are the options available to use in Make:
##-------------------------------------------------------------------

## final      : Run all Make targets, creating the final manuscript file.
final : clean analysis report

## analysis   : Run all statistical programs to output results.
analysis : 
	$(MAKE) -C $(SCRIPTS_DIR)

## doc     : Create the manuscript in its final format. 
doc : 
	$(MAKE) -C $(REP_DIR)

## clean      : Clean up any extra or output files
clean :
	@find output -type f -delete
	@find doc -type f \( \
		-iname "*.docx" -o \
		-iname "*.pdf" -o \
		-iname "*.html" \) \
		-delete

## readme     : Only need to run if you have edited the README file.
readme : README.md
	@pandoc $< --highlight-style tango -o README.pdf

##-------------------------------------------------------------------

.PHONY : doc analysis clean readme

