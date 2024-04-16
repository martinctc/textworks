#' @title Subset a List from a Matched String
#'
#' @description This function takes a list of strings and a key string as input.
#'   It returns a new list that starts from the first occurrence of the key
#'   string in the original list and includes all the strings that follow it. If
#'   the key string is not found in the list, the function returns `NULL`.
#'   Optional argument `before` allows the logic to be reversed, returning a new
#'   list that start from the first value in the original list up to the matched
#'   string.
#'
#' @param x A character vector to perform the matching and subsetting on.
#' @param key A character string to match in `x`.
#' @param before A logical value indicating whether the strings _before_ the
#'   matched key should be returned. Defaults to FALSE. If set to TRUE, strings
#'   _before_ the matched key are returned.
#'
#' @return By default, a character vector starting from the first occurrence of
#'   `key` in `x` and including all subsequent elements. Logic can be reversed
#'   with `before` argument. If `key` is not found in `x`, the function returns
#'   `NULL`.
#'
#' @examples
#' x <- c("a", "b", "c", "d", "e")
#' key <- "c"
#' subset_from_match(x, key)  # Returns: "c" "d" "e"
#'
#' @export
subset_from_match <- function(x, key, before = FALSE) {
  index <- match(key, x)
  if (!is.na(index) & !before) {
    x[index:length(x)]
  } else if (!is.na(index) & before){  
    x[1:index] # up to the matched key
  } else {
    NULL
  }
}
