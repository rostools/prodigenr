
copy_template_file <- function(template, save_as = template, data = NULL) {
    use_template(
        template = template,
        save_as = save_as,
        data = data,
        package = "prodigenr"
    )
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
