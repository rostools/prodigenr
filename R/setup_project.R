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
        proj_path <- fs::path_abs(path)

        if (grepl("-| ", basename(proj_path))) {
            ui_stop("Project name {ui_value(basename(proj_path))} has a space or dash in it. Please replace it with either an underline or a dot '.'")
        }

        ui_done("Created project at {ui_value(proj_path)}")
        # TODO: This keeps sending warning about recursive... need to figure that out
        fs::dir_create(proj_path)
        quiet(proj_set(proj_path, force = TRUE))
        quiet(suppressWarnings(create_project(proj_path, rstudio = TRUE, open = FALSE)))
        withr::with_dir(
            new = proj_path,
            code = {

                quiet({
                    use_description()
                    use_package('knitr')
                    use_package('rmarkdown')
                    include_readmes()
                    include_r_files()
                    use_template("TODO.md", package = "prodigenr")
                    use_blank_slate("project")
                })
                ui_done("Added {ui_value('README.md')} files to the {ui_value('doc/')}, {ui_value('R/')}, {ui_value('data/')}, and parent folders")
                ui_done("Added some template R scripts to the {ui_value('R/')} folder")

                git_config <- git2r::config()$global
                if (is.null(git_config$user.name) || is.null(git_config$user.email)) {
                    ui_warn(c(
                        "Please set your user.name and user.email in your Git config.",
                        " Use {ui_value('git2r::config(user.name = \"name\", user.email = \"email\")')}.",
                        " After you add your config, open the project and run the command usethis::use_git()."
                    ))
                } else {
                    git2r::init(proj_path)
                    quiet(use_git_ignore(c(".Rhistory", ".RData", ".Rproj.user")))
                    ui_done("Project placed under Git version control")
                }
            })
        ui_done("Project setup has been completed!")
        ui_todo("Now open {ui_value(paste0(basename(proj_path), '.Rproj'))} to get started on the project!")
        invisible()
    }
