#' @details 
#' 
#' `na.true` and `na.false` replace missing values with `TRUE` and `FALSE` 
#' respectively.  
#' 
#' @examples 
#'   na.true( c(T,NA,F) )   # T T F
#'   na.false( c(T,NA,F) )  # T F F
#' 
#' @examples 
#'  
#'            
#' @rdname impute-constant
#' @aliases na.true
#' @export

na.true <- function(.x) { 
  na.replace(.x,TRUE)
}

#' @rdname impute-constant
#' @aliases na.true
#' @export

na.false <- function(.x) { 
  na.replace(.x,FALSE)
}
