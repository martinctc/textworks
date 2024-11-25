#' @title Convert "CamelCase" to "Camel Case"
#'
#' @description
#' Convert a text string from the format "CamelCase" to "Camel Case". This is
#' used for converting variable names such as "ApplePie" to "Apple Pie" for the
#' purpose of prettifying plot labels.
#'
#' @param text character vector in 'CamelCase' format to format
#'
#' @examples
#' camel_clean("NoteHowTheStringIsFormatted")
#'
#' @return Returns a formatted string.
#'
#' @export
camel_clean <- function(text){

  gsub("([a-z])([A-Z])", "\\1 \\2", text)

}
