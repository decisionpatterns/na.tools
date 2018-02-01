
## na.tools: Comprehensive Library for Working with Missing (NA) Values in Vectors

[![License](http://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-2.0.html)
[![CRAN](http://www.r-pkg.org/badges/version/na.tools)](https://cran.rstudio.com/web/packages/na.tools/index.html)
[![Downloads](http://cranlogs.r-pkg.org/badges/na.tools?color=brightgreen)](http://www.r-pkg.org/pkg/na.tools)


**na.tools** is a comprehensive library for handling missing (NA) values.
It has several goals:

1. extend existing `stats::na.*()` functions, 
2. collect all functions for working with missing data together, and 
3. provide a consistent and intuitive interface. 

In this package, there are methods for the detection, removal, replacement, 
imputation, recollection, etc. of missing values (`NAs`). This libraries focus 
is on vectors (atomics). For **tidy**/**dplyr** compliant methods operating on
tables and lists, please use the 
[tidyimpute](https://github.com/decisionpatterns/tidyimpute) package which 
depends on this package.


## Feature List
 
 * Over **50** functions for working with missing values (See [#Function List] below.) 
 * Standardizes and extends `na.*` functions found in the *stats* package.
 * Extensible
 * Calculate statistics on missing values: `na.n`, `na.pct`
 * Remove missing rows: `na.rm` 
 * Replacement/Imputation:
   * Two types of imputations: constant, univariate order-independent
   * Type/class and length-safe replacement. (**na.tools** will never change 
     produce an object with a different length/nrow or type/class of its target.)
   * Replace using scalar, vector or function(s)
   * Replacement by constants values: `na.zero`, `na.inf`, `na.neginf`, `na.zero`
   * Imputation function for common statistics: `na.mean`, `na.median`, `na.max`, `na.min`, `na.quantile`, etc.
   * Imputation by sampling: `na.sample`, `na.random`
   * Easy mnemonics: 
      * functions beginning with `na.` return a transformed version of the input vector.
  
### Upcoming features

 * recall/track which values have been replaced
 * `na.quantile`
   
   
## Installation

### Github 

    devtools::install_github( "decisionpatterns/na.tools")
    
### CRAN 

    install.packages("na.tools")


## Examples

    x <- 1:3
    x[2] <- NA_real_
     
    any.na(x)
    all.na(x)
    which.na(x)
     
    n.na(x)
    pct.na(x)
     
    na.rm(x)
    
    na.replace(x, 2) 
    na.replace(x, mean)
    
    na.zero(x)  
    na.mean(x)

## Function List 

### Calculation 

 * `na.n` - Count mising values 
 * `na.pct` - Calculate pct of missing values

### Identification and Tests

 * `which.na` - Return logical or character indicating which elements are missing 
 * `all.na` (`na.all`)  - test if all elements are missing
 * `any.na` (`na.any`)  - test if any elements are missing
   
### Removal / Ommision / Exclusion 

 * `na.rm` - remove `NA`s  (with tables is equivalent to `drop_cols_all_na` )
 * `na.trim` - remove `NA`s from beginning or end (order matters)
 
 
### Replacement / Imputation ###

There are thwo types of imputation methods for plain vectors. They are 
distinguished by their replacement values. 

**Constant**

In "constant" imputation methods, missing values are replaced by an 
*a priori* selected constant value. No calculation are performed to derive 
replacement values and all missing value assume the same transformied value.

 * `na.zero` : Replace `NA`s with  0
 * `na.inf` / `na.neginf` : ... `Inf` / `-Inf`
 * `na.constant` : ... constant value


**Variable**

In variable methods, the value is calculated from the vector
containing the missing value(s) -- and only that vector. 
Missing values may have different values. Replacement values may (or may not) 
be affected by the ording of the vector. Cummatative. The vectors here are 
all *commutative*, i.e. they don't depend on the order of the vector. 
*Non-cummative*, order dependent methods are common to time series data and are
found in the **na.ts.tools** package.

(When imputing in a table, variable imputation is also called 
*column-based imputation* since replacement values derive from the single 
column. Table-based imputation is found in the **tidyimpute** package.)

 * `na.max` - maximum  
 * `na.min` - minumum 
 * `na.mean` - mean 
 * `na.median` - median value
 * `na.quantile` - quantile value
 * `na.sample`/`na.random` - randomly sampled value
 
 
**General**
 * `na.replace`/`na.explicit` - atomic vectors only. General replacement function
 * `na.implicit` - turn explicit values to NAs


## See Also 

I number of other packages deal with missing values and imputation. Here is a
short, incomplete list:

* [randomForest::na.roughfix()]


