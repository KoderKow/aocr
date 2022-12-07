#' Get a response from Advent of Code
#'
#' Get the data from the wanted year and day for Advent of Code. Responses will be cached to reduce the number of requests sent to the Advent of Code website.
#'
#' @family HTTP Request functions
#'
#' @param day Numeric. Day of the challenge.
#' @param year Numeric. Year of the challenge.
#'
#' @return A **httr2_response** object that will need to be interacted with using [httr2's response handling functions](https://httr2.r-lib.org/reference/index.html#handle-the-response).
#' @export
#'
#' @examples
#' \dontrun{
#' resp <- aoc_get_response(2022, 1)
#' }
aoc_get_response <- function(
  year,
  day
) {
  ## Check if AOC_SESSION exists
  check_credentials()
  ## Verify data types
  checkmate::check_numeric(day)
  checkmate::check_numeric(year)

  req <-
    httr2::request("https://adventofcode.com") %>%
    httr2::req_url_path_append(year, "day", day, "input") %>%
    httr2::req_cache(tempdir(), debug = TRUE) %>%
    httr2::req_options(Cookie = glue("session={Sys.getenv('AOC_SESSION')}"))

  resp <-
    req %>%
    httr2::req_perform()

  # TODO Error handling

  return(resp)
}
