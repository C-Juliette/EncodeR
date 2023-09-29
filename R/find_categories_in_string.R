#' find_categories_in_string
#'
#' @param my_string a string with separators. Ex : "A, B, C"
#' @param sep separator used in the string. Ex : ","
#' @param unique if TRUE, eliminates duplicates (keeps only one instance of each category)
#'
#' @return a vector that holds strings, with each string representing a category
#' @export
#'
#' @examples
#' find_categories_in_string("C++, C, Scala")
#' find_categories_in_string("C++; C; Scala", sep=";")
#' find_categories_in_string("C++, C, Scala, C")
#' find_categories_in_string("C++, C, Scala, C", unique=FALSE)
find_categories_in_string <- function(my_string, sep = ",", unique=TRUE){

  if(is.na(my_string)){return(NA)}
  else {

  categories <- my_string |> stringr::str_split_1(sep) |> stringr::str_trim()

  if(unique){categories <- categories |> unique()}

  return(categories)
  }
}
