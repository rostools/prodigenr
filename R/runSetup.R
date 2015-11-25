##' Load setup.R and functions.R files
##'
##' This function is a thin wrapper around \code{\link{source}}.
##' @title Setup a script for analysis
##' @param path location of the setup files.
##' @export
##' @author Luke W. Johnston
runSetup <- function(path) {
    source(file.path(path, 'setup.R'))
    source(file.path(path, 'functions.R'))
}

