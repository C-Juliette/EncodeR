#' find_categories
#'
#' @param df a dtaframe
#' @param categories_col the name of the column containing string with categories inside
#' @param sep separator used in the strings. Ex : ,"
#'
#' @return a vector that list all categories in the considered column of the dataframe
#' @export
#'
#' @examples
#' df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
#' Programming_languages=c("C, Scala","C, C++, R, Python", "C++, Python"))
#' df |> find_categories(Programming_languages)
find_categories <- function(df, categories_col, sep=","){
  all_categories <-
    df |>
    dplyr::summarize(all_categories = paste({{ categories_col }}, collapse=sep)) |>
    dplyr::pull() |>
    find_categories_in_string(sep)
  return(all_categories)
}
