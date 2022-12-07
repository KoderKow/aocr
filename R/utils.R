prompt_session_id <- function() {
  v_session_id <- trimws(readline("Enter session ID: "))

  return(v_session_id)
}

set_renv <- function(...) {
  dots <- list(...)

  stopifnot(are_named(dots))

  vars <- names(dots)

  x <- paste0(names(dots), "=", dots)
  x <- paste(x, collapse = "\n")

  for (var in vars) {
    check_renv(var)
  }

  append_lines(x, file = .Renviron())

  readRenviron(.Renviron())

  usethis::ui_done("Your session ID has been recorded for this session and saved as `AOC_SESSION` as an environment variable for future sessions. To reference your environment variables use {usethis::ui_code('usethis::edit_r_environ()')}.")

  return(invisible())
}

check_renv <- function(var = NULL) {
  if (!file.exists(.Renviron())) {
    return(invisible())
  }

  if (is_incomplete(.Renviron())) {
    append_lines("", file = .Renviron())
  }

  if (!is.null(var)) {
    clean_renv(var)
  }

  return(invisible())
}

append_lines <- function(x, ...) {
  args <- define_args(
    c(x, list(...)),
    append = TRUE,
    fill = TRUE
  )

  do.call("cat", args)
}

are_named <- function(x) is_named(x) && !"" %in% names(x)

home <- function() {
  if (!identical(Sys.getenv("HOME"), "")) {
    file.path(Sys.getenv("HOME"))
  } else {
    file.path(normalizePath("~"))
  }
}

.Renviron <- function() {
  if (file.exists(".Renviron")) {
    ".Renviron"
  } else {
    file.path(home(), ".Renviron")
  }
}

is_incomplete <- function(x) {
  con <- file(x)
  x <- tryCatch(readLines(con, encoding = "UTF-8"), warning = function(w) {
    return(TRUE)
  })
  close(con)
  ifelse(isTRUE(x), TRUE, FALSE)
}

define_args <- function(args, ...) {
  dots <- list(...)
  nms <- names(dots)
  for (i in nms) {
    if (!has_name(args, i)) {
      args[[i]] <- dots[[i]]
    }
  }
  args
}

has_name <- function(x, name) isTRUE(name %in% names(x))

clean_renv <- function(var) {
  x <- read_lines(.Renviron())
  x <- grep(sprintf("^%s=", var), x, invert = TRUE, value = TRUE)
  writeLines(x, .Renviron())
}

read_lines <- function(x, ...) {
  con <- file(x)
  x <- readLines(con, warn = FALSE, encoding = "UTF-8", ...)
  close(con)
  x
}
