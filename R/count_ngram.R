#' Summarise the counts of a specified ngram in character vector
#' 
#' @param text Character string vector to pass through
#' @param count_col A string vector for the name of the count column. Defaults to "count"
#' @param n Specify n of ngram
#' @return A tidy data frame with the count results
#' @importFrom dplyr tibble
#' @importFrom dplyr count
#' @importFrom dplyr rename
#' @importFrom magrittr %>%
#' @importFrom rlang sym
#' @importFrom rlang !!
#' @importFrom tidytext unnest_tokens
#' @examples 
#' count_ngram(c("The quick brown fox jumped over the lazy dog"))
#' @export
count_ngram <- function(text,count_col = "count", n = 2){
  dplyr::tibble(text = text, line = length(text)) -> ori_tb
  
  ori_tb %>% 
    tidytext::unnest_tokens(output = phrase, input = text, token = "ngrams", n = n) %>%
    dplyr::count(phrase, sort = TRUE) %>%
    rename(!!sym(count_col):="n") -> ngram_df
  
  return(ngram_df)
}
