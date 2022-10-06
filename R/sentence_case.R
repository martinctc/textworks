#' @title
#' Convert a string into sentence case
#'
#' @description
#' (^|\\.) matches start of string OR literally a fullstop
#'   - `\\s*` matches whitespace symbols
#'   - `(.)` matches any character but a new line
#'   - `\\1` Back-references Group 1
#'   - `\\2` Turns Group 2 into uppercase
#'
#' @param text A vector of character string to pass through.
#'
#' @examples
#' sentence_case("i'm not hundred percent sure. why not. cool!")
#'
#' @return Returns a formatted string.
#'
#' @export
sentence_case <- function(text){
  trimws(gsub("(^|\\.)\\s*(.)", "\\1 \\U\\2",
              text, perl=TRUE))
}

