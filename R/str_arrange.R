#' @title
#' Sorts letters in a character string by alphabetical order
#'
#' @param string A vector of character string to pass through.
#' @param decreasing logical, specifies whether sort is increasing or decreasing.
#' See `sort()` (base)
#'
#' @importFrom magrittr %>%
#' @importFrom stringr str_split
#' @importFrom purrr map
#' @importFrom purrr as_vector
#' @examples
#' str <- c("sugar", "spice", "everything nice")
#' str_arrange(str)
#'
#' @export
str_arrange <- function(string, decreasing = FALSE){
  string %>%
    stringr::str_split("") %>% # Split string into letters
    purrr::map(~sort(., decreasing = decreasing) %>%
                 paste(collapse = "")) %>% # Sort and re-combine
    as_vector() # Convert list into vector
}
