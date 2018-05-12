
include_readme <- function() {
    copy_template_file('README.md')
    done('Adding a ', value('README.md'), ' file to the project.')
}

include_r_files <- function() {
    use_template(template = "R-README.md", save_as = file.path("R", "README.md"))
    # copy_template_file("R-README.md", file.path("R", "README.md"))
    done('Adding ', value("README.md"), ' functions to the ',
        value('R/'), ' folder.')
    copy_template_file("setup.R", file.path("R", "setup.R"))
    copy_template_file("fetch_data.R", file.path("R", "fetch_data.R"))
    done('Adding some basic R functions to the ',
        value('R/'), ' folder.')
}

#' License the project under MIT.
#'
#' @param path Path to the project.
#'
#' @return Creates a MIT LICENSE file.
#' @export
include_mit_license <- function(path = '.') {
    if (!requireNamespace('xml2', quietly = TRUE))
        stop('Please install the `xml2` package.')
    if (!requireNamespace('rvest', quietly = TRUE))
        stop('Please install the `rvest` package.')
    path <- devtools::as.package(path)$path
    message("* Adding MIT license to project.")
    mit <- xml2::read_html("http://choosealicense.com/licenses/mit/")
    mit <- rvest::html_node(mit, "#license-text")
    mit <- rvest::html_text(mit)
    devtools::use_mit_license(path)
    license_path <- file.path(path, 'LICENSE')
    utils::capture.output(cat(readLines(license_path), mit, file = license_path))
    invisible()
}

#' Add an R script to send code to figshare.
#'
#' @param path Path to the project.
#'
#' @return Creates an rfigshare script.
#' @export
include_rfigshare_script <- function(path = '.') {
    if (!requireNamespace('rfigshare', quietly = TRUE))
        stop('Please install the `rfigshare` package.')
    message('* Adding rfigshare.R to the R/ folder. Use this to send code to figshare.')
    path <- devtools::as.package(path)$path
    devtools::use_package('rfigshare', pkg = path)
    copy_template_file('rfigshare', file.path(path, 'R'))
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
    utils::capture.output(cat(strobe, file = file_path))
    invisible()
}
