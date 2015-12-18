# Introduction

This README details how this research directory is structured, how files should
be run and what the different files do. Most of the files here work best with
[RStudio](https://www.rstudio.com/). For instance, to generate the `.Rmd` files,
all you need to do is type `Ctrl-Shift-K` in RStudio. Otherwise, you can run the
`rmarkdown::render('file.Rmd')` command.

# Project details

# Directory details

The project directory is generally structured with `data`, `R`, and `doc`
folders, as well as an optional version control `.git` folder and a `packrat`
folder.  As a caveat, there may be folders other than the below that were
created for an ad hoc purpose.

## `R` folder:

The `R` folder contains the R functions and commands used by all subsequent `.R`
or `.Rmd` files files.  There are at least four files:

- `fetch_data.R` to get, process, and save a dataset
- `load_data.R` to compare the `fetch_data.R` to the local `data/ds.RData` 
dataset and either run `fetch_data.R` again and load it or just load the dataset
into memory.
- `setup.R` to load packages and set options for packages
- `functions.R` to hold all custom functions used for the analysis

## `doc` folder:

The `doc` folder contains the manuscript as well as additional exploratory 
analysis files. Either can be generated simply by running `rmarkdown::render` or
typing `Ctrl-Shift-K` in RStudio.

## `data` folder (optionally present):

The `data` folder contains the analysis-specific dataset.  Meaning this dataset
may be a subset of an original dataset, keeping the data relevant to the
research question.

# How this project was generated:

The files and folders, along with the git and packrat initialization (optional),
were created by the [`prodigenr`](http://github.com/lwjohnst86/prodigenr)
package. They work best when using [RStudio](https://www.rstudio.com/), though
nothing is stopping you from using other programs.
