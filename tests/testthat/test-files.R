context("Creating some files for project.")

new_project <- fs::path_temp("testing-docs")
setup_project(new_project)

test_that("Report and slides created", {
    withr::local_dir(new = new_project)

    quiet_test(create_report())
    quiet_test(create_slides())

    withr::local_dir(new = file.path(new_project, "doc"))
    expect_true(file.exists("report.Rmd"))
    expect_true(file.exists("slides.Rmd"))

    # Needs a Rproj file.
    file.remove("../testing-docs.Rproj")
    file.remove("report.Rmd")
    expect_error(create_report())
})

fs::dir_delete(new_project)
