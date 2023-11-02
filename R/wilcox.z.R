#' Calculating the Z Statistic for Normal Approximation in Wilcoxon Rank Sum Test Comparing Two Independent Samples
#' @description
#' This R package performs the Wilcoxon rank sum test for comparing two independent samples. It assumes that n1 ≤ n2, where n1 and n2 are the sample sizes. If n1 or n2-n1 exceed the range of the T table, the normal approximation test is applied, using the Z value correction formula to calculate the Z value. The package can be used to test the null hypothesis that the two samples come from the same population against the alternative hypothesis that they come from different populations with different location parameters. The package returns the test z-value.
#'
#' @param x A character string indicating the continuous variable.
#' @param y A character string indicating the categorical variable.
#' @param data A data frame containing the continuous and categorical variables.
#'
#' @return A numeric value of Z static
#' @export
#'
#' @examples
#' rm(list=ls())
#' set.seed(123)
#' dataset=data.frame(id=1:1000,age=sample(18:65, size = 1000, replace = TRUE),group=sample(c("A","B"), size = 1000, replace = TRUE))
#' z.value = wilcox.z("age","group",dataset)
#' @importFrom dplyr %>%
#'
wilcox.z<-function(x,y,data){
  df<-data
  df[,y]<-as.character(df[,y])
  # calculate rank
  df$rank<-rank(df[,x])
  dt<-as.data.frame(table(df[,y]))%>%dplyr::arrange(Freq)
  group<-dt[1,1]%>%as.character()
  # calculate rank sum of group with less samples
  T1<-sum(df[df[,y]==group,"rank"])

  # get N1,N2,N
  n1<-nrow(df[df[,y]==group,])
  n2<-nrow(df)-n1
  n<-nrow(df)
  j<-as.data.frame(table(df[,x]))%>%dplyr::pull(Freq)
  dup<-0
  for (i in j) {
    dup<-dup+i^3-i
  }
  zc<-(abs(T1-(n1*(n+1)/2))-0.5) / sqrt(n1*n2*(n^3 -n-dup)/(12*n*(n-1)))
  return(zc)
  print(zc)
}
