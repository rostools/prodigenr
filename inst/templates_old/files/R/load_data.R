# ---(LIKELY) NO NEED TO EDIT---
#
# `load_data()` either loads the dataset inside the `data/` folder or, if the
# `fetch_data.R` file has been changed, will re-run the `fetch_data.R` function
# to update the dataset in `data/` and then loads the dataset.
#
# There are three arguments to this function:
#
# - `local.dataset`: Set the file path to the local dataset (eg. `data/`).
# - `fetch.script`: Set the file path to the `fetch_data.R` function.
# - `force`: Force updating the dataset in `data/` by running the `fetch_data.R`
# function.
#
# Examples for usage:
#
#   ds <- load_data()
#   ds <- load_data(
#       'data/dsname.RData',
#       'R/fetchScript.R')
#
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
