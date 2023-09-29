#' encode_as_booleans
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
#' df |>  encode_as_booleans(Programming_languages)
#'
#' @import rlang
encode_as_booleans <- function(df, categories_col, sep = ",",
                           keep_categories_col = FALSE) {

  empty_str_col <- df |> dplyr::summarise(col =  all(eval(df, {{ categories_col }})=="")) |> dplyr::pull()
  NA_col <- df |>  dplyr::summarise(col =  all(is.na({{ categories_col }}))) |> dplyr::pull()
  empty_str_or_NA_col <- df |>  dplyr::summarise(col =  all({{ categories_col }}=="" | is.na({{ categories_col }}))) |> dplyr::pull()
  if (empty_str_col){warning(glue::glue("{categories_col} only contains empty strings"))}
  else if(NA_col)
  {warning(glue::glue("{categories_col} only contains NA"))}
  else if(empty_str_or_NA_col)
  {warning(glue::glue("{categories_col} only contains NA or empty strings"))}
  else {
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
  }




