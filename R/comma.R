#' @title Add comma separator for thousands
#'
#' @description
#' Takes a numeric value and returns a character value
#' which is rounded to the whole number, and adds a comma
#' separator at the thousands. A convenient wrapper function
#' around `round()` and `format()`.
#'
#' @param x A numeric value
#'
#' @return Returns a formatted string.
#'
#' @export
comma <- function(x){
  x <- round(x, 0)
  format(x, nsmall = 0, big.mark=",")
}
