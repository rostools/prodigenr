
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Project creation with prodigenr: A component of reproducible and open scientific projects <img src="man/figures/logo.png" align="right" />

<!-- badges: start -->

[![CRAN Status
Badge](http://www.r-pkg.org/badges/version/prodigenr)](https://cran.r-project.org/package=prodigenr)
[![R-CMD-check](https://github.com/rostools/prodigenr/workflows/R-CMD-check/badge.svg)](https://github.com/rostools/prodigenr/actions)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/prodigenr)](https://www.r-pkg.org:443/pkg/prodigenr)
<!-- badges: end -->

This [R](https://cran.r-project.org) package is part of a
[series](https://github.com/rostools) of (planned) packages that are
aimed at creating a toolkit for doing reproducible and open science.
Many researchers (especially in biomedicine, medicine, or health, which
is my area of research) have little to no knowledge on what open science
is or what reproducibility is, let alone how to do it. Our goal is
create an [(opinionated) toolkit](https://rostools.gitlab.io/manifesto)
to automate and simplify the process of doing open and reproducible
science.

This specific package is a *pro*ject *di*rectory *gen*erato*r*
(prodigenr). It will create a standardized project folder structure with
the necessary template files for managing and analyzing data and for
creating common scientific output (e.g. manuscripts). Because of the
standardized structure and because of the focus on a “one project, one
scientific output”, this allows the final code and documents to be
fairly modular, self-contained, easy to share and make public… and be as
reproducible as possible. This folder structure also makes use of the
existing and established applications and workflows
([RStudio](https://www.rstudio.com/),
[devtools](https://CRAN.R-project.org/package=devtools), and
[usethis](https://CRAN.R-project.org/package=usethis)). This package
aims to make it easier to adhere to open scientific practices by
following a standard, consistent, and established folder and file
structure for data analysis projects.

## Installation

You can install the released version of prodigenr from
[CRAN](https://cran.r-project.org) with:

``` r
install.packages("prodigenr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("rostools/prodigenr")
```

## Usage

There are two ways of creating a new project: using the R console or
using the RStudio “New Project” menu option.

Through the console, use the `setup_project()` command. So, for
instance, if you want a manuscript project, type out:

``` r
library(prodigenr)
setup_project("~/Desktop/DiseaseDiet")
```

This then creates a directory tree, with template files for starting
your analysis! Open the newly created project via the `.Rproj` file. For
the RStudio approach, go to “File -&gt; New Project”, then “New
directory” and find the prodigenr project in the list:

![Creating a prodigenr project in
RStudio](man/figures/rstudio-projects.gif)

Once in the project, you can add a manuscript R Markdown file or poster
using:

``` r
create_manuscript() 
# Or...
create_poster()
```

The main secondary function is the `template_list` command, which lists
the available template files (submit a PR if you want another template
included!):

``` r
template_list
#> [1] "report" "slides"
```

<!-- TODO: Add gif for using RStudio "new file" -->

For a more detailed tutorial, see the introduction vignette:

``` r
vignette('prodigenr', 'prodigenr')
```

## Related packages or projects

There are several existing packages for creating projects, each of which
has it’s own pros and cons. Try them out and see which you like!

-   [ProjectTemplate](http://projecttemplate.net/)
-   [makeProject](https://cran.r-project.org/package=makeProject)
-   R package structure via
    [devtools](https://CRAN.R-project.org/package=devtools), argued for
    in this
    [blog](https://rmflight.github.io/posts/2014/07/vignetteAnalysis.html)
-   [rrtools](https://github.com/benmarwick/rrtools)

prodigenr tries to use ideas from R
packages/[devtools](https://CRAN.R-project.org/package=devtools) while
still being as simple as possible and to be more specific to academic
researchers primarily in biomedical/non-computer science fields.
However, it can always improve! I welcome any suggestions, just submit a
[GitHub issue](https://github.com/rostools/prodigenr/issues)!

## Interested in contributing?

See the [contributing
documentation](http://rostools.github.io/prodigenr/CONTRIBUTING.html)
for information on how to contribute. Please note that this project is
released with a [Contributor Code of
Conduct](http://rostools.github.io/prodigenr/CODE_OF_CONDUCT.html). By
participating in this project you agree to abide by its terms.

Special thanks to \[@zsemnani\](<https://twitter.com/zsemnani?lang=en>)
for creating the logo!
