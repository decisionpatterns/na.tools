#' Identify missing values
#' 
#' Return the indexes of those values that are missing 
#' 
#' @param x vector to search for missing values
#' 
#' @details 
#' 
#' `which_na` is implemented as `which( is.na(x) )`. 
#' It is a S3 generic function. 
#' 
#' @return 
#' 
#' `integer` of indexes of `x` that corerspond to elements
#' of x that are missing (`NA`).  Names of the result
#' are set to the names of `x`.
#' 
#' @seealso 
#' 
#'  * [base::is.na()] - for the variant returning logical 
#' 
#' @examples
#' 
#'   x <- c( 1, NA, NA, 4:6 )
#'   which_na(x)
#'   
#'   names(x) <- letters[1:6]
#'   which_na(x)
#'   
#' @export 

which_na <- function(x) which( is.na(x) )


#' @rdname which_na
#' @aliases na.which
#' @export

na.which <- function(x) {
 message("'which_na' is preferred for vectors.") 
 which_na(x) 
}


#' @rdname which_na
#' @aliases na.which
#' @export

which.na <- function(x) {
  warning("'which.na' is deprecated. Use 'which_na' instead.") 

}