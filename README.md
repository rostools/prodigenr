
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Project creation with prodigenr: A component of reproducible and open scientific projects <img src="man/figures/logo.png" style="text-align: right;"/>

<!-- badges: start -->

[![CRAN Status
Badge](http://www.r-pkg.org/badges/version/prodigenr)](https://cran.r-project.org/package=prodigenr)
[![R-CMD-check](https://github.com/rostools/prodigenr/workflows/R-CMD-check/badge.svg)](https://github.com/rostools/prodigenr/actions)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/prodigenr)](https://www.r-pkg.org:443/pkg/prodigenr)

<!-- badges: end -->

This package has a simple aim of being a *pro*ject *di*rectory
*gen*erato*r* (prodigenr), with a simple focus on:

1.  Creating a standardized project folder structure with a few template
    files needed for beginning a data analysis project.
2.  Following a “one project, one (main) output” principle, such as a
    report/manuscript in the case of scientific output or a book or
    website for things like courses or workshops.
3.  Adhering to established best practices that make it easier for the
    project to be reproducible and open.

This standardized approach to how a scientific project is structured
helps ensure that the final code and documents are fairly modular,
self-contained, easy to share and make public, and be as reproducible as
possible. The structure also makes use of the existing and established
applications and workflows ([RStudio](https://www.rstudio.com/),
[devtools](https://CRAN.R-project.org/package=devtools), and
[usethis](https://CRAN.R-project.org/package=usethis)).

## Installation

You can install the released version of prodigenr from
[CRAN](https://cran.r-project.org) with:

``` r
install.packages("prodigenr")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("rostools/prodigenr")
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
the RStudio approach, go to “File -\> New Project”, then “New directory”
and find the prodigenr project in the list:

<figure>
<img src="man/figures/rstudio-projects.gif"
alt="Creating a prodigenr project in RStudio" />
<figcaption aria-hidden="true">Creating a prodigenr project in
RStudio</figcaption>
</figure>

Once in the project, you can add a manuscript/report
[Quarto](https://quarto.org/) file using:

``` r
create_report() 
```

The main secondary function is the `template_list` command, which lists
the available template files:

``` r
template_list
#> [1] "report" "slides"
```

For a more detailed tutorial, see the introduction vignette:

``` r
vignette('prodigenr', 'prodigenr')
```

## Related packages or projects

There are several existing packages for creating projects, each of which
has it’s own pros and cons. Check out the last section of the
`vignette("prodigenr")` for more details. Try them out and see which you
like!

prodigenr tries to use ideas from R
packages/[devtools](https://CRAN.R-project.org/package=devtools) while
still being as simple as possible and to be more specific to academic
researchers primarily in biomedical/non-computer science fields.
However, it can always improve! I welcome any suggestions, just submit a
[GitHub issue](https://github.com/rostools/prodigenr/issues).

## Interested in contributing?

See the [contributing
documentation](https://rostools.github.io/prodigenr/CONTRIBUTING.html)
for information on how to contribute. Please note that this project is
released with a [Contributor Code of
Conduct](https://rostools.github.io/prodigenr/CODE_OF_CONDUCT.html). By
participating in this project you agree to abide by its terms.

Special thanks to [@zsemnani](https://twitter.com/zsemnani?lang=en) for
creating the logo!
