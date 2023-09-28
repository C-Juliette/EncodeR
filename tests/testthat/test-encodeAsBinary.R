test_that("1 - Correctly identifies categories in comma-separated strings", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C, Scala", "C, C++, R, Python", "C++, Python"))
  actual <- df |> encode_as_binary(Programming_languages)
  expected <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                             C=c(1L, 1L, 0L),
                             Scala=c(1L, 0L, 0L),
                             `C++`=c(0L, 1L, 1L),
                             R=c(0L, 1L, 0L),
                             Python=c(0L, 1L, 1L))
  expect_equal(actual, expected)
})


test_that("1 - Correctly identifies categories in semicolon-separated strings", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C; Scala", "C; C++; R; Python", "C++; Python"))
  actual <- df |> encode_as_binary(Programming_languages, sep=";")
  expected <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                             C=c(1L, 1L, 0L),
                             Scala=c(1L, 0L, 0L),
                             `C++`=c(0L, 1L, 1L),
                             R=c(0L, 1L, 0L),
                             Python=c(0L, 1L, 1L))
  expect_equal(actual, expected)
})
