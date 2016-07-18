## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)

## ----templates, collapse=TRUE--------------------------------------------
library(prodigenr)
template_list
path <- tempdir()

## ----manuscriptProj------------------------------------------------------
prodigen('manuscript', 'ManuscriptName', path, git.init = TRUE)

## ----shell_command, eval = FALSE, echo = FALSE---------------------------
#  # run only on computer
#  cat(paste(system(paste0('cd ', path, '/ManuscriptName && tree'), intern = TRUE), collapse = '\n'),
#      file = 'vignettes/file_structure.txt')

## ----file_structure, echo = FALSE, results='markup', comment=''----------
unlink(file.path(path, 'ManuscriptName'))
cat(readLines('file_structure.txt', warn = FALSE), sep = '\n')

## ---- eval=FALSE---------------------------------------------------------
#  prodigen('manuscript', 'ManuscriptName', '~/path/to/new/project', git.init = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  prodigen('slides', 'PresentationName', '~/path')
#  prodigen('abstract', 'Name', '.') # Current directory

