##'
##' Code preamble
##' =============
##'
##' Install packages if they are not installed.
##'
##' Use template: if (!require('package')) install.packages('package')
gh_pkgs <- c('prodigenr', 'rstatsToolkit', 'mason', 'seer')
pkgs <- c('rmarkdown', 'ggplot2', 'dplyr', 'tidyr', 'pander', 'captioner')
for (pkg in pkgs) {
    if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
        install.packages(pkg)
        library(pkg, character.only = TRUE)
    }
}
for (pkg in gh_pkgs) {
    if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
        devtools::install_github(paste0('lwjohnst86/', x))
        library(pkg, character.only = TRUE)
    }
}

##' Custom options for pander
panderOptions('table.split.table', Inf)
panderOptions('table.style', 'rmarkdown')
panderOptions('table.alignment.default',
              function(df) ifelse(sapply(df, is.numeric), 'center', 'left'))

##' Knitr global options
knitr::opts_chunk$set(warning = FALSE, echo = FALSE,
                      message = FALSE, dev = c('pdf'),
                      collapse = TRUE)

