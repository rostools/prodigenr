#' Create a project directory based on a template.
#'
#'
#' Deprecated. Use [setup_project()].
#' Create a project directory and associated files. Is based on using RStudio
#' and the devtools package development way of working with
#' files and code. So commands/keybindings like
#' [devtools::load_all()] (Ctrl-Shift-L) and
#' [devtools::document()] (Ctrl-Shift-D) work to update your code and
#' allow an continuous and integrated approach to analyzing your data and
#' writing up your research product.
#'
#' @param type type of project to create, based on the templates found in
#'   [prodigenr::template_list()] function
#' @param name name of the new project directory
#' @param path location of where the new project will be created
#' @param git.init Logical, whether to initialize the new project with git
#' @return Creates a project directory with files and subdirectories
#' @export
#' @examples
#'
#' \dontrun{\donttest{
#' # Get a list of possible project templates
#' template_list
#' # Create a project. Best done in a fresh R console.
#' prodigen('poster', 'poster', 'dev/', TRUE, FALSE)
#' prodigen('poster', 'poster', 'path/to/dir/', FALSE)
#' prodigen('poster', 'posterName', git.init = FALSE)
#' prodigen('abstract', 'name', './', FALSE)
#' prodigen('manuscript', path = './', git.init = TRUE)
#' }}
prodigen <-
    function(type,
             name = NULL,
             path = getwd(),
             git.init = FALSE) {
        .Deprecated("setup_project")
        type <- match.arg(type, template_list)
        if (is.null(name)) {
            name <- type
        }
        stopifnot(is.character(name))

        proj_path <- file.path(path, name)
        message("* Creating project '", name, "' in '", proj_path, "'.")
        null <- utils::capture.output(suppressMessages(devtools::create(proj_path)))
        include_readme(proj_path)
        include_project_document(type, proj_path)
        include_extra_analyses(proj_path)
        include_rbase_files(proj_path)
        suppressMessages(devtools::use_package('devtools', pkg = proj_path))
        if (git.init) {
            devtools::use_git(pkg = proj_path)
        } else {
            null <- file.remove(file.path(proj_path, '.gitignore'))
        }
        invisible(TRUE)
    }

