#' @title Convert "CamelCase" to "Camel Case"
#'
#' @description
#' Convert a text string from the format "CamelCase" to "Camel Case".
#' This is used for converting variable names such as
#' "LevelDesignation" to "Level Designation" for the purpose
#' of prettifying plot labels.
#'
#' @param string A string vector in 'CamelCase' format to format
#'
#' @family Support
#'
#' @examples
#' camel_clean("NoteHowTheStringIsFormatted")
#'
#' @return Returns a formatted string.
#'
#' @export
camel_clean <- function(string){

  gsub("([a-z])([A-Z])", "\\1 \\2", string)

}
