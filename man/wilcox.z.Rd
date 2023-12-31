% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wilcox.z.R
\name{wilcox.z}
\alias{wilcox.z}
\title{Calculating the Z Statistic for Normal Approximation in Wilcoxon Rank Sum Test Comparing Two Independent Samples}
\usage{
wilcox.z(x, y, data)
}
\arguments{
\item{x}{A character string indicating the continuous variable.}

\item{y}{A character string indicating the categorical variable.}

\item{data}{A data frame containing the continuous and categorical variables.}
}
\value{
A numeric value of Z static
}
\description{
This R package performs the Wilcoxon rank sum test for comparing two independent samples. It assumes that n1 ≤ n2, where n1 and n2 are the sample sizes. If n1 or n2-n1 exceed the range of the T table, the normal approximation test is applied, using the Z value correction formula to calculate the Z value. The package can be used to test the null hypothesis that the two samples come from the same population against the alternative hypothesis that they come from different populations with different location parameters. The package returns the test z-value.
}
\examples{
rm(list=ls())
set.seed(123)
dataset=data.frame(id=1:1000,age=sample(18:65, size = 1000, replace = TRUE),group=sample(c("A","B"), size = 1000, replace = TRUE))
z.value = wilcox.z("age","group",dataset)
}
