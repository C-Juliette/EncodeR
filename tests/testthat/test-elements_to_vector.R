test_that("String is split", {
  actual <- elements_to_vector("R, Python, C++, Java")
  expected <- c("R", "Python", "C++", "Java")
  expect_equal(actual, expected)
})
