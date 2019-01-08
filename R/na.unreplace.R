#' na.unreplace
#' 
#' Change pattern to `NA`s, ie make explicit `NAs` back to `NA`
#' 
#' @param x object
#' @param pattern Either a stringr pattern suchs a [stringr::regex()] or a 
#'   charcter vector of values to match and can be coerced to `class(x)`. These
#'   will  be set to `NA`.
#' 
#' @details 
#' 
#' `na.unreplace` replaces `pattern` by `NA`. It is meant to be nearly inverse 
#'  operation to `na_replace` (and `na_explicit`). It can be used on both atomic 
#'  and recursive objects. Unlike  `na.replace` however, `pattern ` express the 
#'  pattern that if matched are set to `NA`.  It is basically:
#'  
#'  ```
#'  x[ x %in% pattern ] <- NA
#'  ````
#'  
#'  `na.unreplace` is a S3 method that can be used to defince additional 
#'  methods for other objects.
#' 
#' @seealso 
#' 
#'  - [na.replace()]
#'  - [stringr::detect()]
#'  
#' @examples 
#' 
#'  na.unreplace( c(1,2,3,4), 3 )
#'  na.unreplace( c("A", "(NA)", "B", "C") )
#'  na.unreplace( c("A", NA_explicit_, "B", "C") )
#'  
#'  df <- data.frame( char=c('A', 'NA', 'C', NA_explicit_), num=1:4 ) 
#'  na.unreplace(df)
#'  
#'  na.unreplace( c("A", "NA", "N/A"), regex( "n.a", ignore_case=TRUE ) )
#'  
#' @importFrom stringr str_detect
#' @export 

na.unreplace <- function( x, pattern ) 
  UseMethod('na.unreplace')

#' @rdname na.unreplace
#' @export
na.unreplace.default <- function(x, pattern=NULL) 
  if( is.recursive(x) ) .na.unreplace.recursive(x, pattern ) else
  .na.unreplace.atomic( x, pattern )

.na.unreplace.recursive <- function(x,pattern=NULL) {
  for( i in 1:length(x) ) 
    x[[i]] <- na.unreplace( x[[i]], pattern )  
  x
}

.na.unreplace.atomic <- function(x, pattern=NULL ) {
  if( is(pattern, "pattern") ) 
    x[ str_detect(x, pattern) ] <- NA else 
    x[ x %in% pattern ] <- NA
  x
}


#' @rdname na.unreplace
#' @export
na.unreplace.character <- function( x, pattern=c("NA", NA_explicit_) ) {

  if( is(pattern, "pattern") ) 
    x[ str_detect(x, pattern) ] <- NA else 
    x[ x %in% pattern ] <- NA
  x
}

#' @rdname na.unreplace
#' @export
na.unreplace.factor <- function( x, pattern=c("NA", NA_explicit_) ) {
  
  if( is(pattern, "pattern") ) 
    x[ str_detect(x, pattern) ] <- NA else 
    x[ x %in% pattern ] <- NA
  
  x
}

#' @rdname na.unreplace
#' @export
na.implicit <- na.unreplace
