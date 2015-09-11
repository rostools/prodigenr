##' Get a list of available templates in a package
##'
##' 
##' @title List templates within \pkg{prodigenr}.
##' @param type type of template (file or directory, aka project)
##' @param package name of package
##' @return Vector of templates available
##' @export
##' @author Luke W. Johnston
listTemplates <- function(type = c('files', 'projects'), package = 'prodigenr') {
    if (length(nchar(type)) > 1) {
        stop('Use either "files" or "projects" for type.')
    } else if (type == 'files') {
        list.files(system.file('templates', type, package = package), '\\w$')
    } else if (type == 'projects') {
        list.dirs(system.file('templates', type, package = 'prodigenr'),
                  full.names = FALSE, recursive = FALSE)
    } else {
        stop('Use either "files" or "projects" for type.')
    }
}
