#' @title Replace matched patterns in a string
#'
#' @description
#' An implementation of `stringr::str_replace()` using only base R.
#' Vectorised over `string`, `pattern`, and `replacement`
#'
#' @param string Input vector. Either a character vector, or something coercible to one.
#' @param pattern Pattern to look for.
#' A character vector of replacements. Should be either length one, or the same length as string or pattern.
#'
#' @param replacement
#'
#' @export
str_replace <- function(string, pattern, replacement){

  gsub(pattern = pattern,
       replacement = replacement,
       x = string)

}
