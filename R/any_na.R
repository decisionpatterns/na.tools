#' @details 
#' 
#' `any_na` reports if **any** values are missing.
#' 
#' @seealso 
#'  - [anyNA()]
#'   
#' @examples
#'   any_na( 1:10 )           # FALSE
#'   any_na( c( 1, NA, 3 ) )  # TRUE
#' 
#' @md
#' @rdname all_na  
#' @export
any_na <- function(x) UseMethod('any_na') 


#' @rdname all_na
#' @export
any_na.default <- function(x) anyNA(x)
  

# #' @rdname all_na  
# #' @export
# any.na <- any_na

#' @rdname all_na
#' @export 
na.any <- function(x) {
  warning("'na.any' is deprecated. Use 'any_na' instead.")
  any_na(x)
}
