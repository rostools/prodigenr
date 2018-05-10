
copy_template_files <- function(from, to) {
    template_files <- system.file('templates', from,
                                  package = 'prodigenr')
    template_files <- list.files(template_files, all.files = TRUE,
                                 full.names = TRUE,
                                 include.dirs = FALSE)[-1:-2]
    file.copy(template_files, to, recursive = TRUE)
}


stop_if_not_rproj_folder <- function() {
    if (!is_rproj_folder()) {
        stop("Run this function in the console while in the R project created from setup_project()",
             call. = FALSE)
    }
}
