# Fetch data from the original source -------------------------------------
#
# This function fetchs the main dataset, keeps variables relevant to
# the analysis, restrict the sample size as needed, and lastly save
# the new dataset as an `.RData` file. The dot in front of the function hides
# it from the global environment. (Note: the dot before the function hides it in
# the environment)
#
.fetch_data <- function() {
    # Load the master dataset,
    ds.prep <- read.table('path/to/file', na = "")
    # Or ds.prep <- package::package_data

    # Data wrangling commands

    # Final dataset object
    # Save the dataset as an RData file.
    data.file <- file.path('data', 'data.RData')
    if (!file.exists(data.file))
        dir.create('data')
    saveRDS(ds, file = file.path('data', 'data.RData'))
}
