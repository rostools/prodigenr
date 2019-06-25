
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
#' path <- tempdir()
#' setup_project("DiabetesCancer", path)
#' }
setup_project <-
    function(name, path = getwd()) {
        stopifnot(is.character(name))
        if (grepl("-| ", name)) {
            warning("name has a space or dash in it. Replacing with '.'", call. = FALSE)
            name <- gsub("-| ", ".", name)
        }

        proj_path <- normalizePath(path = file.path(path, name), mustWork = FALSE)
        create_project(proj_path, rstudio = TRUE)
        ui_done("Creating project at {ui_value(proj_path)}")
        withr::with_dir(
            new = proj_path,
            {
                fs::dir_create("R")
                use_description()
                utils::capture.output(use_package('devtools'))
                utils::capture.output(use_package('knitr'))
                utils::capture.output(use_package('rmarkdown'))
                include_readmes()
                include_r_files()
                use_blank_slate("project")

                git_config <- git2r::config()$global
                if (is.null(git_config$user.name) || is.null(git_config$user.email)) {
                    warning(
                        "Please set your user.name and user.email in your Git config.",
                        " Use git2r::config(user.name = 'name', user.email = 'email').",
                        " After you add your config, open the project and run the command usethis::use_git().",
                        call. = FALSE
                    )
                } else {
                    ui_todo("Adding git")
                    use_git()
                }
            })
        ui_done("Project setup has been completed!")
        ui_todo("Now open {ui_value({paste0(basename(proj_path), '.Rproj'')})} to get started on the project!")
        invisible()
    }
