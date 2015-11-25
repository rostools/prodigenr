##'
##' Code preamble
##' =============
##'
##' Install packages if they are not installed.
##'
##' Use template: if (!require('package')) install.packages('package')
##'
##' gh = github packages.
gh_pkgs <- c('prodigenr', 'rstatsToolkit', 'mason', 'seer')
pkgs <- c('ggplot2', 'dplyr', 'tidyr')
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
if (!require(broom)) devtools::install_github('dgrtwo/broom')

##' Knitr global options
knitr::opts_chunk$set(warning = FALSE, echo = FALSE,
                      dpi = 150,
                      message = FALSE, dev = c('png'),
                      collapse = TRUE)

