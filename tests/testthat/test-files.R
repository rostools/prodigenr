context("Creating files")

test_that("Report and slides created", {
    skip_on_cran()

    withr::local_dir(new = new_project)

    quiet_test(create_report())
    quiet_test(create_slides())

    withr::local_dir(new = file.path(new_project, "doc"))
    expect_true(file.exists("manuscript.Rmd"))
    expect_true(file.exists("slides.Rmd"))

    # Needs a Rproj file.
    file.remove("../testing.Rproj")
    file.remove("manuscript.Rmd")
    expect_error(create_manuscript())
})
