
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bug17692

<!-- badges: start -->

<!-- badges: end -->

The goal of bug17692 is to …

## Installation

The development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("gvegayon/bug17692")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(bug17692)
#> Loading required package: parallel
## basic example code

cl <- makePSOCKcluster(2)
mean(sim_pi(100, cl))
#> [1] 3.13028
stopCluster(cl) # This works OK with PSOCK cluster

cl <- makeForkCluster(2)
mean(sim_pi(100, cl))
#> [1] 3.1486
stopCluster(cl) # Valgrind detects errors here
```
