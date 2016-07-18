# Setup description -------------------------------------------------------
#
# These functions are used to setup your files so that all options are in one
# location, and references via the function call.
#
# These functions can be accessed using either `library(projectname)` or
# `devtools::load_all()` (Ctrl-Shift-L in RStudio).

#' Set options for all documents and scripts.
#'
#' @export
#'
#' @examples
#'
#' set_options()
#'
set_options <- function() {
    # Set the options here for individual packages

    # For tables (uncomment below if using pander)
#     pander::panderOptions('table.split.table', Inf)
#     pander::panderOptions('table.style', 'rmarkdown')
#     pander::panderOptions('table.alignment.default',
#                   function(df)
#                       ifelse(sapply(df, is.numeric), 'center', 'left'))

    # For the document (knitr)
    knitr::opts_chunk$set(
        warning = FALSE, message = FALSE, collapse = TRUE
    )
}

