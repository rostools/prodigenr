#' Load the data found in data/.
#'
#' @param update Whether you want to update the dataset using the fetch_data
#'   function.
#' @param project.name Name of your project. Set the default to keep it always
#'   working.
#'
#' @return Outputs the datasets in the data/ folder.
#' @export
#'
#' @examples
#' load_data()
#' load_data(update = TRUE)
#'
load_data <- function(update = FALSE) {
    pkg <- system.file(package = devtools::as.package('.')$package)
    rfile <- normalizePath(file.path(pkg, 'R', 'fetch_data.R'))
    datadir <- normalizePath(file.path(pkg, 'data'))
    if (length(rfile) == 0)
        stop("Oops, fetch_data.R file must have been deleted, please keep it.")
    if (!dir.exists(datadir))
        fetch_data()
    datafile <- list.files(datadir, pattern = 'rda$', full.names = TRUE)
    if (file.mtime(rfile) > file.mtime(datafile))
        fetch_data()
    if (update)
        fetch_data()
    devtools::load_data()
}

# This function loads everything after using `devtools::load_all()` so you don't
# need to include all these functions in each code chunk.
#
.onLoad <- function(libname, pkgname) {
    set_options()
    load_data()
}
