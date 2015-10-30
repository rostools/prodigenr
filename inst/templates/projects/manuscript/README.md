# Introduction #

This README details how this research directory is structured, how
files should be run and what the different files do.

The files were created by the
[`prodigenr`](http://github.com/lwjohnst86/prodigenr) package and use
the following programs:

* [GNU Make](http://www.gnu.org/software/make/) (automating executing
  file scripts)
* [Pandoc](http://johnmacfarlane.net/pandoc/) (for Markdown (`.md` or
  `.Rmd`) conversion)
* [R](http://www.r-project.org) (stats)
    * Package: [knitr](http://yihui.name/knitr/) (reproducibility)
* [Git](http://git-scm.com/) (version control system)
* Shell script (e.g. [Bash](http://www.gnu.org/software/bash/); to use
  most of the above programs)

Directory structure and explanation
===================================

The project directory is generally structured with `data`,
`src`, `output`, `doc`, and `eda` folders, as well as a version
control `.git` folder.  As a caveat, there may be folders other than
the below that were created for an ad hoc purpose.

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

`eda` folder:
-----------------

The `eda` folder contains the scripts which runs the exploratory data
analyses.  This folder may or may not be empty, depending on the
demands of the project.  Generating the output from the `eda` scripts
is done through the Makefile (type `make` in the shell to see a list
of options).

`output` folder
---------------

The `output` folder may contain output files generated from the R
scripts or R Markdown files.  The idea behind the output folder is
that you should be able to delete all the files contained within the
folder, run the scripts again, and generate all the necessary result
and report files.  In the parent directory of the project folder, the
Makefile has a command `make clean` that will delete all output files
and as such keeping a clean analysis.

`doc` folder
---------------

The `doc` folder contains the final R Markdown manuscript file(s) for
the project.  Generating the final output document for the manuscript
is done through the Makefile (type `make` to see a list of options).

