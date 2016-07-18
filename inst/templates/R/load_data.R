#' Load the data found in data/.
#'
#' @param update Whether you want to update the dataset using the fetch_data
#'   function.
#' @param project.name Name of your project. Set the default to keep it always
#'   working.
#'
#' @return Outputs the datasets in the data/ folder.
#' @export
#'
#' @examples
#' load_data()
#' load_data(update = TRUE)
#'
load_data <- function(update = FALSE, project.name = NULL) {
    if (is.null(project.name))
        stop('Please change the project.name default to the name of the project.')
    if (!dir.exists(system.file('data', package = project.name)))
        fetch_data()
    if (update)
        fetch_data()
    devtools::load_data()
}
