context("Creating files")

test_that("Manuscript, slides, posters, abstract created", {
    skip_on_cran()

    withr::local_dir(new = new_project)

    quiet_test(create_manuscript())
    quiet_test(create_poster())
    quiet_test(create_slides())
    quiet_test(create_abstract())

    withr::local_dir(new = file.path(new_project, "doc"))
    expect_true(file.exists("manuscript.Rmd"))
    expect_true(file.exists("poster.Rmd"))
    expect_true(file.exists("slides.Rmd"))
    expect_true(file.exists("abstract.Rmd"))

    # Needs a Rproj file.
    file.remove("../testing.Rproj")
    file.remove("manuscript.Rmd")
    expect_error(create_manuscript())
})
