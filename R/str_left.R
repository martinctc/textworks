#' @title
#' Return the `n` number of characters from the left
#'
#' @description
#' This is a convenience wrapper function around `str_sub()`, and is analagous
#' to `str_right()`.
#'
#' @param text String character to pass through
#' @param n Integer specifying the number of characters to return from the left.
#'
#' @return Returns a formatted string.
#'
#' @importFrom stringr str_sub
#'
#' @examples
#' str_left("Wittgenstein", 7)
#'
#' @export
str_left <- function(text, n){
  str_sub(text, 1, n)
}
