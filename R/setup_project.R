
#' Setup a research project.
#'
#' This starts the project by setting up a common folder and file infrastructure,
#' as well as adding some useful files to start.
#'
#' @param name Name of project.
#' @param path Path/location of project.
#'
#' @return
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
        usethis::create_project(proj_path)
        usethis::proj_set(path = proj_path)
        include_readme(proj_path)
        include_r_files(proj_path)
        usethis::use_description()
        capture.output(usethis::use_package('devtools'))
        usethis::use_git()
        invisible(TRUE)
    }
