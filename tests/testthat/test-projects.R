context('projects are created')

# List of templates -------------------------------------------------------

test_that("the number of listed templates is correct", {
    expect_length(template_list, 4)
})

# project creation --------------------------------------------------------


test_that("project is set up", {
    skip_on_cran()

    new_project <- file.path(tempdir(), "testing")
    capture_output(setup_project(new_project))
    expect_true(dir.exists(new_project))

    files_created <- fs::dir_ls(proj_path, recurse = TRUE)
    expect_equal(length(grep("/R/", files_created)), 3)
})
