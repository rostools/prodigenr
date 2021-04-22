context('Project creation and setup.')
skip_on_cran()

new_project <- fs::path_temp("testing")
setup_project(new_project)

# project creation --------------------------------------------------------

test_that("project is set up", {
    expect_true(fs::dir_exists(new_project))

    files_created <- fs::dir_ls(new_project, recurse = TRUE)
    folders_created <- fs::dir_ls(new_project, type = "directory")
    expect_equal(sort(basename(folders_created)),
                 sort(c("R", "doc", "data", "data-raw")))

    withr::local_dir(new = new_project)
    expect_true(file.exists("DESCRIPTION"))
    expect_true(file.exists("testing.Rproj"))
})

test_that("git gets added", {
    withr::local_dir(new = new_project)
    capture_output(setup_project_with_git())
    expect_true(fs::dir_exists(".git"))
    expect_true(fs::file_exists(".gitignore"))
})

fs::dir_delete(new_project)

test_that("project checks work correctly", {
    expect_error(setup_project(1))

    temp_dir <- tempdir()
    proj_with_space <- fs::file_temp("test new", tmp_dir = temp_dir)
    expect_warning(setup_project(proj_with_space))
    expect_true(fs::file_exists(sub("test new", "test-new", proj_with_space)))
    fs::dir_delete(sub("test new", "test-new", proj_with_space))
})
