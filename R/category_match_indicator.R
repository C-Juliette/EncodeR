#' category_match_indicator
#'
#' @param categories a String. Ex : "Blue, Green, Yellow"
#' @param category a String. Ex : "Blue". The goal is to check if this category exists in categories = "Blue, Green, Yellow"
#' @param sep the separator used in the string. Ex : in categories = "Blue, Green, Yellow", sep=",".
#'
#' @return a Boolean. Is category in categories ? True or False.
#' @export
#'
#' @examples
#' category_match_indicator("Blue, Green, Yellow", "Blue")
#' category_match_indicator("Blue, Green, Yellow", "Red")
#' category_match_indicator("Blue, Green, Yellow", "low")
#' category_match_indicator("C, C++, R", "R")
category_match_indicator <- function (categories, category, sep=','){
  if (is.na(categories)){
    return(NA)
  }
  else {
    return(dplyr::if_else(category %in% find_categories_in_string(categories, sep=sep), 1, 0))
  }

}
