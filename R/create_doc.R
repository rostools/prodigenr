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
    rlang::abort("The folder does not contain an `.Rproj` file. Please use this function while in the project created from `setup_project().`")
  }

  if (!dir.exists("docs")) {
    rlang::abort("What happened to your `docs/` folder?")
  }

  type <- match.arg(type)
  file_name <- normalizePath(file.path("docs", paste0(type, ".qmd")), mustWork = FALSE)
  template_file <- fs::path_package("prodigenr", "rmarkdown", "templates", type)
  if (fs::file_exists(file_name)) {
    rlang::abort(paste0("The file '", type, ".qmd' already exists in the docs folder."))
  } else {
    rmarkdown::draft(
      file = file_name,
      template = template_file,
      package = NULL,
      create_dir = FALSE,
      edit = FALSE
    )
    cli::cli_alert_success("Creating a {.val {type}} file in the {.val {'docs/'}} folder.")
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
