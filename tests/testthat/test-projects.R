context('projects are created')

# List of templates -------------------------------------------------------

test_that("the number of listed templates is correct", {
    expect_length(template_list, 4)
})

# old style -----------------------------------------------------------

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
        R = c('functions.R', 'setup.R', 'zzz.R', 'fetch_data.R',
              ifelse(figshare, 'rfigshare.R', NA)),
        vignettes = c('extra-analyses.Rmd',
            ifelse(strobe, 'strobe-checklist.md', NA),
        doc = paste0(type, '.Rmd')
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
        doc = file.path(path, 'doc'),
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
            type = type,
            name = name,
            path = path,
            git.init = git
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

test_that("(old version) project directory and files created (default)", {
    skip_on_cran()
    #skip_on_travis()

    project <- sample(c('manuscript', 'abstract', 'slides', 'poster'), 1)
    test_prodigen(project)
})

test_that("(old version) project directory and files created (using name)", {
    skip_on_cran()
    #skip_on_travis()

    project <- sample(c('manuscript', 'abstract', 'slides', 'poster'), 1)
    test_prodigen(project, 'testname')
})

test_that("(old version) project directory and files created (using strobe)", {
    skip_on_cran()
    skip_on_travis()

    project <- sample(c('manuscript', 'abstract', 'slides', 'poster'), 1)
    test_prodigen(project, strobe = TRUE)
})

test_that("(old version) project directory and files created (using license)", {
    skip_on_cran()
    skip_on_travis()

    project <- sample(c('manuscript', 'abstract', 'slides', 'poster'), 1)
    test_prodigen(project, license = TRUE)
})

test_that("(old version) project directory and files created (using figshare)", {
    skip_on_cran()
    #skip_on_travis()

    project <- sample(c('manuscript', 'abstract', 'slides', 'poster'), 1)
    test_prodigen(project, figshare = TRUE)
})

# test_that("(old version) project directory and files created (using git)", {
#     skip_on_cran()
#     #skip_on_travis()
#
#     # Test that naming them works too
#     test_prodigen('manuscript', git = TRUE)
#     test_prodigen('abstract', git = TRUE)
#     test_prodigen('slides', git = TRUE)
#     test_prodigen('poster', git = TRUE)
# })


# current style -----------------------------------------------------------


test_that("project is set up", {
    skip_on_cran()

    path <- tempdir()
    capture_output(setup_project("testing", path = path))
    proj_path <- file.path(path, "testing")
    expect_true(dir.exists(proj_path))
})
