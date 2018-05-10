context("Creating files")

test_that("Manuscript, slides, posters, abstract created", {
    path <- tempdir()
    make_project("testingProject")
    create_manuscript()
    expect_true(file.exists(path, "doc", "manuscript.Rmd"))

    create_poster()
    expect_true(file.exists(path, "doc", "poster.Rmd"))

    create_slides()
    expect_true(file.exists(path, "doc", "slides.Rmd"))

    create_abstract()
    expect_true(file.exists(path, "doc", "abstract.Rmd"))
})
