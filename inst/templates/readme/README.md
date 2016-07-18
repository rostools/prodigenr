# Introduction to this project

This README details how this research directory is structured, how files should
be run, and what the different files do. The layout and setup of this project
was designed for using [RStudio](https://www.rstudio.com/) and
[devtools](https://github.com/hadley/devtools). It is set up this way to make it
easy for others to run your code and analyses for themselves and to skaffold
onto devtools (used for R package development) because it is well documented and
actively maintained.

Typical commands used in this workflow include:

- *Ctrl-Shift-L* (`devtools::load_all()`)
- *Ctrl-Shift-D* (`devtools::document()`)
- *Ctrl-Shift-K* (`rmarkdown::render('file.Rmd')`)
- `devtools::use_package('packagename')` (when using a new R package)

# General folder details

The project directory is generally structured with the following folders:

- Base folder (`./`)
- `R/`
- `vignettes/`
- `data/` (optional)
- `.git` (optional)

## Base (parent) folder

Contains a few files:

- `.gitignore` tells [Git](https://git-scm.com/) to ignore certain files from
being tracked and prevents them from entering the version control history.
- `.Rbuildignore` tells  devtools which files to not include when running
functions such as `devtools::load_all()` or `devtools::install()`.
- `DESCRIPTION` is a standard file included that allows devtools to run it's
functions, which in turn make your life easier for running analyses and writing
up your results. It provides a description of what the project does and most
importantly what R packages your project relies on.
- `NAMESPACE` is also standard for devtools and is used more for others when
they view your code and analyses.
- `.Rproj` is the file to dictate that the directory is a RStudio project.

## `R/` folder:

Contains functions and code used by all subsequent `.R` or `.Rmd` files and can
be accessed by documents in the `vignettes/` by using `devtools::load_all()`.
There are at least four files (probably more):

- `fetch_data.R` to get, process, and save the dataset.
- `load_data.R` loads or updates (if `fetch_data.R` has been changed) the
dataset in the `data/` folder.
- `setup.R` to run options for the packages.
- `functions.R` to hold all custom functions used for the analysis.

## `vignettes/` folder:

Contains (at minimum) the main document file that will present the results of the
analysis and likely also other files that may supplement the main document.

## `data/` folder (optional):

The `data` folder contains the analysis-specific dataset.  Meaning this dataset 
may be a subset of an original dataset, keeping the data relevant to the 
research question without keeping the (potentially) larger dataset around.

# Resource

Since this layout is based on R package development, check out the online book
on [R package development](http://r-pkgs.had.co.nz/) to learn more about how to
make the most use out of this project layout (and why prodigenr structures it
this way).
