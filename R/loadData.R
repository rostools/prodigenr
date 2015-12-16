##' Search for .RData file(s) and load into the workspace
##'
##' @title Load .RData file(s)
##' @param path Location of data files
##' @export
##' @author Luke W. Johnston
loadData <- function(path) {
    .Deprecated('load_data', msg = 'Not needed for current workflow.')
    data.files <- list.files(path, pattern = '*.RData$',
                             ignore.case = TRUE,
                             full.names = TRUE)
    if (any(file.exists(data.files))) {
        sapply(data.files, load, .GlobalEnv)
    } else {
        stop('Please fetch or save your data in the data folder.')
    }
}
