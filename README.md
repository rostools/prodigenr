# prodigenr

[![Build Status](https://travis-ci.org/lwjohnst86/prodigenr.svg?branch=master)](https://travis-ci.org/lwjohnst86/prodigenr)

This is a *pro*ject *di*rectory *gen*erato*r* (`prodigenr`) that will
create a project directory structure with template files necessary for
managing and analyzing data for a variety of projects.  This allows
for a standardized approach to having a modular research project.

# How to install

Install via CRAN or using `devtools` for the development version:

    install.packages('prodigenr')
    
    # Development version
    devtools::install_github('lwjohnst86/prodigenr')

# Usage

The main function is the `prodigen` command.  So, for instance, if you
want a manuscript project, type out:

    library(prodigenr)
    prodigen(proj.name = 'cancerAndToxins',
        proj.type = 'manuscript', proj.path = '/path/to/new/project')

This then creates a directory tree, with template files for starting
your analysis!  The main secondary function is the `list_templates`
command, which lists the available template projects and files (submit
a PR if you want another template included!):

    list_templates('projects') ## Shows project templates

For a more detailed tutorial, see the vignette (still in development):

    vignette('introduction', 'prodigenr')

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
