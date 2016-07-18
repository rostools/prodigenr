context('projects')

# Maybe reorg this so that prodigen project is created, then check that all
# conditions are met...

# Old style ---------------------------------------------------------------

test_that("(Old version) project directory and files created (no git or packrat)", {

    skip_on_cran()
    #skip_on_travis()

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

        suppressWarnings(prodigen(proj.type = type,
                 proj.name = name,
                 proj.path = output.dir,
                 style = 'previous'))

        project.dir <- file.path(output.dir, name)
        project.files <- sort(basename(list.files(project.dir, recursive = TRUE,
                                                  all.files = TRUE, no.. = TRUE,
                                                  ignore.case = TRUE)))
        expected.files <- sort(unname(unlist(expected.files)))

        differences <- setdiff(project.files, expected.files)
        if (length(differences) > 0)
            print(paste(differences))

        expect_true(dir.exists(project.dir))
        expect_true(dir.exists(file.path(project.dir, 'R')))
        expect_identical(project.files, expected.files)

        if (type == 'manuscript') {
            expect_true(dir.exists(file.path(project.dir, 'doc')))
        }

        unlink(project.dir, recursive = TRUE)
        project.files
    }

    testProjects('manuscript')
    testProjects('abstract')
    testProjects('slides')
    testProjects('poster')

    # Test that naming them works too
    testProjects('manuscript', 'man')
    testProjects('abstract', 'abs')
    testProjects('slides', 'sl')
    testProjects('poster', 'pos')
})

# One for git init, one for packrat


# List of templates -------------------------------------------------------

test_that("the number of listed templates is correct", {
    expect_length(suppressWarnings(list_templates()), 4)
    expect_warning(list_templates())
    expect_length(template_list, 4)
})

# Current style -----------------------------------------------------------

expected <- function(path, type, name, license = FALSE, strobe = FALSE,
                     figshare = FALSE, git = FALSE) {
    files <- list(
        base = c(
            '.Rbuildignore',
            paste0(name, '.Rproj'),
            'README.md',
            'NAMESPACE',
            'DESCRIPTION',
            ifelse(license, 'LICENSE', NA),
            ifelse(git, '.gitignore', NA)
        ),
        R = c('functions.R', 'setup.R', 'load_data.R', 'fetch_data.R',
              ifelse(figshare, 'rfigshare.R', NA)),
        vignettes = c(
            paste0(type, '.Rmd'),
            ifelse(strobe, 'strobe-checklist.md', NA)
        )
    )
    switch(type,
           slides = {
               files$vignettes <- c(files$vignettes, 'template.tex')
           },
           poster = {
               files$vignettes <- c(files$vignettes,
                                    'template.tex',
                                    'beamerthemeCustomPoster.sty')
           })

    dirs <- list(
        R = file.path(path, 'R'),
        vignettes = file.path(path, 'vignettes'),
        git = ifelse(git, file.path(path, '.git'), NA)
    )

    expected <- list(
        files = files,
        dirs = dirs
    )
    expected <- stats::na.omit(expected)
    return(expected)
}

test_prodigen <-
    function(type,
             name = NULL,
             license = FALSE,
             strobe = FALSE,
             git = FALSE,
             figshare = FALSE) {
        if (is.null(name))
            name <- type
        path <- tempdir()

        utils::capture.output(prodigen(
            proj.type = type,
            proj.name = name,
            proj.path = path,
            git.init = git,
            style = 'current'
        ))

        path <- file.path(path, name)

        expct <-
            expected(
                path = path,
                type = type,
                name = name,
                figshare = figshare,
                license = license,
                strobe = strobe,
                git = git
            )
        expected_files <- sort(unname(unlist(expct$files)))
        expected_dirs <- expct$dirs

        if (strobe)
            include_strobe(path)
        if (license)
            include_mit_license(path)
        if (figshare)
            include_rfigshare_script(path)

        project_files <-
            sort(basename(
                list.files(
                    path,
                    recursive = TRUE,
                    all.files = TRUE,
                    no.. = TRUE,
                    ignore.case = TRUE
                )
            ))

        differences <- setdiff(project_files, expected_files)
        if (length(differences) > 0) {
            print(paste(differences))
        }

        expect_true(dir.exists(path))
        expect_true(dir.exists(expected_dirs$R))
        expect_true(dir.exists(expected_dirs$vignettes))

        if (git)
            expect_true(dir.exists(expected_dirs$git))

        expect_identical(project_files, expected_files)

        unlink(path, recursive = TRUE)
        project_files
    }

test_that("(current version) project directory and files created (default)", {

    skip_on_cran()
    #skip_on_travis()

    test_prodigen('manuscript')
    test_prodigen('abstract')
    test_prodigen('slides')
    test_prodigen('poster')
})

test_that("(current version) project directory and files created (using name)", {
    skip_on_cran()
    #skip_on_travis()

    # Test that naming them works too
    test_prodigen('manuscript', 'man')
    test_prodigen('abstract', 'abs')
    test_prodigen('slides', 'sl')
    test_prodigen('poster', 'pos')
})

test_that("(current version) project directory and files created (using strobe)", {
    skip_on_cran()
    #skip_on_travis()

    # Test that naming them works too
    test_prodigen('manuscript', strobe = TRUE)
    test_prodigen('abstract', strobe = TRUE)
    test_prodigen('slides', strobe = TRUE)
    test_prodigen('poster', strobe = TRUE)
})

test_that("(current version) project directory and files created (using license)", {
    skip_on_cran()
    #skip_on_travis()

    # Test that naming them works too
    test_prodigen('manuscript', license = TRUE)
    test_prodigen('abstract', license = TRUE)
    test_prodigen('slides', license = TRUE)
    test_prodigen('poster', license = TRUE)
})

test_that("(current version) project directory and files created (using figshare)", {
    skip_on_cran()
    #skip_on_travis()

    # Test that naming them works too
    test_prodigen('manuscript', figshare = TRUE)
    test_prodigen('abstract', figshare = TRUE)
    test_prodigen('slides', figshare = TRUE)
    test_prodigen('poster', figshare = TRUE)
})

# test_that("(current version) project directory and files created (using git)", {
#     skip_on_cran()
#     #skip_on_travis()
#
#     # Test that naming them works too
#     test_prodigen('manuscript', git = TRUE)
#     test_prodigen('abstract', git = TRUE)
#     test_prodigen('slides', git = TRUE)
#     test_prodigen('poster', git = TRUE)
# })
