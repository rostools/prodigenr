#' Fetch data from the original source
#'
#' This function fetches from the main dataset, keeps variables and observations
#' relevant to this specific analysis project, restricts the sample size as
#' needed, and lastly saves the new dataset as an `.rda` file in the `data/`
#' folder. The newly created dataset can be accessed anywhere while in the
#' RStudio project using `devtools::load_all()`.
#'
#' @return Saves the wrangled data into the data/ folder.
#'
#' @examples
#' # Run this command in the console to create the data file.
#' fetch_data()
#'
fetch_data <- function() {
    # Load the main dataset and wrangle as necessary.
    # project_data <- read.table('path/to/file', na = "")
    # Or project_data <- package::package_data
    # Or project_data <- readr::read_csv()

    # Data wrangling commands

    # Save the dataset to the data/ folder.
    devtools::use_data(project_data, overwrite = TRUE)
}
