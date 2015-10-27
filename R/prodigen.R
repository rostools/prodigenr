##' Create a project directory and associated files.
##'
##' The main workhorse of the \pkg{prodigenr} package.  Creates a
##' project directory layout, with template files and helper scripts
##' such as a Makefile.
##' @title Create a project directory based on a template
##' @param proj.name name of the new project directory
##' @param proj.type type of project to create, based on the templates
##' found in \code{\link[prodigenr]{listTemplates}} function
##' @param proj.path location of where the new project will be created
##' @param git.init Logical, whether to initialize the new project
##' with git
##' @return Creates a project directory with files and subdirectories
##' @export
##' @author Luke W. Johnston
prodigen <- function(proj.name,
                     proj.type,
                     proj.path = '.',
                     git.init = TRUE) {

    proj.type <- match.arg(proj.type, listTemplates('projects'))

    file.copy(
        system.file('templates', 'projects',
                    proj.type, package = 'prodigenr'),
        proj.path, recursive = TRUE
    )
    file.rename(paste0(proj.path, proj.type),
                paste0(proj.path, proj.name))

    if (proj.type == 'manuscript') {
        fileTemplate('eda.R', output.file = file.path(proj.name, 'eda', 'eda.R'))
    }

    if (git.init) {
        repo <- git2r::init(proj.name)
        writeLines('.RData\noutput/\n.Rout\ndata/\n.Rhistory',
                   file.path(proj.name, '.gitignore'))
        git2r::add(repo, unlist(git2r::status(repo, verbose = FALSE)))
        git2r::commit(repo, 'Initial commit')
    }
}
