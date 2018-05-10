context("Creating files")

quiet <- function(func) {
    capture_output(func)
}

test_that("Manuscript, slides, posters, abstract created", {
    skip_on_cran()

    path <- tempdir()
    capture.output(setup_project("test.files", path = path))

    withr::local_dir(new = file.path(path, "test.files"))

    # TODO: Will need to remove this eventually
    dir.create("doc")

    quiet(create_manuscript())
    quiet(create_poster())
    quiet(create_slides())
    quiet(create_abstract())

    withr::local_dir(new = file.path(path, "test.files", "doc"))
    expect_true(file.exists("manuscript.Rmd"))
    expect_true(file.exists("poster.Rmd"))
    expect_true(file.exists("slides.Rmd"))
    expect_true(file.exists("abstract.Rmd"))

    # Needs a Rproj file.
    file.remove("../test.files.Rproj")
    expect_error(create_manuscript())
})
