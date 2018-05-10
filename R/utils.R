
copy_template_files <- function(from, to) {
    template_files <- system.file('templates', from,
                                  package = 'prodigenr')
    template_files <- list.files(template_files, all.files = TRUE,
                                 full.names = TRUE,
                                 include.dirs = FALSE)[-1:-2]
    file.copy(template_files, to, recursive = TRUE)
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
