library(adventofcode2019)
input03 <- strsplit(readLines(input_file(3)), ',')
message(do.call(find_intersection, input03))
message(do.call(find_intersection2, input03))

