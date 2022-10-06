#' @title
#' Convert RGB values to HEX colour codes
#'
#' @description
#' Suited for using in viz packages like {wordcloud2}. A convenience wrapper
#' around `rgb()`.
#'
#' @param r Value for r
#' @param g Value for g
#' @param b Value for b
#' @examples
#' rgb2hex(0,144,218)
#'
#' @export
rgb2hex <- function(r, g, b){
  grDevices::rgb(r, g, b, maxColorValue = 255)
}
