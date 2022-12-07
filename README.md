
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aocr

<!-- <img src="man/figures/logo.png" width="160px" align="right" /> -->

> 💻 An R client for accessing [Advent of
> Code](https://adventofcode.com/)’s data This package will only help
> obtain data, it will not assist in posting solutions via HTTP request
> All requests are cached to reduce the number of interactions with
> Advent of Code’s website

<!-- badges: start -->
<!-- badges: end -->

## Installation

You can install the dev version of **{aocr}** from
[GitHub](https://github.com/koderkow/aocr) with:

``` r
devtools::install_packages("koderkow/aocr")
```

# Load the package

``` r
library(aocr)
```

# Session ID

A session ID is needed to get a proper response from the Advent of
Code’s website. To obtain and set this as an environment variable run
`aoc_set_session_id()`.

# Obtaining data

## Tibble

There are currently two function for obtaining data for the Advent of
Code challenges:

``` r
d_init <- aoc_get_data_as_tibble(2022, 1)

head(d_init)
#> # A tibble: 6 × 1
#>   col_1
#>   <dbl>
#> 1  2494
#> 2  8013
#> 3  1055
#> 4  5425
#> 5  9104
#> 6 10665
```

## Raw response

If `aoc_get_data_as_tibble()` doesn’t get the data in the right format,
working with the response will be needed.
[{httr2}](https://httr2.r-lib.org/) is the engine for making HTTP
requests. Familiarity with that package will be needed to clean/parse
the response.

``` r
resp <- aoc_get_response(2022, 1)

resp
#> <httr2_response>
#> GET https://adventofcode.com/2022/day/1/input
#> Status: 200 OK
#> Content-Type: text/plain
#> Body: In memory (10477 bytes)
```

# View the puzzle

If you need to view the puzzle’s information to review or submit a
solution it can be quickly pulled up via web browser:

``` r
aoc_view_puzzle(2022, 1)
```
