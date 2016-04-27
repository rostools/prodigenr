context('projects')

test_that("projects created (no git or packrat)", {

    skip_on_cran()

    testProjects <- function(type, name = NULL) {
        if (is.null(name)) name <- type
        output.dir <- tempdir()
        expected.files <- list(
            base = c('.Rprofile', paste0(name, '.Rproj'), 'README.md'),
            R = c('functions.R', 'setup.R', 'load_data.R', 'fetch_data.R')
        )
        rmd.file <- paste0(type, '.Rmd')
        switch(type,
               manuscript = {
                   expected.files$doc <-  rmd.file
               },
               slides = {
                   expected.files$base <- c(expected.files$base, 'template.tex',
                                            rmd.file)
               },
               poster = {
                   expected.files$base <- c(expected.files$base, 'template.tex',
                                          'beamerthemeCustomPoster.sty',
                                          rmd.file)
               },
               abstract = {
                   expected.files$base <- c(expected.files$base, rmd.file)
               })

        capture.output(prodigen(proj.type = type,
                                proj.name = name,
                                proj.path = output.dir))

        project.dir <- file.path(output.dir, name)
        project.files <- sort(basename(list.files(project.dir, recursive = TRUE,
                                                  all.files = TRUE, no.. = TRUE)))
        expected.files <- sort(unname(unlist(expected.files)))

        differences <- setdiff(project.files, expected.files)
        if (length(differences) > 0)
            warning(paste0(differences))

        expect_true(dir.exists(project.dir))
        expect_true(dir.exists(file.path(project.dir, 'R')))
        expect_identical(project.files, expected.files)

        if (type == 'manuscript') {
            expect_true(dir.exists(file.path(project.dir, 'doc')))
        }

        unlink(project.dir, recursive = TRUE)
    }

    testProjects('manuscript')
    testProjects('abstract')
    testProjects('slides')
    testProjects('poster')

    testProjects('manuscript', 'man')
    testProjects('abstract', 'abs')
    testProjects('slides', 'sl')
    testProjects('poster', 'pos')
})

# One for git init, one for packrat

test_that("There are the correct number of templates", {
    expect_length(list_templates(), 4)
})
