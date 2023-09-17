#' elements_to_vector
#'
#' @param my_string descr
#' @param sep descr
#' @param remove_whitespaces descr
#' @param unique descr
#'
#' @return a vector
#' @export
#'
#' @examples
#' elements_to_vector("R, Pyhton, C++, Java")
  elements_to_vector <- function(my_string, sep = "," , remove_whitespaces = TRUE, unique = TRUE){
  elements_of_entry <-
    my_string |>
    stringr::str_split_1(sep)

  if(remove_whitespaces){elements_of_entry <- elements_of_entry |> stringr::str_trim()}
  if(unique){elements_of_entry <- elements_of_entry |> unique()}

  elements_of_entry
}
