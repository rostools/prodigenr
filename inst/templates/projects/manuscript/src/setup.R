##' 
##' Code preamble
##' =============
##' 
##' Install packages if they are not installed.
##'
##' Use template: if (!require('package')) install.packages('package')
if (!require(prodigenr)) devtools::install_github('lwjohnst86/prodigenr')
if (!require(rstatsToolkit)) devtools::install_github('lwjohnst86/rstatsToolkit')
if (!require(captioner)) install.packages('captioner')
if (!require(rmarkdown)) install.packages('rmarkdown')
if (!require(ggplot2)) install.packages('ggplot2')
if (!require(dplyr)) install.packages('dplyr')
if (!require(tidyr)) install.packages('tidyr')
if (!require(pander)) install.packages('pander')


##' Load relevant libraries
library(prodigenr)
library(rstatsToolkit) ## personal library
library(captioner)
library(rmarkdown)
library(ggplot2)
library(dplyr)
library(tidyr)
library(pander)

##' Custom options for pander
panderOptions('table.split.table', Inf)
panderOptions('table.style', 'rmarkdown')
panderOptions('table.alignment.default',
              function(df) ifelse(sapply(df, is.numeric), 'center', 'left'))

##' Knitr global options
knitr::opts_chunk$set(warning = FALSE, echo = FALSE,
                      fig.width = 8, dpi = 150,
                      message = FALSE, dev = c('png', 'pdf'))

