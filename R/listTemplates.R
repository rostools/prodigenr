##' Get a list of available templates in a package
##'
##' @title List templates within \pkg{prodigenr}.
##' @param type type of template (file or directory, aka project)
##' @param package name of package
##' @return Vector of templates available
##' @export
##' @author Luke W. Johnston
##' @example
##'
##' listTemplates('files')
##' listTemplates('projects')
##' listTemplates()
##'
listTemplates <- function(type = c('projects', 'files'), package = 'prodigenr') {
    temp.type <- match.arg(type)
    if (temp.type == 'files') {
        list.files(system.file('templates', temp.type, package = package), '\\w$')
    } else if (temp.type == 'projects') {
        list.dirs(system.file('templates', temp.type, package = 'prodigenr'),
                  full.names = FALSE, recursive = FALSE)
    }
}
