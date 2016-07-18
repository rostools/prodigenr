
copy_template_files <- function(from, to) {
    template_files <- system.file('templates', from,
                                  package = 'prodigenr')
    template_files <- list.files(template_files, all.files = TRUE,
                                 full.names = TRUE,
                                 include.dirs = FALSE)[-1:-2]
    file.copy(template_files, to, recursive = TRUE)
}


