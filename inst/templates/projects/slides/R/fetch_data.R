#' Fetch data from the master dataset.
#'
#' This function fetchs the main dataset, keeps variables relevant to
#' the analysis, restrict the sample size as needed, and lastly save
#' the new dataset as an `.RData` file. The dot in front of the function hides
#' it from the global environment.
#'
.fetch_data <- function(master.dataset) {
    # Load the master dataset,
    ds.prep <- read.table(master.dataset, na = "")

    # Final dataset object
    # Save the dataset as an RData file.
    ds <- ds.prep
    save(ds, file = file.path('data', 'ds.RData'))
}
