test_that("day 05", {
  expect_equal(diagnostic_program(c(1002, 4, 3, 4, 33)),
               c(1002, 4, 3, 4, 99))
  expect_equal(diagnostic_program(c(3, 0, 4, 0, 99), input = 2),
               2)
})
