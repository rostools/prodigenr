
copy_template_file <- function(template, save_as = template) {
    # usethis use_template doesn't work very well right now.
    # use_template(
    #     template = template,
    #     save_as = save_as,
    #     data = data,
    #     package = "prodigenr"
    # )
    template_file <- system.file("templates", template, package = "prodigenr")
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


# Pretty messaging --------------------------------------------------------

# From usethis package (https://github.com/r-lib/usethis)

bullet <- function(lines, bullet) {
  lines <- paste0(bullet, " ", lines)
  cat_line(lines)
}

todo_bullet <- function() crayon::red(clisymbols::symbol$bullet)

todo <- function(...) {
  bullet(paste0(...), bullet = todo_bullet())
}

done <- function(...) {
  bullet(paste0(...), bullet = crayon::green(clisymbols::symbol$tick))
}

cat_line <- function(...) {
  cat(..., "\n", sep = "")
}

value <- function(...) {
  x <- paste0(...)
  crayon::blue(encodeString(x, quote = "'"))
}
