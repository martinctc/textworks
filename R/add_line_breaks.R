#' Split long sentences into multiple lines by adding line breaks
#'
#' @param string Pass text string here.
#' @param words The maximum number of words allowed in the first line
#' @examples
#' library(stringr)
#' library(magrittr)
#' add_line_breaks("This is a lovely cup of tea",2)
#' add_line_breaks("This is a lovely cup of tea",3)
#' add_line_breaks("This is a lovely cup of tea",1)
#' add_line_breaks("Oh wow. Amazing. I cannot believe that this is actually possible!",4)
#' paste0("word",1:100, collapse = " ") %>% add_line_breaks(3)
#' @export
#'
add_line_breaks <-
  function(string, words) {
    words_list <- unlist(stringr::str_split(string, " "))

    # Return index of spaces to insert line break
    ind <- which(sapply(1:nwords(string), function(x) x %%  words) == 0)

    for(i in 0:(length(ind)-1)){
        new_index <- ind[i + 1] + i

      words_list <- append(words_list, "\n", after = new_index)
    }

    return(paste0(words_list, collapse = " "))
  }
