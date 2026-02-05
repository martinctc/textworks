#' @title Add a character at the start and end of a character string
#'
#' @description Add a character at the start and end of a
#'   character string, where the default behaviour is to add a double quote.
#'
#' @param text string to be add 'wrapping' characters.
#' @param wrapper string to be added around value supplied in `text`.
#'
#' @examples
#' wrap(text = "lol")
#'
#' wrap(text = "lol", wrapper = "lol")
#'
#' @return Returns a formatted string.
#'
#' @export
wrap <- function(text, wrapper = '"'){
  paste0(wrapper, text, wrapper)
}
