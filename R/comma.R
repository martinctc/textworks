#' @title Add comma separator for thousands
#'
#' @description
#' Takes a numeric value and returns a character value
#' which is rounded to the whole number, and adds a comma
#' separator at the thousands. A convenient wrapper function
#' around `scales::label_comma()`.
#'
#' @param x numeric value to add thousand separator.
#'
#' @examples
#' comma(1000 * 1000)
#'
#' comma(20190721)
#'
#' @return Returns a formatted string.
#'
#' @export
comma <- function(x){
  scales::label_comma(accuracy = 1)(x)
}
