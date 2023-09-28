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
#' df <- tibble::tibble(First_name=c("Marina", "Jane", "Elliot"),
#' Programming_languages=c("C, Scala","C, C++, R, Python", "C++, Python"))
#' df |>  encode_as_binary(Programming_languages)
#'
#' @import rlang
encode_as_binary <- function(df, categories_col, sep = ",",
                           keep_categories_col = FALSE) {

  all_categories <- df |> find_categories({{ categories_col }}, sep=sep)
  for (category in eval(all_categories)) {
    df <- df |>
      dplyr::mutate(
        !!category:=purrr::map2_int({{ categories_col }}, category, ~category_match_indicator(.x, .y, sep = sep))
      )
  }
  if(!keep_categories_col){df <- df |> dplyr::select(-c({{ categories_col }}))}

  df

}




