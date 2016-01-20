#' Code preamble
#' =============
#'
#' Install packages if they are not installed and load them. Set options for
#' the packages.
#'
#' *No need to edit*
run_setup <- function() {
    # Run the following packages for setup
    .load_packages()
    .set_options()
    # Run twice just in case some weren't loaded.
    .load_packages()
}

# Edit as needed
.load_packages <- function() {
    # Add your packages you want to use here, using the following format:
    # - For pre-bundled packages:
    # library(package)

    # - For CRAN packages:
    # if (!require(package)) install.packages('package')

    # - For github packages:
    # if (!require(package)) packrat::install_github('username/package')

}

# Edit as needed
.set_options <- function() {
    # Set the options here for individual packages

    # For tables (uncomment below if using pander)
#     panderOptions('table.split.table', Inf)
#     panderOptions('table.style', 'rmarkdown')
#     panderOptions('table.alignment.default',
#                   function(df)
#                       ifelse(sapply(df, is.numeric), 'center', 'left'))

    # For the document (knitr)
    knitr::opts_chunk$set(
        warning = FALSE, message = FALSE, collapse = TRUE
    )
}

