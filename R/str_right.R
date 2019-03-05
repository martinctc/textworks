#' Return the n number of characters from the right
#' Wrapper convenience function
#' @param x String character to pass through
#' @param n Integer specifying the number of characters to return from the right.
#' @export
str_right <- function(x,n){
  nx <- n-1
  str_sub(x,nchar(x)-nx,nchar(x))
}
