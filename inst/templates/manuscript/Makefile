#===================================================================
# This makefile is for the project faDiabetes.  Running this Makefile
# will run the analysis files in SAS and R to create the output files
# in the output directory.  Before submitting the paper to a Journal
# or writing up the final version of the manuscript, type "make" to
# see all the commands to run.
# 
# @author Luke W. Johnston
# @date 2015-01-28
# 
#===================================================================

#-------------------------------------------------------------------
# Settings

# Tells make to use shell for shell commands
SHELL:=/bin/sh 

# Location of project, report, scripts and functions folder
SCRIPTS_DIR = ./scripts
REP_DIR = ./report

#-------------------------------------------------------------------
# To not lead to mistakes, use the default make target list the
# commands, rather than run anything.

all : commands

#-------------------------------------------------------------------
# Targets and commands

##-------------------------------------------------------------------
## commands   : Show all commands in Makefile
commands :
	@grep -E '^##' Makefile | sed -e 's/##//g'

##-------------------------------------------------------------------

## final      : Run all Make targets, creating the final manuscript file.
final : readme clean analysis report

## analysis   : Run all statistical programs to output results.
analysis : 
	$(MAKE) -C $(SCRIPTS_DIR)

## report     : Create the manuscript in its final format. 
report : 
	$(MAKE) -C $(REP_DIR)

## clean      : Delete all extraneous / unnecessary files.
clean :
	@find output -type f -delete
	@find scripts -type f \( \
		-iname "*.Rout" -o \
		-iname "*.out" \) \
		-delete
	@find report -type f \( \
		-iname "*.docx" -o \
		-iname "*.pdf" \) \
		-delete
	@find doc -type f -iname "*.html" \
		-delete

## readme     : Only need to run if you have edited the README file.
readme : README.md
	@sed -i 's/-+-/-|-/g' $<
	@pandoc $< --highlight-style tango -o README.pdf

##-------------------------------------------------------------------

.PHONY : report analysis clean readme

