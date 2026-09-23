#' Euclidean algorithm for greatest common divisor
#'
#' @param a - A numeric scalar.
#' @param b - A numeric scalar.
#'
#' @return The greatest common divisor of a and b as a numeric scalar.
#'
#' @details Implements the Euclidean algorithm:
#' repeatedly replace the larger number with its remainder when divided
#' by the smaller number until the remainder is zero.
#'
#' @references \url{https://en.wikipedia.org/wiki/Euclidean_algorithm}
#'
#' @export

euclidean <- function(a, b) {
  stopifnot(is.numeric(a), is.numeric(b),
            length(a) == 1, length(b) == 1)
  
  a <- abs(a)
  b <- abs(b)
  
  repeat {
    if (b == 0) break
    temp <- b
    b <- a %% b
    a <- temp
  }
  
  return(a)
}