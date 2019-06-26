quiet <- function(x) {
    # To suppress usethis's messages.
    ops <- options(usethis.quiet = TRUE)
    on.exit(options(ops))
    x
}

is_rproj_folder <- function() {
    rprojroot::is.root_criterion(rprojroot::is_rstudio_project)
}
