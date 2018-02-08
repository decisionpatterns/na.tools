#' `na.median` imputes with the median value of `x`. The median is only valid
#' for numeric or logical values.
#' 
#' @seealso 
#'  [median()]
#'   
#' @examples 
#'   na.median( c(1,2,NA_real_,3) )
#'       
#' @rdname impute-commutative
#' @import stats 
#' @export

na.median <- function( .x, ... ) 
  na.replace( .x, .na=function(x, ...) median(x, na.rm=TRUE, ... ) )


#' @details 
#' 
#' `na.quantile` imputes with a quantile given by the `prob` argument that is 
#' passed to [quantile()]
#'   
#' @seealso 
#'   * [quantile()]
#'   
#' @examples
#'   na.quantile( c(1,2,NA_real_,3), prob=0.4 )
#' 
#' @rdname impute-commutative
#' @export

na.quantile <- function(.x, ... ) 
  na.replace( .x, .na=function(x,...) quantile(x, na.rm=TRUE, ... ) )
