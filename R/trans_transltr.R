#' Translate function using transltr.org API
#' 
#' This function allows you to translate character strings through the transltr.org API.
#' @param what What tex string to translate
#' @param from What language to translate from. Defaults to NULL
#' @param to What language to translate to? Mandatory 
#' @keywords translate
#' @export
#' @examples 
#' trans.transltr()

trans.transltr <- function(what,from=NULL,to){
  library(jsonlite)
  url <- paste0("http://transltr.org/api/translate?text=",URLencode(what),
                "&to=",to,"&from=",from)
  output<-jsonlite::fromJSON(txt=url)
  output$translationText
}