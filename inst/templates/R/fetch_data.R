#' Fetch data from the original source
#'
#' This function fetchs the main dataset, keeps variables relevant to
#' the analysis, restrict the sample size as needed, and lastly save
#' the new dataset as an `.RData` file.
#'
#' @return Saves the wrangled data into the data/ folder.
#' @export
#'
#' @examples
#' fetch_data()
#'
fetch_data <- function() {
    # Load the master dataset,
    ds.prep <- read.table('path/to/file', na = "")
    # Or ds.prep <- package::package_data
    # Or ds.prep <- readr::read_csv()

    # Data wrangling commands

    # Final dataset object
    project_data <- ds.prep

    # Save the dataset to the data/ folder.
    devtools::use_data(project_data, overwrite = TRUE)
}
