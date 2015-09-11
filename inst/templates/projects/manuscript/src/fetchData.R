##' ---
##' title: Fetch and Process the Data
##' author: `r getAuthor('../config.yaml')`
##' ---
##' 
##' This script fetchs the main dataset, keeps variables relevant to
##' the analysis, restrict the sample size as needed, and lastly save
##' the new dataset as an `.RData` file.
##' 
##' Load the options for the R session.
runSetup('./')

##' Load the master dataset, 
ds.prep <- tbl_df(read.table(getData('../config.yaml'),
                             header = TRUE, na = "",
                             sep = ","))

ds <- ds.prep

##' Remove all datasets no longer needed.
rm(list=setdiff(ls(), "ds"))

##' Save the dataset as an RData file.  Create a data directory in
##' case none exists.
## Name and location to save dataset
saveRDS(ds, file = file.path('..', 'data', 'dataset.RData'))

