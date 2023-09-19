#' encodeAsBinary
#'
#' @param df todo
#' @param categories_col todo
#' @param sep todo
#' @param keep_categories_col todo
#'
#' @return todo
#' @export
#'
#' @examples
#' df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"), Programming_languages=c("C, Scala","C, C++, R, Python", "C++, Python"))
#' df |>  encode_as_binary(Programming_languages)
encode_as_binary <- function(df, categories_col, sep = ",",
                           keep_categories_col = FALSE) {

  all_categories <- df |> find_categories(!!rlang::enquo(categories_col))

  for (category in all_categories) {
    df <- df |>
      mutate(
        !!category := purrr::map2_int(!!rlang::enquo(categories_col), category, category_match_indicator)
      )
  #if(!keep_categories_col){df <- df |> mutate()}
  }
  df
}
