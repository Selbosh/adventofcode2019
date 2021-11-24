library(adventofcode2019)
input02 <- read.csv(input_file(2), header = FALSE)
input02 <- as.integer(input02)
input02[1:2 + 1] <- c(12, 2)
message(compute(input02)[1])

stop <- FALSE
for (noun in 0:99) {
  if (stop) break
  for (verb in 0:99)
    if (stop <- noun_verb(input02, noun, verb)) {
      message(100 * noun + verb)
      break
    }
}

