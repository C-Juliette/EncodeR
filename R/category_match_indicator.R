#' category_match_indicator
#'
#' @param categories_str todo
#' @param category todo
#'
#' @return todo
#' @export
#'
#' @examples
#' category_match_indicator("C, C++, R", "R")
category_match_indicator <- function (categories_str, category){
  dplyr::if_else(category %in% find_categories_in_string(categories_str), 1, 0)
}

# TODO : check NA
