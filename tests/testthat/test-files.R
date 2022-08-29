context("Creating some files for project.")

new_project <- fs::path_temp("testing-docs")
setup_project(new_project)

test_that("Report and slides created", {
    withr::with_dir(new = new_project, {
        capture_output(create_slides())
    })

    withr::with_dir(new = file.path(new_project, "doc"), {
        expect_true(fs::file_exists("slides.Rmd"))
        # Needs a Rproj file.
        fs::file_delete("../testing-docs.Rproj")
        fs::file_delete("slides.Rmd")
        expect_error(create_slides())
    })
})

fs::dir_delete(new_project)
