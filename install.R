
library(roxygen2)
library(devtools)
library(methods)

setwd("/home/luke/R/")

load_all("rstatsToolkit")
document("rstatsToolkit")
install("rstatsToolkit")
