
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

code_block <- function(..., copy = interactive()) {
  block <- paste0("  ", c(...), collapse = "\n")
  if (copy && clipr::clipr_available()) {
    clipr::write_clip(paste0(c(...), collapse = "\n"))
    message("Copying code to clipboard:")
  }
  cat_line(crayon::make_style("darkgrey")(block))
}

cat_line <- function(...) {
  cat(..., "\n", sep = "")
}

field <- function(...) {
  x <- paste0(...)
  crayon::green(x)
}

value <- function(...) {
  x <- paste0(...)
  crayon::blue(encodeString(x, quote = "'"))
}

code <- function(...) {
  x <- paste0(...)
  crayon::make_style("darkgrey")(encodeString(x, quote = "`"))
}

collapse <- function(x, sep = ", ") {
  paste0(x, collapse = sep)
}
