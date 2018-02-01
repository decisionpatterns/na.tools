#' @details 
#' 
#' `na.most_freq` replaces all `NA` with the most frequently occuring value. In 
#' the event of ties, the value encounter first is listed first is used.
#' 
#' @examples 
#'   na.most_freq( c(1,1,NA,4) )
#'   na.most_freq( c(1,1,4,4,NA) ) 
#'
#' @rdname impute-cummutative
#' @md
#' @export

na.most_freq <- function(.x, ... ) 
  na.replace(.x, .na=function(x) most_freq(x, na.omit, ...) )
