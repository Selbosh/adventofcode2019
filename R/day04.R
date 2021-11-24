#' Secure Container
#'
#' You arrive at the Venus fuel depot only to discover it's protected by a password. The Elves had written the password on a sticky note, but someone threw it out.
#'
#' However, they do remember a few key facts about the password:
#'
#' - It is a six-digit number.
#' - The value is within the range given in your puzzle input.
#' - Two adjacent digits are the same (like 22 in 122345).
#' - Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
#'
#' Other than the range rule, the following are true:
#'
#' - 111111 meets these criteria (double 11, never decreases).
#' - 223450 does not meet these criteria (decreasing pair of digits 50).
#' - 123789 does not meet these criteria (no double).
#'
#' How many different passwords within the range given in your puzzle input meet these criteria?
passwords_slow <- function(from = 273025, to = 767253) {
  candidates <- from:to
  digits <- strsplit(as.character(candidates), '')
  criteria <- vapply(digits,
                     function(x) {
                       diffs <- diff(as.numeric(x))
                       all(diffs >= 0) & any(diffs == 0)
                     },
                     logical(1))
  sum(criteria)
}

# This is much, MUCH faster (about 200x; 5+ sec vs 25 ms)
passwords <- function(number = 273025, max = 767253) {
  acc <- 0
  while (number <= max) {
    digits <- as.integer(strsplit(as.character(number), '')[[1]])
    diffs <- diff(digits)
    if (all(diffs >= 0)) {
      acc <- acc + any(diffs == 0)
      number <- number + 1L
      next
    }
    number <- as.integer(sum(
      (digits - c(0, pmin.int(diffs, 0))) * 10 ^ (5:0)
    ))
  }
  acc
}

passwords2 <- function(number = 273025, max = 767253) {
  acc <- 0
  while (number <= max) {
    digits <- as.integer(strsplit(as.character(number), '')[[1]])
    diffs <- diff(digits)
    if (all(diffs >= 0)) {
      rle <- rle(diffs)
      acc <- acc + any(diffs == 0) * any(rle$lengths[rle$values == 0] == 1)
      number <- number + 1L
      next
    }
    number <- as.integer(sum(
      (digits - c(0, pmin.int(diffs, 0))) * 10 ^ (5:0)
    ))
  }
  acc
}
