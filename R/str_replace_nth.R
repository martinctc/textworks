#' @title
#' Replace nth occurring pattern in a string
#'
#' @description
#' Replaces the nth occurrence of a specified pattern in a string. This enables
#' a more targetted way of replacing patterns compared to
#' `stringr::str_replace()` and `stringr::str_replace_all()`.
#'
#' @param text Pass string character
#' @param pattern String containing characters to match
#' @param replacement String containing characters to replace.
#' @param n Nth term to be replaced
#'
#' @return Returns a formatted string.
#'
#' @examples
#' x <- "pineapplepie"
#'
#' str_replace_nth(text = x, pattern = "p", replacement = "q", n = 2)
#'
#' str_replace_nth(text = "pigpig", pattern = "pig", replacement = "dog", n = 2)
#'
#' str_replace_nth(text = "pigpig", pattern = "pig", replacement = "gy", n = 2)
#'
#' @export
str_replace_nth <- function(text, pattern, replacement, n) {

  # returns list of matched positions, only single value
  g <- gregexpr(pattern, text)[[1]][n]

  # get total length of `pattern`
  len_p <- nchar(pattern)
  len_r <- nchar(replacement)

  # legacy
  s <- scan(text = gsub(pattern = "[()]", replacement = "", x = pattern),
            sep = "|",
            what = "")

  firsthalf <- substr(text, start = 1, stop = g - 1)
  secondhalf <- substr(text, start = g + len_p, stop = nchar(text))
  paste0(firsthalf, replacement, secondhalf)
}
