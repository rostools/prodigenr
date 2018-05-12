
<!-- TODO: Add more to the title of your project here -->
# {{ ProjectName }}

<!-- TODO: Give a brief description of what your project is about -->

# Explanation of project folders and files

This part of the README details how this research directory is structured, how files should
be run, and what the different files do. The layout and setup of this project
was designed for using [RStudio](https://www.rstudio.com/) and
[devtools](https://github.com/hadley/devtools). It is set up this way to make it
easy for others to run your code and analyses for themselves and to skaffold
onto devtools (used for R package development) because it is well documented and
actively maintained. See the excellent [R for Data Science](http://r4ds.had.co.nz/)
online book for more details on how to work with this directory format.

Typical commands used in this workflow include:

- *Ctrl-Shift-L* (`devtools::load_all()`)
- *Ctrl-Shift-K* (`rmarkdown::render('file.Rmd')`)

For more detail on using this project workflow, see [prodigenr](https://lwjohnst86.github.io/prodigenr).

To install all the packages necessary for this project (only if
`usethis::use_package("packagename")` has been used often), run this command
while in the project:

    devtools::install_dev_deps()

# General folder details

The project directory is generally structured with the following folders:

- Base folder (`./`)
- `R/`
- `doc/`
- `data/` 
- `.git` 

The base folder contains a few files:

- `.gitignore` tells [Git](https://git-scm.com/) to ignore certain files from
being tracked and prevents them from entering the version control history.
- `.Rbuildignore` tells  devtools which files to not include when running
functions such as `devtools::load_all()`.
- `DESCRIPTION` is a standard file that includes metadata about your project, in
a machine readable format for others to obtain information on about your
project. It provides a description of what the project does and most importantly
what R packages your project uses on.
- The `.Rproj` file dictates that the directory is a RStudio project. Open the
project by opening this file.

All subsequent folders have their own README inside. See them for more details.

# Resource

Check out the [prodigenr](https://lwjohnst86.github.io/prodigenr) online
documentation for details on this setup and workflow. As this layout is also based
on R packages, check out the online book on [R packages](http://r-pkgs.had.co.nz/) 
to learn more about how to make the most use out of this project layout (and why
prodigenr structures it this way).
