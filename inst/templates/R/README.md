# Description of R/ folder and .R files

This folder contains custom functions used for this project's analyses. It's
recommended that if a piece of code is used more than once in your analysis
files, make it into a function and put it here so that you "Don't Repeat
Yourself" (DRY principle). Or even if the piece of code is complicated, put it
into a function to then document what it does. The recommended approach is to
create a function for each main output item (each figure, table, etc) in a
scientific product (e.g. `figure_one()` to create figure one).

Use RStudio's R script 'Insert Section' (Ctrl-Shift-R) to split up your
functions by utility or purpose. You can see the contents of this file easily
using the 'Document Outline' (Ctrl-Shift-O), which shows the sections and
functions. Use 'Insert Roxygen Skeleton' (Ctrl-Alt-Shift-R) to document
individual functions. 

Best practice is to split the functions up into individual files based on what
the functions do. For example, have one file for plotting functions (plots.R),
another for data wrangling functions (wrangle.R), and so on. These functions in
the `R/` folder can then be all accessible by running `devtools::load_all()`
(Ctrl-Shift-L) for interactive use or within the Rmd files so that another
document format (e.g. Word) can be knitted.
