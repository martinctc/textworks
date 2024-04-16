#' @title Subset a List from a Matched String
#' 
#' @description
#' This function takes a list of strings and a key string as input. It returns a new list that starts from the first occurrence of the key string in the original list and includes all the strings that follow it. If the key string is not found in the list, the function returns `NULL`.
#' 
#' @param x A character vector to perform the matching and subsetting on.
#' @param key A character string to match in `x`.
#' 
#' @return A character vector starting from the first occurrence of `key` in `x` and including all subsequent elements. If `key` is not found in `x`, the function returns `NULL`.
#' 
#' @examples
#' x <- c("a", "b", "c", "d", "e")
#' key <- "c"
#' subset_from_match(x, key)  # Returns: "c" "d" "e"
#' 
#' @export
subset_from_match <- function(x, key) {
  index <- match(key, x)
  if (!is.na(index)) {
    return(x[index:length(x)])
  } else {
    return(NULL)
  }
}
