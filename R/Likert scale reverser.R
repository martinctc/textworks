#' Reverse a Likert scale
#' 
#' Reverse a Likert scale such that on a 0-10 scale, 10 becomes 0 and 0 becomes 10. 
#' 
#' @param x Numeric vector
#' @param top Top value of the scale for the variable, e.g. 10 for a 0-10 scale.
#' @param top Bottom value of the scale for the variable, e.g. 0 for a 0-10 scale.
#' @keywords likert scale
#' @examples 
#' data <-c(5, 4, 3, 2, 6)
#' likert.reverse(data, 6, 0)
#' [1] 1 2 3 4 0

likert.reverse <- function(x,top,bottom){
  total <-top+bottom
  x <- total-x
  x
}