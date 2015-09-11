##' ---
##' title:
##' author: `r getAuthor('../config.yaml')`
##' output:
##'   html_vignette:
##'     toc: true
##'     number_sections: true
##'   word_document:
##'     toc: true
##'     number_sections: true
##'     
##' ---
##' 
##' Preamble
##' ========
##' 
##' Load in the options as well as the dataset.
##' 
runSetup('./')
loadData('../data')
names(ds)

##'
##' Setting custom object variables
##' ===============================
##' 
##' (Optional) Set variables as objects so that they are easier to
##' reference in the script.  Doing this might make it easier to loop
##' through analyses or tasks.
##' 


##'
##' -----
##'
##' Section title
##' =============
##'
##' Task description here and discussion.
##' 
