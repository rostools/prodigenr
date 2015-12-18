#' Code preamble
#' =============
#'
#' Install packages if they are not installed and load them. Set options for
#' the packages.
#'
run_setup <- function() {
    # Run the following packages for setup
    .load_packages()
    .set_options()
}

.load_packages <- function() {
    # Add your packages you want to use here, using the following format:
    # if (!require(package)) install.packages('package')
    # Or, for github packages:
    # if (!require(package)) packrat::install_github('username/package')
}

.set_options <- function() {
    # Set the options here for individual packages

    # For tables (pander)
#     panderOptions('table.split.table', Inf)
#     panderOptions('table.style', 'rmarkdown')
#     panderOptions('table.alignment.default',
#                   function(df)
#                       ifelse(sapply(df, is.numeric), 'center', 'left'))

    # For the document (knitr)
#     knitr::opts_chunk$set(
#         warning = FALSE, message = FALSE, collapse = TRUE
#     )
}

