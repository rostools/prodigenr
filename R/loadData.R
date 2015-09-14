##' Search for .RData file(s) and load into the workspace
##'
##' @title Load .RData file(s)
##' @param path location of data files
##' @export
##' @author Luke W. Johnston
loadData <- function(path) {
    data.files <- list.files(path, pattern = '*.RData$', ignore.case = TRUE)
    data.exists <- length(which(file.exists(data.files)))
    if (data.exists >= 1) {
        sapply(data.files, load, .GlobalEnv)
    } else {
        stop('Please fetch or save your data in the data folder.')
    }
}
