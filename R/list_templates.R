#' List project templates within \pkg{prodigenr}.
#'
#' Get a list of available templates in a package.
#'
#' @param type Type of template (file or directory, aka project)
#' @param package Name of package
#' @return Vector of templates available
#' @export
#' @examples
#'
#' list_templates('projects')
#' list_templates()
#'
list_templates <- function(type = 'projects', package = 'prodigenr') {
    temp.type <- match.arg(type)
    if (temp.type == 'projects') {
        list.dirs(system.file('templates', temp.type, package = package),
                  full.names = FALSE, recursive = FALSE)
    }
}
