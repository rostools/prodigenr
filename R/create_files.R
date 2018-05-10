
#' Create a file from template.
#'
#' Creates manuscript, slide, poster, or abstract R Markdown files into the doc folder.
#'
#' @param type The file type (e.g. manuscript, slides, etc.)
#'
#' @return A created Rmd file.
#' @export
#'
#' @examples
#' \dontrun{
#' create_file("manuscript") # creates a manuscript.Rmd file in the doc folder.
#' }
create_file <- function(type = c("manuscript", "slides", "poster", "abstract")) {
    if (is_rproj_folder()) {
        stop("The folder does not contain an Rproj file. Please use this function",
             "while in the project created from `setup_project().`", call. = FALSE)
    }

    type <- match.arg(type)
    file_name <- normalizePath(file.path("doc", type))
    rmarkdown::draft(
        file = file_name,
        template = type,
        package = "prodigenr",
        create_dir = FALSE,
        edit = FALSE
        )
}

#' @rdname create_file
create_manuscript <- function() {
    create_file(type = "manuscript")
}

#' @rdname create_file
create_poster <- function() {
    create_file(type = "poster")
}

#' @rdname create_file
create_slides <- function() {
    create_file(type = "slides")
}

#' @rdname create_file
create_abstract <- function() {
    create_file(type = "abstract")
}
