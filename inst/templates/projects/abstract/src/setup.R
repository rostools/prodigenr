##' 
##' Code preamble
##' =============
##' 
##' Install packages if they are not installed.
##'
##' Use template: if (!require('package')) install.packages('package')
if (!require(rstatsToolkit)) devtools::install_github("lwjohnst86/rstatsToolkit")
if (!require(captioner)) install.packages('captioner')


##' Load relevant libraries
library(rstatsToolkit) ## personal library
library(captioner)

##' Custom options for pander
panderOptions('table.split.table', Inf)
panderOptions('table.style', 'rmarkdown')
panderOptions('table.alignment.default',
              function(df) ifelse(sapply(df, is.numeric), 'center', 'left'))

##' Knitr global options
knitr::opts_chunk$set(warning = FALSE, echo = FALSE,
                      fig.width = 8, dpi = 150,
                      message = FALSE, dev = c('png', 'pdf'))

