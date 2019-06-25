context("Creating files")

quiet <- function(func) {
    capture_output(func)
}

test_that("Manuscript, slides, posters, abstract created", {
    skip_on_cran()

    new_project <- file.path(tempdir(), "testfiles")
    capture_output(setup_project(new_project))

    withr::local_dir(new = new_project)

    quiet(create_manuscript())
    quiet(create_poster())
    quiet(create_slides())
    quiet(create_abstract())

    withr::local_dir(new = file.path(new_project, "doc"))
    expect_true(file.exists("manuscript.Rmd"))
    expect_true(file.exists("poster.Rmd"))
    expect_true(file.exists("slides.Rmd"))
    expect_true(file.exists("abstract.Rmd"))

    # Needs a Rproj file.
    file.remove("../testfiles.Rproj")
    file.remove("manuscript.Rmd")
    expect_error(create_manuscript())
})
