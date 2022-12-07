#' Get Advent of Code data as a tibble
#'
#' @description Obtains the data from the wanted **year** and **day** and transform the data into a tibble.
#'
#' Reading the response into a tibble makes the following assumptions using [readr::read_delim()];
#' - delim = "\n"
#' - skip_empty_rows = FALSE
#' - show_col_types = FALSE
#'
#' Responses will be cached to reduce the number of requests sent to the Advent of Code website.
#'
#' @family HTTP Requests
#'
#' @inheritParams aoc_get_response
#'
#' @return Tibble containing data from the wanted **year** and **day**.
#' @export
#'
#' @examples
#' \dontrun{
#' d <- aoc_get_data_as_tibble(2022, 1)
#' }
aoc_get_data_as_tibble <- function(
  year,
  day
) {
  resp <- aoc_get_response(
    year = year,
    day = day
  )

  resp_string <-
    resp %>%
    httr2::resp_body_string()

  d_init <- readr::read_delim(
    file = resp_string,
    delim = "\n",
    col_names = "col_1",
    skip_empty_rows = FALSE,
    show_col_types = FALSE
  )

  return(d_init)
}
