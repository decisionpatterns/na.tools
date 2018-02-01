#' Tests for missing values
#' 
#' Test if all values are missing
#' 
#' @param x object to test.
#' 
#' @details 
#' 
#' These are S3 Generics that provide default methods. 
#' 
#' `all_na` reports if **all** values are missing. 
#' 
#' @return 
#'   logical scalar indicating if values are missing.
#'   
#' @seealso 
#'  * [which.na()]
#'
#' @examples
#' 
#'   all_na( c( NA, NA, 1 ) )    # FALSE
#'   all_na( c( NA, NA, NA ) )   # TRUE
#'   
#'   df <- data.frame( char = rep(NA_character_, 3), nums=1:3)
#'   all_na(df)  # FALSE
#'   
#'   df <- data.frame( char = rep(NA_character_, 3), nums=rep(NA_real_,3))
#'   all_na(df)  # TRUE
#'   
#' @export

all_na <- function(x) UseMethod('all_na') 

#' @export 
#' @rdname all_na 

all_na.default <- function(x) all( is.na(x) )


#' @rdname all_na 
#' @export
all.na <- function(x) { 
  warning( "'all.na' is deprecated. Use 'all_na' instead." ) 
  all_na
}

    
#' @rdname all_na 
#' @export

na.all <- function(x) {
  warning( "'na.all' is deprecated. Use 'all_na' instead." )
  all_na(x)
}
