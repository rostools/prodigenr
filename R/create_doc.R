#' Create a basic Quarto document from a template.
#'
#' Creates manuscript/report or slide Quarto file and saves it into
#' the `docs/` folder.
#'
#' @param type The file type (e.g. report, slides).
#'
#' @return A created `.qmd` file in the `docs/` folder.
#'
#' @examples
#' \dontrun{
#' create_report()
#' create_slides()
#' }
create_doc <- function(type = c("report", "slides")) {
  if (!is_rproj_folder()) {
    cli::cli_abort(c(
      "The folder does not contain an {.val .Rproj} file.",
      "i" = "Use while in a project made with {.fn prodigenr::setup_project}."
    ))
  }

  if (!dir.exists("docs")) {
    cli::cli_abort("We can't find a {.path docs/} folder, but need it.")
  }

  type <- rlang::arg_match(type)
  type <- fs::path_ext_set(type, "qmd")
  file_name <- normalizePath(file.path("docs", paste0(type)), mustWork = FALSE)
  template_file <- fs::path_package("prodigenr", "templates", "documents", type)
  if (fs::file_exists(file_name)) {
    cli::cli_abort("The file {.file docs/{type}} already exists.")
  } else {
    fs::file_copy(
      path = template_file,
      new_path = file_name
    )
    cli::cli_alert_success("Created the {.file docs/{type}}!")
  }
  invisible()
}

#' @describeIn create_doc Creates a report Quarto document in the `docs/` folder.
#' @export
create_report <- function() {
  create_doc(type = "report")
  return(invisible())
}

#' @describeIn create_doc Creates a Quarto document for making slides in the `docs/` folder.
#' @export
create_slides <- function() {
  create_doc(type = "slides")
}

#' List project templates within \pkg{prodigenr}.
#'
#' Get a list of available templates in a package.
#'
#' @return Vector of templates available
#' @export
#' @examples
#' template_list
#'
template_list <- c("report", "slides")
