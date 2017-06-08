#' Pass a factor variable and return a contingency table by column percentages
#' 
#' Pass a factor variable and return a contingency table by column percentages
#' @param vec Vector to be passed through. Must be a factor variable
#' @keywords contingency table
#' @export
#' @examples 
#' vec <- sample(c("Sandwich","Porridge","Muesli/cereal","Other","No breakfast"),2000,replace=TRUE,prob=c(0.2,0.15,0.25,0.15,.25))
#' vec <- factor(vec)
#' ctab(vec)

ctab <- function(vec){
  for(i in 1:nlevels(vec)){
    var[i]<-levels(vec)[i]
    prop[i]<-mean(vec==vec[[i]])
  }
  tab <-cbind(Q=var,Prop=prop)
  tab <- as.data.frame(tab)
  tab
}


