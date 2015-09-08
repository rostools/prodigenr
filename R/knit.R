##' This script takes all the manuscript files and generates html
##' documents from them.
library(magrittr)
library(knitr)

##' Loop through all files to check if they have been knit already,
##' and if not to knit them, otherwise to do nothing.
for ( fi in list.files(pattern = '*Rmd$', recursive = TRUE) ) {
    setwd(dirname(fi))
    infile <- paste0(basename(fi))
    outfile <- paste0(sub('Rmd$', 'html', infile))

    ## Compare whether this file exists already, otherwise don't knit
    if (!file.exists(outfile) | file.info(infile)$mtime > file.info(outfile)$mtime) {
        print(paste0('Knit file: ', infile))
        knit(infile, paste(sub('Rmd$', 'md', infile)),
             envir = new.env(), quiet = TRUE) %>%
          pandoc(., format = c('html', 'latex'), config = '../_opts/config.txt')

        ## Clean up the script dir of any files.
        paste0(sub('Rmd$', 'md', infile)) %>%
          unlink()
    } else {
        print(paste0('File already knitted: ', outfile))
    }

    setwd('../')
}

