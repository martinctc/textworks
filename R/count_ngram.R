#' @title
#' Summarise the counts of a specified ngram in character vector
#'
#' @param text character. Vector containing text to split into n-grams and count.
#' @param count_col A string vector for the name of the count column. Defaults to "count"
#' @param n Specify n of ngram
#' @return data frame with the count results, containing two columns:
#'   - `text`: n-grams identified
#'   - `count` (unless otherwise specified)
#'
#' @examples
#' count_ngram(c("The quick brown fox jumped over the lazy dog"))
#'
#' @export
count_ngram <- function(text, count_col = "count", n = 2){

  out <- dplyr::tibble(text = tokenise_ngram(x = text, n = n))
  dplyr::count(out, text, name = count_col, sort = TRUE)

}
