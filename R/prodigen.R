##' Create a project directory and associated files.
##'
##' The main workhorse of the \pkg{prodigenr} package.  Creates a
##' project directory layout, with template files and helper scripts.
##' @title Create a project directory based on a template
##'
##' @param proj.type type of project to create, based on the templates found in
##'   \code{\link[prodigenr]{list_templates}} function
##' @param proj.name name of the new project directory
##' @param proj.path location of where the new project will be created
##' @param git.init Logical, whether to initialize the new project with git
##' @param packrat.init Logical, whether to track the R package usage with
##'   packrat.
##' @return Creates a project directory with files and subdirectories
##' @export
##' @author Luke W. Johnston
##' @examples
##'
##' \dontrun{
##' ## Get a list of possible project templates
##' list_templates('projects')
##' # Create a project. Best done in a fresh R console.
##' prodigen('poster', 'poster', 'dev/', TRUE, FALSE)
##' prodigen('poster', 'poster', 'path/to/dir/', FALSE)
##' prodigen('poster', 'posterName', git.init = FALSE)
##' prodigen('slides', 'conference-presentation', packrat.init = FALSE)
##' prodigen('abstract', 'name', './', FALSE)
##' prodigen('manuscript', proj.path = './', git.init = TRUE)
##' }
prodigen <- function(proj.type, proj.name = NULL, proj.path = getwd(),
                     git.init = FALSE, packrat.init = FALSE) {

    proj.type <- match.arg(proj.type, list_templates())
    if (is.null(proj.name)) {
        proj.name <- proj.type
    } else if (!is.character(proj.name)) {
        stop('Please use a character string (ie. in quotes) for the project name.')
    }

    if (!dir.exists(proj.path))
        stop('Please use a proj.path that currently exists on your computer.')

    proj_old <- file.path(proj.path, proj.type)
    proj_new <- file.path(proj.path, proj.name)

    if (file.exists(proj_new))
        stop('Project already exists, please use a different proj.name.')

    file.copy(
        system.file('templates', 'projects',
                    proj.type, package = 'prodigenr'),
        proj.path, recursive = TRUE
    )
    file.rename(proj_old, proj_new)

    Rproj_old <- list.files(proj_new, pattern = '*.Rproj', full.names = TRUE)
    Rproj_new <- file.path(proj_new, paste0(proj.name, '.Rproj'))
    file.rename(Rproj_old, Rproj_new)

    if (git.init & requireNamespace('git2r', quietly = TRUE)) {
        repo <- git2r::init(proj_new)
        gitignore.file <- file.path(proj_new, '.gitignore')
        if (!file.exists(gitignore.file))
            file.create(gitignore.file, showWarnings = FALSE)
        write('.RData\n.Rout\ndata/\n.Rhistory\n.Rproj.user',
              file = gitignore.file, append = TRUE)
    }

    if (packrat.init & requireNamespace('packrat', quietly = TRUE)) {
        packrat::init(
            proj_new, enter = FALSE,
            options = list(
                vcs.ignore.lib = TRUE,
                vcs.ignore.src = TRUE
            )
        )
    }

    if (git.init & requireNamespace('git2r', quietly = TRUE)) {
        git2r::add(repo, unlist(git2r::status(repo, verbose = FALSE)))
        git2r::commit(repo, 'Initial commit')
    }

}
