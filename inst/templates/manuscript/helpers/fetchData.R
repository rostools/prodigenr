##'
##' Fetch and Process the Data
##' ==========================
##'
##' This script fetchs the database specified in the `config.yaml`
##' file and performs various wrangling and munging tasks.  The final
##' dataset is saved as an `.RData` file in the `data/` folder.
##' 
##' Load the options for the R session.
source("setup.R")

##' Load the master dataset, 
ds <- read.table(paste0(config$database_path, config$database))
                 header = TRUE, na = "", sep = ",") %>%
                     tbl_df()
names(ds)

##' Save the dataset as an RData file.  Create a data directory in
##' case none exists.
datadir <- file.path('..', 'data')
dir.create(datadir)
datafile <- file.path(datadir, paste0(config$project, '.RData'))
save(ds, file = datafile)

