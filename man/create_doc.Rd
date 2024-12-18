% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_doc.R
\name{create_doc}
\alias{create_doc}
\alias{create_report}
\alias{create_slides}
\title{Create a basic Quarto document from a template.}
\usage{
create_doc(type = c("report", "slides"))

create_report()

create_slides()
}
\arguments{
\item{type}{The file type (e.g. report, slides).}
}
\value{
A created \code{.qmd} file in the \verb{docs/} folder.
}
\description{
Creates manuscript/report or slide Quarto file and saves it into
the \verb{docs/} folder.
}
\section{Functions}{
\itemize{
\item \code{create_report()}: Creates a report Quarto document in the \verb{docs/} folder.

\item \code{create_slides()}: Creates a Quarto document for making slides in the \verb{docs/} folder.

}}
\examples{
\dontrun{
create_report()
create_slides()
}
}
