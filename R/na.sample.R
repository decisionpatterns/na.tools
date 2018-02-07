#' na.sample
#' 
#' Replace missing values with value randomly drawn from x
#' 
#' @param .x vector with 
#' @param ... additional arguments passed to [base::sample()]
#' 
#' @details 
#' 
#' `na.random` replaces missing values by sampling the non-missing values. By 
#' default aampling occurs **with replacement** since more valuables may be needed than
#' are available. This function is based on [base::sample()].
#' 
#' The default is to replace bv sampling a population defined by the 
#' non-missing values of `.x` **with replacement** 
#'  
#' `na.random` is an alias for `na.sample`.
#' `
#' @seealso 
#'  * [base::sample()]
#' 
#' 
#' @note `na.sample` is **non-deterministic**. Use 
#'       [base::set.seed()] to make it deterministic
#' 
#' @examples
#'   x <- c(1,NA,3)
#'   na.sample(x)
#'   
#' @export

na.sample <- function(.x, ... ) { 
  # args() <- list( x=.x, replace=TRUE )   # Need this because more values might be needed than available
  # new_args <- modifyList( args, list(...) )
  na.replace( .x, .na=function(x, ...) sample( na.omit(x), replace=TRUE, ...) ) 
}

              
#' @rdname na.sample
#' @export
na.random <- na.sample


#' @rdname na.sample
#' @export
na.resample <- na.sample

#' @rdname na.sample
#' @export
na.bootstrap <- na.sample