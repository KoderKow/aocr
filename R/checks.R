check_credentials <- function() {
  if (Sys.getenv("AOC_SESSION") == "") {
    abort(c(
      "Advent of Code session ID is needed to download data",
      i = "Use `aoc_set_session_id()` to get set up"
    ))
  }

  return()
}
