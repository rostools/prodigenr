
#' Setup a research analysis project.
#'
#' This starts the project by setting up a common folder and file infrastructure,
#' as well as adding some useful files to start.
#'
#' @param name Name of project.
#' @param path Path/location of project.
#'
#' @return Folders and files created for a research project.
#' @export
#'
#' @examples
#' \dontrun{
#' setup_project("DiabetesAge", "~/Documents/research")
#' setup_project("cvd.mortality", "~/Desktop")
#' setup_project("cancer_pollutants")
#' }
setup_project <-
    function(name, path = getwd()) {
        stopifnot(is.character(name))
        if (grepl("-| ", name)) {
            warning("name has a space or dash in it. Replacing with '.'", call. = FALSE)
            name <- gsub("-| ", ".", name)
        }

        proj_path <- normalizePath(path = file.path(path, name), mustWork = FALSE)
        usethis:::done("Creating project '", name, "' in '", proj_path, "'.")
        usethis::create_project(proj_path, rstudio = TRUE)
        include_readme(proj_path)
        include_r_files(proj_path)
        withr::with_dir(
            new = proj_path,
            {
                usethis::use_description()
                utils::capture.output(usethis::use_package('devtools'))
                utils::capture.output(usethis::use_package('knitr'))
                utils::capture.output(usethis::use_package('rmarkdown'))
                usethis::use_git()
            })
        invisible(TRUE)
    }
