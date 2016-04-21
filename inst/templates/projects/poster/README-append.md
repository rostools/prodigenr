
# Project specific details

The poster project creates a poster using the 
[`beamer`](https://www.ctan.org/pkg/beamer?lang=en) class in 
[LaTeX](https://latex-project.org/intro.html). As such, it requires some extra
helper files that are included in the main folder:

- `beamerthemeCustomPoster.sty` contains LaTeX code for the specific styling of
the poster, such as colour, block formatting, font, etc. This file can be
customized to fit your preferences.
- `template.tex` contains a slightly revised [pandoc](http://pandoc.org/)
`beamer` template. In general, this file does not need to be changed or edited.

Other than these helper files, the main file here is the `poster.Rmd` file. This
file can be converted to a poster pdf format, with all R code computed, using
`rmarkdown::render('poster.Rmd')` or by typing `Ctrl-Shift-K` in
RStudio. 
