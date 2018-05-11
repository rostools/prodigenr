
copy_template_file <- function(template, save_as = template) {
    template_file <- system.file('templates', template, package = 'prodigenr')
    fs::file_copy(template_file, save_as)
}

is_rproj_folder <- function() {
    rprojroot::is.root_criterion(rprojroot::is_rstudio_project)
}

stop_if_not_rproj_folder <- function() {
    if (!is_rproj_folder()) {
        stop("Run this function in the console while in the R project created from setup_project()",
             call. = FALSE)
    }
}
