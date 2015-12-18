# ---NO NEED TO EDIT---
#
#' Load or fetch the dataset for the project
#'
#' @param master.dataset File path to the master dataset to fetch and wrangle from.
#' @param local.dataset File path to the local dataset (eg. \code{data/}).
#' @param fetch.script File path to the \code{fetch_data} function.
#'
#' @return Either updates the dataset or loads it in the working environment.
#' @export
#'
#' @examples
#' \dontrun{
#' load_data('/path/to/master/dataset/')
#' load_data('/path/to/master/dataset/',
#'      'data/dsname.RData',
#'      'R/fetchScript.R')
#' }
load_data <- function(master.dataset, local.dataset = file.path('data', 'ds.RData'),
                      fetch.script = file.path('R', 'fetch_data.R')) {
    if (!file.exists(fetch.script))
        stop('Please create a file under the R folder that contains a function called fetch_data.')
    if (!file.exists(local.dataset)) {
        dir.create('data')
        .fetch_data(master.dataset)
        message('A dataset has been added and loaded.')
    } else if (file.mtime(fetch.script) > file.mtime(local.dataset)) {
        .fetch_data(master.dataset)
        message('Dataset has been updated and loaded.')
    } else {
        message('Dataset is up-to-date.')
    }

    load(local.dataset)
}
