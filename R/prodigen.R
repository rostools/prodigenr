##' Create a project directory and associated files.
##'
##' The main workhorse of the \pkg{prodigenr} package.  Creates a
##' project directory layout, with template files and helper scripts
##' such as a Makefile.
##' @title Create a project directory based on a template
##' @param proj.name name of the new project directory
##' @param proj.path location of where the new project will be created
##' @param proj.type type of project to create, based on the templates
##' found in \code{\link[prodigenr]{listTemplates}} function
##' @param git.init Logical, whether to initialize the new project
##' with git
##' @return Creates a project directory with files and subdirectories
##' @export
##' @author Luke W. Johnston
prodigen <- function(proj.name, proj.path = '.', proj.type = "manuscript",
                     git.init = TRUE) {

    if (length(nzchar(proj.type)) > 1) {
        stop(paste0('Please supply only one of the following project types:\n',
                    paste(listTemplates('projects'), collapse = ', ')))
    } else if (length(which(listTemplates('projects') %in% proj.type)) > 1) {
        stop(paste0('Please use only these templates:\n',
                   paste(listTemplates('projects'), collapse = ', ')))
    }

    file.copy(system.file("templates", 'projects', proj.type, package = "prodigenr"),
              proj.path, recursive = TRUE)
    file.rename(proj.type, proj.name)

    if (proj.type == 'manuscript') {
        dirList <- c('data', 'output', 'doc', 'eda')
        sapply(dirList, function(x) {
                   dir.create(file.path(proj.name, x))
               })
        fileTemplate('manuscript.Rmd',
                     output.file = file.path(proj.name, 'doc', 'manuscript.Rmd'))
        fileTemplate('eda.R',
                     output.file = file.path(proj.name, 'eda', 'eda.R'))
    }

    if (git.init) {
        repo <- git2r::init(proj.name)
        writeLines('.RData\noutput/\n.Rout', file.path(proj.name, '.gitignore'))
        git2r::add(repo, unlist(git2r::status(repo, verbose = FALSE)))
        git2r::commit(repo, 'Initial commit')
    }
}
