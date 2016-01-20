> This program is still in development.

This is a *pro*ject *di*rectory *gen*erato*r* (`prodigenr`) that will
create a project directory structure with template files necessary for
managing and analyzing data for a variety of projects.  This allows
for a standardized approach to having a modular research project.
This package can be found at
[on the GitHub `prodigenr` repo](https://github.com/lwjohnst86/prodigenr).

# How to install

Install by forking or cloning this repo, or by using the R command:

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

