#' @title
#' Summarise the counts of n-grams for text
#'
#' @description Supply a character vector and return a data frame summarising
#' all the unique n-grams and their counts in the character vector.
#'
#' @param text character. Vector containing text to split into n-grams and count.
#' @param count_col A string vector for the name of the count column. Defaults
#'   to `"count"`
#' @param n Specify n of ngram
#' @return data frame with the count results, containing two columns:
#'   - `ngrams`: n-grams identified
#'   - `count` (unless otherwise specified)
#'
#' @examples
#' count_ngram("The quick brown fox jumped over the lazy dog")
#'
#'
#' @export
count_ngram <- function(text, count_col = "count", n = 2){

  out <- dplyr::tibble(ngrams = tokenise_ngram(text = text, n = n))
  dplyr::count(out, ngrams, name = count_col, sort = TRUE)

}
