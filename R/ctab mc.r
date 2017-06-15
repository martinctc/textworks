#' Contingency table for a multi-code question
#' 
#' Use a data frame as argument, and a contingency table by column percentages is returned as output.
#' First column will display the codes for the question
#' Each subsequent column of the table will show the column percentages for each question code. 
#' 
#' 
#' @param vec Data frame to be passed through.  
#' Use select() to remove any unnecessary columns (including ID).
#' @keywords contingency table
#' @export
#' @examples 
#' Coming soon


ctab.mc <- function(x){
  ind.tabs <-list()
  x.codes <- ncol(x)
  x.names <- names(x)
  for(i in 1:x.codes){
    ind.tabs[[i]]<-ctab(x[,i])
  }
  all.merged <-merge(x=ind.tabs[[1]],y=ind.tabs[[2]],by="Q") #set up first merge
  for(i in 1:2){
    names(all.merged)[i+1]<-x.names[i]
  }
  
  for(i in 3:x.codes){
    all.merged<-merge(x=all.merged,y=ind.tabs[[i]],by="Q")
    names(all.merged)[i+1]<-x.names[i]
  }
  
  # for(i in 1:x.codes){
  #   names(all.merged)[i+1]<-x.names[i]
  # }
  
  all.merged
}




