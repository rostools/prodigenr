##' File creation from a template
##'
##' Creates a file from a template (shown in the \code{\link[prodigenr]{listTemplates}} function)
##' @title Create a file based on a template in the \code{prodigenr} package.
##' @param template template file to use
##' @param output.file
##' @seealso \code{\link[prodigenr]{listTemplates}} for a list of
##' templates available.  \code{\link[rmarkdown]{draft}} for a
##' similar, more developed but slightly more complex function.
##' @export
##' @return Creates a file from a template
##' @author Luke W. Johnston
fileTemplate <- function(template, output.file = NULL) {

    temp <- match.arg(template, listTemplates('files'))

    if (is.null(output.file)) output.file <- temp

    template.location <-
        system.file('templates','files', temp,
                    package = 'prodigenr')

    file.copy(template.location, output.file)
}
