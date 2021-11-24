test_that("day 03", {
  example1 <- list(c('R8', 'U5', 'L5', 'D3'),
                   c('U7', 'R6', 'D4', 'L4'))
  example2 <- list(c('R75','D30','R83','U83','L12','D49','R71','U7','L72'),
                   c('U62','R66','U55','R34','D71','R55','D58','R83'))

  expect_equal(find_intersection(example1[[1]], example1[[2]]), 6)
  expect_equal(find_intersection(example2[[1]], example2[[2]]), 159)
  expect_equal(find_intersection2(example1[[1]], example1[[2]]), 30)
  expect_equal(find_intersection2(example2[[1]], example2[[2]]), 610)
})
