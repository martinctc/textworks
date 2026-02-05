#' @title
#' Split long strings into multiple lines by adding line breaks
#'
#' @description Wrap text in visualizations according to a preset character
#'   threshold, or the maximum number of words allowed in the first line. The
#'   next space in the string is replaced with `\n`, which will render as next
#'   line in plots and messages.
#'
#' @param text Pass text string here.
#'
#' @param nword numeric, defaults to `NULL`. The maximum number of words allowed
#'   in the first line. Only one argument from either `nword` or `nchar` is
#'   used, otherwise an error is generated.
#'
#' @param nchar numeric, defaults to `NULL`. Number of character units by which
#'   the next space would be replaced with `\n` to move text to next line. Only
#'   one argument from either `nword` or `nchar` is used, otherwise an error is
#'   generated.
#'
#' @return Returns a formatted string.
#'
#' @examples
#' tea_text <- "This is a lovely cup of tea"
#'
#' add_line_breaks(text = tea_text, nword = 2)
#'
#' add_line_breaks(text = tea_text, nword = 3)
#'
#' # Display text in a plot
#' plot.new()
#' text(
#'   x = 0.5,
#'   y = 0.5,
#'   labels = add_line_breaks(text = tea_text, nword = 3),
#'   cex = 1.6
#' )
#'
#' # Applying to a long string
#' paste0("word",1:100, collapse = " ") %>%
#'   add_line_breaks(nword = 3) %>%
#'   message()
#'
#' # Define breaks using characters
#' message(
#'   add_line_breaks(
#'     text = "Oh wow. Amazing. I cannot believe that this is actually possible!",
#'     nchar = 10)
#'   )
#'
#' @export
#'
add_line_breaks <-  function(text, nword = NULL, nchar = NULL) {

  if(is.null(nword) & is.null(nchar)){

    stop("Please provide a valid value to either `nword` or `nchar`.")

  } else if(!is.null(nword) & !is.null(nchar)){

    stop(
      "Please only supply a value to either `nword` or `nchar`, not both"
      )

  } else if(!is.null(nword)){

    # Handle empty string
    if(text == "") {
      return("")
    }

    words_list <- unlist(stringr::str_split(text, " "))
    nwords_val <- nwords(text)

    # Return index of spaces to insert line break
    ind <- which(sapply(1:nwords_val, function(x) x %%  nword) == 0)

    # If no breaks, return original with trailing space + newline
    if(length(ind) == 0) {
      return(paste0(text, " \n"))
    }

    for(i in 0:(length(ind)-1)){
      new_index <- ind[i + 1] + i

      words_list <- append(words_list, "\n", after = new_index)
    }

    result <- paste0(words_list, collapse = " ")
    
    # If result doesn't end with " \n", add it
    if(!grepl(" \\n$", result)) {
      result <- paste0(result, " \n")
    }
    
    result

  } else if(!is.null(nchar)){

    # Handle empty string - return newline for consistency
    if(text == "") {
      return("\n")
    }

    # Split string into chunks of nchar length
    chars <- strsplit(text, "")[[1]]
    n_chars <- length(chars)
    
    # If there are no characters or only whitespace, use simple pattern
    if(n_chars == 0 || grepl("^\\s*$", text)) {
      return("\n")
    }
    
    # Check if string contains no spaces (needs character-based splitting)
    if(!grepl(" ", text)) {
      # Split at exact character positions
      result <- ""
      for(i in seq(1, n_chars, by = nchar)) {
        end_pos <- min(i + nchar - 1, n_chars)
        chunk <- paste0(chars[i:end_pos], collapse = "")
        result <- paste0(result, chunk, "\n")
      }
      return(result)
    }
    
    # For strings with spaces, use word-boundary pattern
    patt <- paste0(
      '(.{1,',
      nchar,
      '})(\\s|$)'
    )

    result <- gsub(
      pattern = patt,
      replacement = '\\1\n',
      x = text
    )
    
    result
  }
  }
