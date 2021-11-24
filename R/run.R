#' Get solution for a particular day
#'
#' @param day integer between 1 and 25
#'
#' @export
get_solution <- function(day = 1) {
  stopifnot(day >= 1 & day <= 25)
  source(system.file(c('inst', sprintf('solution%02d.R', day)),
                     package = 'adventofcode2019'))
}

#' Get path to input file
#'
#' @param day integer between 1 and 25
#'
#' @return String, e.g. `/path/to/input01.txt`
#' @export
input_file <- function(day) {
  stopifnot(day >= 1 & day <= 25)
  system.file(c('inst', sprintf('input%02d.txt', day)),
              package = 'adventofcode2019')
}
