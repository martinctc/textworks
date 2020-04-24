#' Return all n-gram combinations with a character vector as input
#'
#' @param x Vector of character string
#' @param n Specifying the n for n-grams, e.g. 2 for bi-grams
#' @param collapse Specify what to use for separating the outcome
#' @importFrom NLP words
#' @importFrom NLP ngrams
#'
#' @export
tokenise_ngram <- function(x, n = 2, collapse = " ") {
  unlist(lapply(NLP::ngrams(NLP::words(x), n), paste, collapse = collapse), use.names = FALSE)
}
