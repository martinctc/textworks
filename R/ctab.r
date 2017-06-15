#' Pass a variable and return a contingency table by column percentages
#' 
#' Use vector/variable as argument, and a contingency table by column percentages is returned as output.
#' Function still works even if variable is not of factor class (unless it cannot be converted).
#' 
#' @param vec Vector to be passed through.
#' @keywords contingency table
#' @export
#' @examples 
#' Q12 <- sample(c("Sandwich","Porridge","Muesli/cereal","Other","No breakfast"),2000,replace=TRUE,prob=c(0.2,0.15,0.25,0.15,.25))
#' Q12 <- factor(Q12)
#' ctab(Q12)
#'               Q   Prop
#'1 Muesli/cereal  0.201
#'2  No breakfast  0.249
#'3         Other 0.1485
#'4      Porridge  0.201
#'5      Sandwich  0.249

ctab <- function(vec){
  var<-list(0)
  prop<-list(0)
  tab<-data.frame(Q=0,Prop=0)
  
  if(class(vec)!="Factor"){
    vec <- factor(vec)
  }
  
  for(i in 1:nlevels(vec)){
    var[i]<-levels(vec)[i]
    prop[i]<-mean(vec==levels(vec)[i])
  }

  var <- unlist(var)
  prop <- unlist(prop)
  tab <- cbind(var,prop) %>% as.data.frame()
  names(tab)<-c("Q","Prop")
  tab
}




