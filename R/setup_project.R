#' Setup a standardized folder and file structure for a research analysis project.
#'
#' This starts the project by setting up a common folder and file infrastructure,
#' as well as adding some useful files to start the project.
#'
#' @param path A path to a new directory.
#'
#' @return Project setup with folders and files necessary for a standard research project.
#' @export
#'
#' @examples
#' \dontrun{
#' # Use a temporary location
#' new_proj_name <- fs::path_temp("DiabetesCancer")
#' setup_project(new_proj_name)
#' }
setup_project <-
    function(path) {
        stopifnot(is.character(path))
        proj_path <- fs::path_real(path)

        if (grepl("-| ", basename(proj_path))) {
            stop("New project name has a space or dash in it. Please replace it with either a space or dot '.'", call. = FALSE)
        }

        ui_done("Creating project at {ui_value(proj_path)}")
        create_project(proj_path, rstudio = TRUE, open = FALSE)
        withr::with_dir(
            new = proj_path,
            code = {
                fs::dir_create("R")
                use_description()
                ops <- options(usethis.quiet = TRUE)
                on.exit(options(ops))

                use_package('knitr')
                use_package('rmarkdown')
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
