##' ---
##' output:
##'   word_document:
##'     fig_caption: yes
##' ---
##'
##' Word count: 
##'
##' **Title here**
##' 
##' Author list here
##' 
##' **Background**: 
##' 
##+ libData, message = FALSE, echo = FALSE
prodigenr::runSetup('src/')
loadData('data/')

figNums <- captioner(prefix = 'Figure')
figNums('short', 'Long caption')

##' **Methods**: 
##' 
##+ wrangling
ds

##+ inlineCode

##' **Results**:
{{figNums('short', display = 'cite')}}
##' 
##' **Discussion**:
##' 
##+ figureChunk, fig.cap = `r figNums('short')`
plotForestGEE(fitPL.pct, ylab = 'Phospholipids\n(mol%)')

##'
##' <!-- Session info -->
##sessionInfo()

