### DEFAULT BEHAVIOR

test_that("1 - Correctly identifies categories in comma-separated strings", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C, Scala", "C, C++, R, Python", "C++, Python"))
  actual <- df |>  find_categories(Programming_languages)
  expected <- c("C", "Scala", "C++", "R", "Python")
  expect_equal(actual, expected)
})

### OTHER SEPARATORS

test_that("2 - Correctly identifies categories in semicolon-separated strings", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C; Scala", "C; C++; R; Python", "C++; Python"))
  actual <- df |>  find_categories(Programming_languages, sep=";")
  expected <- c("C", "Scala", "C++", "R", "Python")
  expect_equal(actual, expected)
})

test_that("3 - Correctly identifies categories in hyphen-separated strings", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C - Scala", "C - C++ - R - Python", "C++ - Python"))
  actual <- df |>  find_categories(Programming_languages, sep="-")
  expected <- c("C", "Scala", "C++", "R", "Python")
  expect_equal(actual, expected)
})
