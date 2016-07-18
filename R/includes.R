
include_readme <- function(path) {
    message('* Adding a README.md file to the project.')
    copy_template_files('readme', path)
}

include_project_document <- function(type, path) {
    message('* Adding the main project ', type, ' document to the vignettes/ folder.')
    devtools::use_vignette('placeholder', path)
    file.remove(file.path(path, 'vignettes', 'placeholder.Rmd'))
    copy_template_files(type, file.path(path, 'vignettes'))
}

include_rbase_files <- function(path) {
    message('* Adding some basic R functions to the R/ folder.')
    copy_template_files('R', file.path(path, 'R'))
}

#' License the project under MIT.
#'
#' @param path Path to the project.
#'
#' @return Creates a MIT LICENSE file.
#' @export
include_mit_license <- function(path = '.') {
    if (!requireNamespace('rvest', quietly = TRUE))
        stop('Please install the `rvest` package.')
    path <- devtools::as.package(path)$path
    message("* Adding MIT license to project.")
    mit <- xml2::read_html("http://choosealicense.com/licenses/mit/")
    mit <- rvest::html_node(mit, "#license-text")
    mit <- rvest::html_text(mit)
    devtools::use_mit_license(path)
    license_path <- file.path(path, 'LICENSE')
    capture.output(cat(readLines(license_path), mit, file = license_path))
    invisible()
}

#' Add an R script to send code to figshare.
#'
#' @param path Path to the project.
#'
#' @return Creates an rfigshare script.
#' @export
include_rfigshare_script <- function(path = '.') {
    message('* Adding rfigshare.R to the R/ folder. Use this to send code to figshare.')
    path <- devtools::as.package(path)$path
    devtools::use_package('rfigshare', pkg = path)
    copy_template_files('rfigshare', file.path(path, 'R'))
}

#' Include a STROBE checklist in the project.
#'
#' @param path Path to the project.
#'
#' @return Creates a file with the STROBE checklist.
#' @export
include_strobe <- function(path = '.') {
    if (!requireNamespace('xml2', quietly = TRUE))
        stop('Please install the `xml2` package.')
    if (!requireNamespace('rvest', quietly = TRUE))
        stop('Please install the `rvest` package.')
    path <- devtools::as.package(path)$path
    message('* Adding the STROBE checklist to the vignettes/ folder (this is for observational research).')
    strobe <- xml2::read_html('https://raw.githubusercontent.com/lwjohnst86/scientific-checklists/master/STROBE.md')
    strobe <- rvest::html_text(strobe)
    file_path <- file.path(path, 'vignettes', 'strobe-checklist.md')
    capture.output(cat(strobe, file = file_path))
    invisible()
}
