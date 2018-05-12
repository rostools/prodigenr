
#' Create an R Markdown document from template.
#'
#' Creates manuscript, slide, poster, or abstract R Markdown files into the doc folder.
#'
#' @param type The file type (e.g. manuscript, slides, etc.)
#'
#' @return A created Rmd file.
#'
#' @examples
#' \dontrun{
#' create_manuscript()
#' create_poster()
#' create_slides()
#' create_abstract()
#' }
create_doc <- function(type = c("manuscript", "slides", "poster", "abstract")) {
    if (!is_rproj_folder()) {
        stop("The folder does not contain an Rproj file. Please use this function ",
             "while in the project created from `setup_project().`", call. = FALSE)
    }

    if (!dir.exists("doc"))
        stop("What happened to your doc folder?", call. = FALSE)

    type <- match.arg(type)
    file_name <- normalizePath(file.path("doc", paste0(type, ".Rmd")), mustWork = FALSE)
    template_file <- system.file("rmarkdown", "templates", type, package = "prodigenr", mustWork = TRUE)
    if (file.exists(file_name)) {
        warning("The file '", type, ".Rmd' already exists in the doc folder.")
    } else {
        rmarkdown::draft(
            file = file_name,
            template = template_file,
            package = NULL,
            create_dir = FALSE,
            edit = FALSE
        )
        done("Creating '", type, "' file in the doc/ folder.")
    }
}

#' @rdname create_doc
#' @export
create_manuscript <- function() {
    create_doc(type = "manuscript")
}

#' @rdname create_doc
#' @export
create_poster <- function() {
    create_doc(type = "poster")
}

#' @rdname create_doc
#' @export
create_slides <- function() {
    create_doc(type = "slides")
}

#' @rdname create_doc
#' @export
create_abstract <- function() {
    create_doc(type = "abstract")
}
