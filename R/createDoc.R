##' Create documents (word, html) from R scripts or R Markdown files
##'
##' This is a thin wrapper around the \code{\link[rmarkdown]{render}}
##' function.
##' @title Create documents
##' @param file file to convert to output formats
##' @param output.dir path to output folder
##' @return Output document from Rmarkdown conversion.
##' @export
##' @author Luke W. Johnston
createDoc <- function(file, output.dir = './output') {
    rmarkdown::render(file, output_format = 'all',
                      output_dir = output.dir)
}
