# prodigenr

[![Build Status](https://travis-ci.org/lwjohnst86/prodigenr.svg?branch=master)](https://travis-ci.org/lwjohnst86/prodigenr)
[![CRAN Status Badge](http://www.r-pkg.org/badges/version/prodigenr)](https://cran.r-project.org/package=prodigenr)
[![CRAN RStudio mirror downloads](http://cranlogs.r-pkg.org/badges/prodigenr)](http://www.r-pkg.org/pkg/prodigenr)

This is a *pro*ject *di*rectory *gen*erato*r* (`prodigenr`) that will
create a project directory structure with template files necessary for
managing and analyzing data for a variety of projects.  This allows
for a standardized approach to having a modular research project, while also
taking advantage of existing well-developed and maintained infrastructures and
processes (Rstudio and devtools).

# How to install

Install via CRAN or using `devtools` for the development version:

    install.packages('prodigenr')
    
    # Development version
    devtools::install_github('lwjohnst86/prodigenr')

# Usage

The main function is the `prodigen` command.  So, for instance, if you
want a manuscript project, type out:

    library(prodigenr)
    prodigen(type = 'manuscript', name = 'cancerToxins',
        path = '/path/to/new/project')

This then creates a directory tree, with template files for starting
your analysis!  The main secondary function is the `template_list`
command, which lists the available template projects and files (submit
a PR if you want another template included!):

    template_list

For a more detailed tutorial, see the vignette:

    vignette('introduction', 'prodigenr')
    
Or to directly [preview it here](https://htmlpreview.github.io/?https://github.com/lwjohnst86/prodigenr/blob/master/vignettes/introduction.html).

# Related packages or projects

There are several ways of creating projects, each of which has it's pros and cons.

- [`ProjectTemplate`](http://projecttemplate.net/) 
- [`makeProject`](https://cran.r-project.org/package=makeProject)
- R package structure via
[`devtools`](https://cran.r-project.org/package=devtools), argued for in this
[blog](https://rmflight.github.io/posts/2014/07/vignetteAnalysis.html) 

`prodigenr` tries to use ideas from R packages/`devtools` while still being as simple
as possible and be more specific to academic researchers primarily in
biomedical/non-computer science fields. However, it can always improve! I
welcome any suggestions, just submit a 
[GitHub issue](https://github.com/lwjohnst86/prodigenr/issues)!

# Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). 
By participating in this project you agree to abide by its terms.
