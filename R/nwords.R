#' @title
#' Count the number of words in text string
#'
#' @param text Pass text string here.
#' @param pseudo Determines whether groups of special characters are matched.
#'   Defaults to `FALSE` (not matched)
#'
#' @importFrom stringr str_count
#'
#' @examples
#' nwords(text = "Oh my what a lovely day. We should all go out and play!")
#'
#' @return numeric value containing count of words.
#'
#' @export
nwords <- function(text, pseudo = FALSE){
  ifelse(pseudo,
         pattern <- "\\S+",
         pattern <- "[[:alpha:]]+"
  )
  stringr::str_count(text, pattern)
}
