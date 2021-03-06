% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sentence_case.R
\name{sentence_case}
\alias{sentence_case}
\title{Convert a string into sentence case}
\usage{
sentence_case(string)
}
\arguments{
\item{string}{A vector of character string to pass through.}
}
\description{
(^|\\.) matches start of string OR literally a fullstop
\\s* matches whitespace symbols
(.) matches any character but a new line
\\1 Back-references Group 1
\\2 Turns Group 2 into uppercase
}
\examples{
sentence_case("i'm not hundred percent sure. why not. cool!")
}
