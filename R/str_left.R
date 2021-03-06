#' Return the n number of characters from the left
#'
#' Wrapper convenience function
#' Analagous to `str_right()`
#'
#' @param x String character to pass through
#' @param n Integer specifying the number of characters to return from the left.
#'
#' @importFrom stringr str_sub
#'
#' @examples
#' str_left("Wittgenstein", 7)
#'
#' @export
str_left <- function(x, n){
  str_sub(x, 1, n)
}
