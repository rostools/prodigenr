##' 
##' Code preamble
##' =============
##' 

##' Load relevant libraries
library(yaml)
library(dplyr)
library(magrittr)
library(tidyr)
library(knitr)
library(pander)

##' Load YAML config file
config <- yaml.load_file(file.path('..', 'config.yaml'))

##' Source personal functions, or install (or update) custom functions
##' in a package (to install from github, needs devtools)
##detach(package:rstatsToolkit, unload = TRUE)
##devtools::install_github("lwjohnst86/rstatsToolkit")
library(rstatsToolkit)

##' Custom options for pander
panderOptions('table.split.table', Inf)
panderOptions('table.alignment.default',
              function(df) ifelse(sapply(df, is.numeric), 'right', 'left'))

##' Knitr global options
##knitr::opts_chunk$set(warning = FALSE, echo = FALSE,
##                      message = FALSE, dev = 'pdf')
