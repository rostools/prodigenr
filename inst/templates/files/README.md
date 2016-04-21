# Introduction to this project

This README details how this research directory is structured, how files should
be run, and what the different files do. Most of the files here work best with
[RStudio](https://www.rstudio.com/); in fact, this package was designed with
RStudio in mind. So, for instance, to generate the `.Rmd` files, all you need to
do is type `Ctrl-Shift-K` in RStudio. Otherwise, you can run the 
`rmarkdown::render('file.Rmd')` command.

# General folder details

The project directory is generally structured with *at least* an `R/` folder,
and *optionally* these folders:

- `data` (optional)
- `.git` (optional)
- `.packrat` (optional)

## `R/` folder:

The `R/` folder contains the R functions and commands used by all subsequent `.R`
or `.Rmd` files files, which are loaded using the `.Rprofile` file. There are
at least four files in the `R/` folder:

- `fetch_data.R` to get, process, and save a dataset.
- `load_data.R` loads the dataset, either updating the dataset because of a
change in the `fetch_data.R` script or just loads the `.RData` dataset in the
`data/` folder.
- `setup.R` to load packages and set options for packages.
- `functions.R` to hold all custom functions used for the analysis.

## `data` folder (optionally present):

The `data` folder contains the analysis-specific dataset.  Meaning this dataset 
may be a subset of an original dataset, keeping the data relevant to the 
research question without keeping the (potentially) larger dataset around.

