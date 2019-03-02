#' Count the number of words in text string
#' 
#' @param string Pass text string here.
#' @param pseudo Determines whether groups of special characters are matched. Defaults to FALSE (not matched)
#' @examples 
#' nwords("Oh my what a lovely day. We should all go out and play!")  
#'  
nwords <- function(string, pseudo=F){
  ifelse(pseudo,
         pattern <- "\\S+",
         pattern <- "[[:alpha:]]+" 
  )
  stringr::str_count(string, pattern)
}
