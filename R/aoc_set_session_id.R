#' Assist in obtaining and setting the session ID
#'
#' If the session ID is already in possession, use this function to correctly set the environment variable in the **.Renviron** file. If the session ID is not known, answer and follow the prompts in order to navigate and obtain the session ID.
#'
#' @return Nothing.
#' @export
#'
#' @examples
#' \dontrun{
#' aoc_set_session_id()
#' }
aoc_set_session_id <- function() {
  q1 <- usethis::ui_yeah(
    x = "Do you have your session ID?"
  )

  if (q1) {
    set_renv(AOC_SESSION = prompt_session_id())
  } else {
    usethis::ui_info("The session ID is obtained through the console on Advent of Code.")

    q2 <- usethis::ui_yeah("Is it okay to open advent of code to obtain the session ID? (https://adventofcode.com/2022/day/1/input)")

    if (q2) {
      utils::browseURL("https://adventofcode.com/2022/day/1/input")
    }

    cli::cli_ol()
    cli::cli_li("Once signed in open the console (F12) and go to 'Network'")
    cli::cli_li("Refresh the page")
    cli::cli_li("Under name select 'input'")
    cli::cli_li("Under Request Headers look for 'cookie: session=', this will be your session ID you need to copy")
    cli::cli_li("Paste the session into the next prompt:")
    cli::cli_end()

    set_renv(AOC_SESSION = prompt_session_id())
  }

  return(invisible())
}
