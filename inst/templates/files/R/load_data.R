# ---(LIKELY) NO NEED TO EDIT---
#
#' Load or fetch the dataset for the project
#'
#' @param local.dataset File path to the local dataset (eg. \code{data/}).
#' @param fetch.script File path to the \code{fetch_data} function.
#'
#' @return Either updates the dataset or loads it in the working environment.
#' @examples
#' ds <- load_data()
#' ds <- load_data(
#'      'data/dsname.RData',
#'      'R/fetchScript.R')
load_data <- function(local.dataset = file.path('data', 'data.RData'),
                      fetch.script = file.path('R', 'fetch_data.R'),
                      force = FALSE) {
    source('.Rprofile')
    if (force) .fetch_data()
    if (!file.exists(fetch.script))
        stop(paste0('Please create a ', fetch.script,
                    ' that contains commands to fetch the data.'))
    if (!file.exists(local.dataset)) {
        dir.create('data')
        .fetch_data()
        message('A dataset has been added and loaded.')
    } else if (file.mtime(fetch.script) > file.mtime(local.dataset)) {
        .fetch_data()
        message('Dataset has been updated and loaded.')
    } else {
        message('Dataset is up-to-date.')
    }

    readRDS(local.dataset)
}
