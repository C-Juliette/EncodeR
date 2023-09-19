test_that("1 - Correctly identifies categories in semicolon-separated strings", {
  df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
                       Programming_languages=c("C; Scala", "C; C++; R; Python", "C++; Python"))
  actual <- "todo" # df |> encode_as_binary(Programming_languages)
  expected <- "todo"
  expect_equal(actual, expected)
})
