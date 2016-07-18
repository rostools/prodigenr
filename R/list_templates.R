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
    .Deprecated('template_list')
    temp.type <- match.arg(type)
    if (temp.type == 'projects') {
        list.dirs(system.file('templates_old', temp.type, package = package),
                  full.names = FALSE, recursive = FALSE)
    }
}

#' @rdname list_templates
#' @export
template_list <- c('abstract', 'manuscript', 'poster', 'slides')
