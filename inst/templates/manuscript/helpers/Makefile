#===================================================================
# Build process for analyzing the data and creating the results files
# and figures.
#-------------------------------------------------------------------
FETCH := fetchData.R
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
## fetch_data : Fetch the main dataset and process it
fetch_data : $(FETCH)
	@echo "Fetching data and processing it."
	@Rscript $?
##------------------------------------------------------------------
