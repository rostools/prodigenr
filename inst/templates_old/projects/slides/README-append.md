
# Project specific details

This main file is the `slides.Rmd` file. It uses the 
[`beamer`](https://www.ctan.org/pkg/beamer?lang=en) class in 
[LaTeX](https://latex-project.org/intro.html). There is one helper file
`template.tex` that provides the theme, colouring, font family, etc and can be
edited to your preferences. To create the slides pdf, with all R code computed,
run `rmarkdown::render('slides.Rmd')` or type `Ctrl-Shift-K` in RStudio.
