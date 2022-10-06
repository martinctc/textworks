#' @title
#' Capitalise the first letter of all words
#'
#' @param string String or character vector to pass through.
#'
#' @return Returns a formatted string.
#'
#' @examples
#' cap_first(text = "steeles pots and pans")
#'
#' @export
cap_first <- function(text) {
  gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", text, perl = TRUE)
}
