#' Translate function using transltr.org API
#' 
#' This function allows you to translate character strings through the transltr.org API.
#' @param what What text string to translate
#' @param from What language to translate from. Defaults to NULL
#' @param to What language to translate to. Defaults to "en"
#' @keywords translate
#' @export
#' @examples 
#' trans.t(what="Blanc",from="fr",to="en")

trans.t <- function(what=NULL,from=NULL,to="en"){
  url <- paste0("http://transltr.org/api/translate?text=",URLencode(what),
                "&to=",to,"&from=",from)
  output<-jsonlite::fromJSON(txt=url)
  output$translationText
}

#' Translate function using the Microsoft Translator API
#' 
#' This function allows you to translate character strings through the Microsoft Translator API.
#' To use this function, you will need to first acquire an access token and pass it through the key argument.
#' @param what What text string to translate
#' @param from What language to translate from. Defaults to NULL
#' @param to What language to translate to. Defaults to "en"
#' @keywords translate
#' @export
#' @examples 
#' trans.m(what="Blanc",from="fr",to="en",key="F023kljadfoilkjlkj")

trans.m <- function(what, from=NULL,to="en",key=MyKey){
  token_url <- "https://api.cognitive.microsoft.com/sts/v1.0/issueToken"
  token_body <- list('Subscription-Key'=key)
  resp<-httr::POST(token_url,query=token_body)
  tok_string <- resp %>% httr::content(type="text",encoding='utf-8')
  w.token <- paste("Bearer",tok_string)
  
  transurl <- "http://api.microsofttranslator.com/V2/Http.svc/Translate"
  tranz <- httr::GET(transurl,
               query=list('appId'=w.token,
                          text=what,from=from,
                          to=to))
  tranz %>% xmlParse %>% xmlToList()
}