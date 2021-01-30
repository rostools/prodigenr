TODO: Add more to the title of your project here

# {{ ProjectName }}:

TODO: Give a brief description of what your project is about

This project...

# Project details

## Folders and files

Having a standard folder and file structure is one step to being more reproducible.
Here is an explanation of some of the general contents of this project. The
project directory is generally structured with the following folders:

- `R/`: Contains R scripts.
- `doc/`: Contains files related to presenting the project's scientific output
(e.g. manuscript).
- `data/`: Contains the original data and results of the project analyses.
- `.git`: The Git version control history and related files. Used *only* by Git,
do not manually edit.

The base folder contains a few files:

- `.gitignore` tells [Git](https://git-scm.com/) to ignore certain files from
being tracked and prevents them from entering the version control history.
- `DESCRIPTION` is a standard file that includes metadata about your project, in
a machine readable format for others to obtain information on about your
project. It provides a description of what the project does and most importantly
what R packages your project uses on.
- The `{{ProjectName}}.Rproj` file dictates that the directory is a RStudio
project. Open the project by opening this file.

All folders have their own README files inside with more specific details.

## Installing project software dependencies

If dependencies have been managed by using `usethis::use_package("packagename")`
through the `DESCRIPTION` file, installing dependencies is as easy as opening the
`{{ProjectName}}.Rproj` file and running this command in the console:

    # install.packages("remotes")
    remotes::install_deps()

You'll need to have devtools installed for this to work.

## Resource

Check out the [prodigenr](https://rostools.github.io/prodigenr) online
documentation for details on this setup and workflow. As this layout is also based
on R packages, check out the online book on [R packages](http://r-pkgs.had.co.nz/)
to learn more about how to make the most use out of this project layout.
