#' Contingency table by referencing data and variables
#'
#' Produce a contingency table with percentage signs.
#' @param x Data frame to be passed through
#' @param var_org The organising variable, i.e. variable for grouping categories. \cr
#' For instance, age could be the grouping variable if you want to compare frequencies across age-groups. 
#' @param var_per The variable for which you want the percentages / frequencies.
#' @keywords contingency table
#' @examples breakitdown(mtcars,am,gear)
#' # A tibble: 4 x 4
#' # Groups:   am [2]
#'      am  gear     n rel.freq
#' * <dbl> <dbl> <int>    <chr>
#' 1     0     3    15      79%
#' 2     0     4     4      21%
#' 3     1     4     8      62%
#' 4     1     5     5      38%

breakitdown <- function(x,var_org,var_per){
  as.rel_freq <- function(x, rel_freq_col = "rel.freq", ...) {
    class(x) <- c("rel_freq", class(x))
    attributes(x)[["rel_freq_col"]] <- rel_freq_col
    x
  }
  
  #Print % signs
  print.rel_freq <- function(x, ...) {
    freq_col <- attributes(x)[["rel_freq_col"]]
    x[[freq_col]] <- paste0(round(100 * x[[freq_col]], 0), "%")   
    class(x) <- class(x)[!class(x)%in% "rel_freq"]
    print(x)
  }
  
  qvar1 <-enquo(var_org)
  qvar2 <-enquo(var_per)
  
  #Build table
  x %>%
    group_by(!!qvar1,!!qvar2) %>%
    summarise (n=n()) %>%
    mutate(rel.freq = n/sum(n)) %>%
    as.rel_freq()
}

