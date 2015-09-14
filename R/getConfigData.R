##' Extract data from the config file
##'
##' A series of functions to extract data from the configuration file
##' found in the parent directory.
##' @title Extract data from the config file
##' @name getConfigData
##' @param config.file location of the config file
##' @author Luke W. Johnston
NULL


##' @rdname getConfigData
##' @export
getBib <- function(config.file) {
    yaml::yaml.load_file(config.file)$bib_file
}

##' @rdname getConfigData
##' @export
getCSL <- function(config.file) {
    yaml::yaml.load_file(config.file)$csl_file
}

##' @rdname getConfigData
##' @export
getData <- function(config.file) {
    yaml::yaml.load_file(config.file)$data_file
}

##' @rdname getConfigData
##' @export
getAuthor <- function(config.file) {
    yaml::yaml.load_file(config.file)$author
}
