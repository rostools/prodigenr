## ----templates, collapse=TRUE--------------------------------------------
library(prodigenr)
list_templates()

## ---- eval=FALSE---------------------------------------------------------
#  prodigen('manuscript', 'ManuscriptName', '~/path/to/new/project')

## ---- eval=FALSE---------------------------------------------------------
#  prodigen('manuscript', 'ManuscriptName', '~/path/to/new/project', git.init = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  prodigen('manuscript', 'ManuscriptName', '~/path/to/new/project', packrat.init = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  prodigen('slides', 'PresentationName', '~/path')
#  prodigen('abstract', 'Name', '.') # Current directory

