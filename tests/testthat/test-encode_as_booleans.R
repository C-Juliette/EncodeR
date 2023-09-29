test_that("1 - Correctly identifies categories in comma-separated strings", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C, Scala", "C, C++, R, Python", "C++, Python"))
  actual <- df |> encode_as_booleans(Programming_languages)
  expected <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                             C=c(1L, 1L, 0L),
                             Scala=c(1L, 0L, 0L),
                             `C++`=c(0L, 1L, 1L),
                             R=c(0L, 1L, 0L),
                             Python=c(0L, 1L, 1L))
  expect_equal(actual, expected)
})


test_that("2 - Correctly identifies categories in semicolon-separated strings", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C; Scala", "C; C++; R; Python", "C++; Python"))
  actual <- df |> encode_as_booleans(Programming_languages, sep=";")
  expected <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                             C=c(1L, 1L, 0L),
                             Scala=c(1L, 0L, 0L),
                             `C++`=c(0L, 1L, 1L),
                             R=c(0L, 1L, 0L),
                             Python=c(0L, 1L, 1L))
  expect_equal(actual, expected)
})

test_that("3 - Test with NA as an entry", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C; Scala", "C; C++; R; Python", NA))
  actual <- df |> encode_as_booleans(Programming_languages, sep=";")
  expected <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                             C=c(1L, 1L, NA),
                             Scala=c(1L, 0L, NA),
                             `C++`=c(0L, 1L, NA),
                             R=c(0L, 1L, NA),
                             Python=c(0L, 1L, NA))
  expect_equal(actual, expected)
})

test_that("4 - Test with empty string as an entry", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C; Scala", "C; C++; R; Python", ""))
  actual <- df |> encode_as_booleans(Programming_languages, sep=";")
  expected <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                             C=c(1L, 1L, 0L),
                             Scala=c(1L, 0L, 0L),
                             `C++`=c(0L, 1L, 0L),
                             R=c(0L, 1L, 0L),
                             Python=c(0L, 1L, 0L))
  expect_equal(actual, expected)
})

test_that("5 - Test with empty column (empty string)", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("", "", ""))
  actual <- df |> encode_as_booleans(Programming_languages)
  expected <- "Programming_languages only contains empty strings"
  expect_warning(actual, expected)
})
