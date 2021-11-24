test_that("day 1", {
  expect_equal(fuel(12), 2)
  expect_equal(fuel(14), 2)
  expect_equal(fuel(1969), 654)
  expect_equal(fuel(100756), 33583)

  expect_equal(add_fuel(14), 2)
  expect_equal(add_fuel(1969), 966)
  expect_equal(add_fuel(100756), 50346)
})
