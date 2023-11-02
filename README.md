**An R Package for Calculating the Z value for Normal Approximation in Wilcoxon Rank Sum Test Comparing Two Independent Samples**

## Introduction

This R package performs the Wilcoxon rank sum test for comparing two independent samples. 

It assumes that n1 ≤ n2, where n1 and n2 are the sample sizes. If n1 or n2-n1 exceed the range of the T table, the normal approximation test is applied, using the Z value correction formula to calculate the Z value. The package can be used to test the null hypothesis that the two samples come from the same population against the alternative hypothesis that they come from different populations with different location parameters. 

The package returns the z-value.

## Basic usage

```R
rm(list = ls())
set.seed(123)
dataset = data.frame(
  id = 1:1000,
  age = sample(18:65, size = 1000, replace = TRUE),
  group = sample(c("A", "B"), size = 1000, replace = TRUE)
)
# id age group
# 1  1  48     B
# 2  2  32     A
# 3  3  31     A
# 4  4  20     B
# 5  5  59     A
# 6  6  60     A

z.value = wilcox.z("age","group",dataset)
```

## Credits

This package was  developed by [Xiaobao Yang](https://github.com/sur-yang) in collaboration with [Ruizhi Chai](https://github.com/sur-berry).