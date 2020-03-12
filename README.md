
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ChineseNumerals <img src='man/figures/logo.png' align="right" height="139" />

<!-- badges: start -->

<!-- badges: end -->

The goal of ChineseNumerals is to convert Arabic numerals to Chinese
numerals.

## Installation

You can install the released version of ChineseNumerals from **github**
with:

``` r
devtools::install_github("chinhungtseng/ChineseNumerals")
```

## Example

This is a basic example which shows you how to use this package:

``` r
library(ChineseNumerals)
## basic example code
```

  - Convert to **upper** chinese number

<!-- end list -->

``` r
numeric2Chinese(12345, "upper")
#> [1] "壹萬貳仟參佰肆拾伍"
```

  - Convert to **lower** chinese number

<!-- end list -->

``` r
numeric2Chinese(12345, "lower")
#> [1] "一萬二千三百四十五"
```
