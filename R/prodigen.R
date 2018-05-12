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
        message("Using the new function setup_project.")
        if (!missing(type))
            warning("type argument doesn't work.")
        if (!missing(git.init))
            warning("git.init argument doesn't work.")
        setup_project(name = name, path = path)
    }

