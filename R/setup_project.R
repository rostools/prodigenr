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
#' # After the new project opens up, add Git with:
#' setup_with_git()
#' }
setup_project <-
    function(path) {
        stopifnot(is.character(path))
        proj_path <- fs::path_abs(path)

        if (grepl(" ", basename(proj_path))) {
            rlang::warn("Project name has a space in it, replacing with a dash (-).")
            proj_path <- path_remove_spaces(proj_path)
        }

        fs::dir_create(proj_path)

        withr::with_dir(
            new = proj_path,
            code = {
                proj_name <- fs::path_file(proj_path)
                add_rproj_file(proj_name)
                add_description_file(proj_name)
                create_directories()
                include_readmes(proj_name)
                add_Rfile(proj_name)
                use_template("TODO.md")
            })
    }

create_directories <- function() {
    fs::dir_create(c("00-Administration", "01-Inputs", "02-Process", "03-Outputs"))
    fs::dir_create(c("00-Administration/Report", "00-Administration/Meetings",
                     "00-Administration/Contract", "00-Administration/Quality"))
    fs::dir_create(c("01-Inputs/Bibliography", "01-Inputs/Methodology", "01-Inputs/Datamanagement"))
    fs::dir_create(c("01-Inputs/Methodology/SAP", "01-Inputs/Methodology/SampleSize"))
    fs::dir_create(c("01-Inputs/Datamanagement/Codebook", "01-Inputs/Datamanagement/AnnotedQuestionnaire"))
    fs::dir_create(c("02-Process/Data-raw", "02-Process/Data","02-Process/Programs", "02-Process/ExtractionGrid"))
    fs::dir_create(c("03-Outputs/Results", "03-Outputs/Posters", "03-Outputs/Articles"))
}

# File inclusion functions --------------------------------------

add_description_file <- function(proj_name) {
    use_template("basic-description", "DESCRIPTION",
                 data = list(ProjectName = proj_name))
}

include_readmes <- function(proj_name) {
    use_template(
        "base-README.md",
        "README.md",
        data = list(ProjectName = proj_name)
    )
    use_template("doc-README.md", "03-Outputs/Results/README.md")
    use_template("data-README.md", "02-Process/Data/README.md")
    use_template("data-raw-README.md", "02-Process/Data-raw/README.md")
    use_template("R-README.md", "02-Process/Programs/README.md")
}




# Git setup functions -------------------------------------------

#' Setup Git to the project.
#'
#' Takes a lot of inspiration from the usethis `use_git()` function, except
#' it only adds Git and nothing more (doesn't commit, doesn't restart RStudio
#' automatically). Must run this function inside the project you created from
#' [setup_project()]
#'
#' @return Adds Git and `.gitignore` file to the project.
#' @export
#' @seealso [setup_project()] for starting the project.
#'
setup_with_git <- function() {
    if (!requireNamespace("gert", quietly = TRUE)) {
        rlang::abort(c("This function relies on the gert package, please install it and then run the function again.",
                       "install.packages('gert')"))
    }

    if (!is_rproj_folder())
        rlang::abort("The folder does not contain an `.Rproj` file. Please use this function while in the project created from `setup_project().`")

    if (has_git()) {
        rlang::abort("The project already has Git added.")
    }

    gert::git_init()
    set_git_ignore_files()
    cli::cli_alert_info("You'll need to restart RStudio to see the Git pane.")
    return(invisible(NULL))
}

# Utilities -----------------------------------------------------

set_git_ignore_files <- function() {
    base::writeLines(c(".Rhistory", ".RData", ".Rproj.user"),
                     ".gitignore")
}

path_remove_spaces <- function(path) {
    path_as_vector <- fs::path_split(path)[[1]]
    last_dir <- length(path_as_vector)
    path_as_vector[last_dir] <- gsub(" +", "-", path_as_vector[last_dir])
    fs::path_join(path_as_vector)
}
