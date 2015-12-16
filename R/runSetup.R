##' Load setup.R and functions.R files
##'
##' This function is a thin wrapper around \code{\link{source}}.
##' @title Setup a script for analysis
##' @param path location of the setup files.
##' @export
##' @author Luke W. Johnston
runSetup <- function(path) {
    .Deprecated('run_setup', msg ='No longer needed for current workflow.')
    source(file.path(path, 'setup.R'))
    source(file.path(path, 'functions.R'))
}

