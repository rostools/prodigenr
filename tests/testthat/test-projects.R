context('projects are created')

# List of templates -------------------------------------------------------

test_that("the number of listed templates is correct", {
    expect_length(template_list, 4)
})

# project creation --------------------------------------------------------


test_that("project is set up", {
    skip_on_cran()

    path <- tempdir()
    capture_output(setup_project("testing", path = path))
    proj_path <- file.path(path, "testing")
    expect_true(dir.exists(proj_path))

    files_created <- fs::dir_ls(proj_path, recursive = TRUE)
    expect_equal(length(grep("/R/", files_created)), 3)
})
