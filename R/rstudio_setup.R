
rstudio_setup <- function(path, ...) {
    # create project
    quiet(setup_project(path = path))
    invisible()
}
