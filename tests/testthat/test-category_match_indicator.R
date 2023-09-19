test_that("1 - Positive category match", {
  actual <- category_match_indicator("C, C++, R", "R")
  expected <- 1
  expect_equal(actual, expected)
})

test_that("2 - Negative category match", {
  actual <- category_match_indicator("C, C++, AnotheR", "R")
  expected <- 0
  expect_equal(actual, expected)
})

test_that("3 - No category match", {
  actual <- category_match_indicator("C++, R", "C")
  expected <- 0
  expect_equal(actual, expected)
})

test_that("4 - Category match with whitespace", {
  actual <- category_match_indicator("C, R", "C")
  expected <- 1
  expect_equal(actual, expected)
})

test_that("5 - No category match with different category", {
  actual <- category_match_indicator("C, R", "C++")
  expected <- 0
  expect_equal(actual, expected)
})

test_that("6 - Category match with spaces", {
  actual <- category_match_indicator(" C , R", "C")
  expected <- 1
  expect_equal(actual, expected)
})

test_that("7 - Category match with leading space", {
  actual <- category_match_indicator(" C, R", "C")
  expected <- 1
  expect_equal(actual, expected)
})

test_that("8 - Category match with trailing space", {
  actual <- category_match_indicator("C , R", "C")
  expected <- 1
  expect_equal(actual, expected)
})
