# Setup description -------------------------------------------------------
#
# These functions are used to setup your files so that all options are in one
# location, and references via the function call.
#
# These functions can be accessed using `devtools::load_all()` (Ctrl-Shift-L in RStudio).

#' Set options for all Rmd documents and (very rarely) scripts.
#'
#' @examples
#' # Include this function in the top of an Rmd file.
#' set_project_options()
#'
set_project_options <- function() {
    # Set the options here for individual packages

    # For the document (knitr)
    knitr::opts_chunk$set(
        warning = FALSE, message = FALSE, collapse = TRUE
    )
}

