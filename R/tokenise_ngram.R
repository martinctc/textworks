#' @title
#' Return all n-gram combinations with a character vector as input
#'
#' @param text character. Vector containing text to split into n-grams.
#' @param n Specifying the n for n-grams, e.g. 2 for bi-grams
#' @param collapse Specify what to use for separating the outcome
#'
#' @importFrom NLP words
#' @importFrom NLP ngrams
#'
#' @return Returns a formatted string.
#'
#' @examples
#' tokenise_ngram(text = c("apple pies and pear pies", "steak pies and kidney pies"))
#'
#' @export
tokenise_ngram <- function(text, n = 2, collapse = " ") {
  unlist(
    lapply(
      NLP::ngrams(NLP::words(text), n),
      paste,
      collapse = collapse),
    use.names = FALSE
    )
}
