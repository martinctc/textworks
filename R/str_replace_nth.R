#' @title
#' Replace nth occurring pattern in a string
#'
#' @description
#' Replaces the nth occurrence of a specified pattern in a string. This enables
#' a more targetted way of replacing patterns compared to
#' `stringr::str_replace()` and `stringr::str_replace_all()`.
#'
#' @param x Pass string character
#' @param pattern String containing characters to match
#' @param replacement String containing characters to replace.
#' @param n Nth term to be replaced
#'
#' @examples
#' x <- "pineapplepie"
#'
#' str_replace_nth(x = x, pattern = "p", replacement = "q", n = 2)
#'
#' str_replace_nth(x = "pigpig", pattern = "pig", replacement = "dog", n = 2)
#'
#' str_replace_nth(x = "pigpig", pattern = "pig", replacement = "gy", n = 2)
#'
#' @export
str_replace_nth <- function(x, pattern, replacement, n) {

  # returns list of matched positions, only single value
  g <- gregexpr(pattern, x)[[1]][n]

  # get total length of `pattern`
  len_p <- nchar(pattern)
  len_r <- nchar(replacement)

  # legacy
  s <- scan(text = gsub(pattern = "[()]", replacement = "", x = pattern),
            sep = "|",
            what = "")

  ## Debug
  # print(substr(x, g, g + len_p))
  # print(s)
  # print(match(substr(x, g, g + len_r), s))
  # print(g)
  # print(g + len_p)

  # substr(x, g, g + len_p) <- replacement[match(substr(x, g, g + len_p), s)]
  # x
  firsthalf <- substr(x, start = 1, stop = g - 1)
  secondhalf <- substr(x, start = g + len_p, stop = nchar(x))
  paste0(firsthalf, replacement, secondhalf)
}
