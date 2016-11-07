#' Rstudio addin to render all files in the doc/ folder.
#'
#' @return Generated rmarkdown output.
#' @export
render_docs <- function() {
    proj <- devtools::as.package('.')
    if (!devtools::is.package(proj))
        stop("Please have a DESCRIPTION file with the project name included.")
    doc_dir <- normalizePath(file.path(proj$path, 'doc'))
    rmd_files <- list.files(doc_dir, pattern = '\\.Rmd$', full.names = TRUE)
    for (fi in rmd_files) {
        rmarkdown::render(fi)
    }
    invisible()
}
