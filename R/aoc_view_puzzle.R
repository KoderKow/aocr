#' Open the puzzle in the browser
#'
#' Opens a web browser to the page of the wanted **year** and **day**
#'
#' @inheritParams aoc_get_response
#'
#' @return Nothing.
#' @export
#'
#' @examples
#' \dontrun{
#' aoc_view_puzzle(2022, 1)
#' }
aoc_view_puzzle <- function(
  year,
  day
) {
  utils::browseURL(glue("https://adventofcode.com/{year}/day/{day}"))

  return(invisible())
}
