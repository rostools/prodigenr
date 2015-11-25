##' File creation from a template
##'
##' Creates a file from a template (shown in the \code{\link[prodigenr]{listTemplates}} function)
##' @title Create a file based on a template in the \code{prodigenr} package.
##' @param template Template file to use
##' @param output.file Where the template file should be created in
##' @seealso \code{\link[prodigenr]{listTemplates}} for a list of
##' templates available.  \code{\link[rmarkdown]{draft}} for a
##' similar, more developed but slightly more complex function.
##'
##' @export
##' @return Creates a file from a template
##' @examples
##' \dontrun{
##' ## Get a list of the possible file templates
##' listTemplates('files')
##' fileTemplate('eda.R', './eda.R')
##' fileTemplate('eda.R', 'path/to/dir/eda.R')
##' }
fileTemplate <- function(template, output.file = NULL) {

    temp <- match.arg(template, listTemplates('files'))

    if (is.null(output.file)) output.file <- temp

    template.location <-
        system.file('templates','files', temp,
                    package = 'prodigenr')

    file.copy(template.location, output.file)
}
