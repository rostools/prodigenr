##' Template for creating a focused script (delete this line)
##'
##' ---
##' title: Script title
##' author: Luke W. Johnston
##' date: 
##' abstract: |
##'
##'   Script description
##'
##'   * Project: faDiabetes
##'   * Master dataset: PROMISE_data.csv.gz
##' 
##' ---
##' 
##' Code preamble
##' =============
##' 
##' Load in the options as well as the dataset.
##' 
source("opt/options.R")
source("functions.R")
load("../data/faDiabetes_data.RData")
names(df)

##'
##' Setting custom object variables
##' ===============================
##' 
##' (Optional) Set variables as objects so that they are easier to
##' reference in the script.  Doing this might make it easier to loop
##' through analyses or tasks.
##' 


##' -----

##'
##' Section title
##' =============
##'
##' Task description here and discussion.
##' 
