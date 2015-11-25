# Introduction #

This README details how this slide directory is structured, how files
should be run and what the different files do.

The files were created by the
[`prodigenr`](http://github.com/lwjohnst86/prodigenr) package and use
the following programs:

* [R](http://www.r-project.org) (stats)
    * Package: [knitr](http://yihui.name/knitr/) (reproducibility)
* [Git](http://git-scm.com/) (version control system)

Directory structure and explanation
===================================

The project directory is generally structured with `data` and `src`
folders, as well as a version control `.git` folder.  As a caveat,
there may be folders other than the below that were created for an ad
hoc purpose.

`data` folder:
--------------

The `data` folder contains the analysis-specific dataset.  Meaning
this dataset may be a subset of an original dataset, keeping the data
relevant to the research question.

`src` folder:
-------------

The `src` folder contains the R commands and scripts used by all
subsequent scripts and R Markdown files.  There are at least three
files: `fetchData.R` to get, process, and save a dataset; `setup.R` to
load libraries and run options for packages; and, `functions.R` to
hold all custom functions used for the analysis.

