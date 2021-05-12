quiet <- function(x) {
    # To suppress usethis's messages.
    ops <- options(usethis.quiet = TRUE)
    on.exit(options(ops))
    x
}

is_rproj_folder <- function() {
    rprojroot::is.root_criterion(rprojroot::is_rstudio_project)
}

viz_project_tree <- function(path) {
    withr::with_dir(fs::path_temp(),
                    {fs::dir_tree(basename(path), all = TRUE)})
}
