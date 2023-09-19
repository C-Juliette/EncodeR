### DEFAULT BEHAVIOR

test_that("1 - Correctly identifies categories", {
  actual <- find_categories_in_string("C, C++, Scala")
  expected <- c("C", "C++", "Scala")
  expect_equal(actual, expected)
})

### OTHER SEPARATORS

test_that("2 - Correctly identifies categories with semicolon separators", {
  actual <- find_categories_in_string("C; C++; Scala", sep=";")
  expected <- c("C", "C++", "Scala")
  expect_equal(actual, expected)
})

test_that("3 - Correctly identifies categories with hyphen separators", {
  actual <- find_categories_in_string("C - C++ - Scala", sep="-")
  expected <- c("C", "C++", "Scala")
  expect_equal(actual, expected)
})

test_that("4 - Correctly identifies categories with space separators", {
  actual <- find_categories_in_string("C C++ Scala", sep=" ")
  expected <- c("C", "C++", "Scala")
  expect_equal(actual, expected)
})

### NO DUPLICATION

test_that("5 - Correctly handles duplicated categories and returns them as non-duplicated categories", {
  actual <- find_categories_in_string("C, C++, Scala, C")
  expected <- c("C", "C++", "Scala")
  expect_equal(actual, expected)
})


### DUPLICATED CATEGORIES IF unique=FALSE

test_that("6 - Correctly keeps duplicated categories when unique is set to FALSE", {
  actual <- find_categories_in_string("C, C++, Scala, C", unique=FALSE)
  expected <- c("C", "C++", "Scala", "C")
  expect_equal(actual, expected)
})
