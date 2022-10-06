#' @title
#' Return the n number of characters from the right
#'
#' @description
#' This is a convenience wrapper function around `str_sub()`, and is analagous
#' to `str_left()`.
#'
#' @param text String character to pass through
#' @param n Integer specifying the number of characters to return from the right.
#'
#' @importFrom stringr str_sub
#'
#' @return Returns a formatted string.
#'
#' @examples
#' str_right("Wittgenstein", 5)
#'
#' @export
str_right <- function(text, n){
  nx <- n-1
  str_sub(text, nchar(text) - nx, nchar(text))
}
