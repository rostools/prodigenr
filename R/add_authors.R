# TODO: Add unit test for these.

#' Add authors to the project metadata.
#'
#' To give credit where credit is due, add these people to the DESCRIPTION file
#' (the project metadata) as (co-)authors. First author is the person responsible
#' for the Git repository, not necessarily for the scientific product.
#'
#' @param first Given or first name.
#' @param last Last or family name.
#' @param role The role of the author. See details below.
#' @param email Optional. Email address.
#' @param orcid Optional. [ORCID](https://orcid.org/) for author.
#'
#' @details For author roles:
#'
#' - "cre" is the one who owns and is responsible for the Git repository and
#' for the code.
#' - "aut" is someone who has contributed substantially to the code, analysis,
#' and repository.
#' - "ctb" is someone who has contributed non-code and non-analysis components
#' to the project.
#'
#' @name add_author
#' @return Adds authors to DESCRIPTION file (the project metadata).
#'
#' @examples
#' \dontrun{
#' # Owner of repo/primarily author who coded/analyzed data.
#' add_first_author("Jim", "Joe", orcid = "0456436")
#'
#' # Made substantial contributions to code/analysis
#' add_coauthor("Jilly", "Bean", role = "aut")
#'
#' # Made non-code/analysis contributions
#' add_coauthor("Tina", "Teller", role = "ctb")
#' }
NULL

#' @rdname add_author
#' @export
add_first_author <- function(first, last, role = c("aut", "cre"), email = NULL, orcid = NULL) {
    orcid <- check_orcid(orcid)
    role <- match.arg(role, choices = c("aut", "cre"), several.ok = TRUE)

    x <- desc::desc_set_authors(
        authors = utils::person(
            given = first,
            family = last,
            email = email,
            role = role,
            comment = orcid
        )
    )

    done("Adding ", x$get_maintainer(), " as first author and/or maintainer of project repository.")
    invisible(x)
}

#' @rdname add_author
#' @export
add_coauthors <- function(first, last, role = "ctb", email = NULL, orcid = NULL) {
    orcid <- check_orcid(orcid)
    role <- match.arg(role, choices = c("aut", "ctb"))

    x <- desc::desc_add_author(
        given = first,
        family = last,
        email = email,
        role = role,
        comment = orcid
    )

    added_author <- grep(paste0(first, " ", last), x$get_authors(), value = TRUE)
    done("Adding ", added_author[1], " as coauthor and contributor to the project.")
    invisible(x)
}

check_orcid <- function(orcid) {
    if (!is.null(orcid)) {
        # TODO: check that orcid is the person. Maybe rorcid package?
        orcid <- c(ORCID = orcid)
    }
    orcid
}
