# Rainfall
# Nik Kharlamov, 10.03.2019

# Design a program called rainfall that consumes a list of numbers representing
# daily rainfall amounts as entered by a user. The list may contain the number -999
# indicating the end of the data of interest. Produce the average of the non-negative
# values in the list up to the first -999 (if it shows up). There may be negative
# numbers other than -999 in the list.
#
# Fisler, K. (n.d.). The recurring rainfall problem.

rainfall <- function(x) {
  if (is.vector(x, mode = "double") == FALSE & is.vector(x, mode = "integer") == FALSE) {
    stop("Input must be a double or integer vector")
  }
  i <- 1
  n <- 0
  tot_r <- 0
  while (i <= length(x)) {
    if (x[i] >= 0) {
	  tot_r <- tot_r + x[i]
      n <- n + 1
	  i <- i + 1
	} else if (x[i] == -999) {
	  break
    } else {
      i <- i + 1
	}	
  }
  mean_r <- tot_r / n
  if (is.nan(mean_r) == TRUE) warning("No relevant non-negative values in input",
    call. = FALSE)
  return(mean_r)
}

# Sample inputs
x1 <- c(1, 15, -2, 1, 15, 30, -999, 3, 3, 21) # numeric vector
x2 <- matrix(x1, 2) # this will return error
x3 <- c("a", "b", "c")
x4 <- c(1, 3, 5, 7, 9)
x5 <- c(-1, -3, -5, -7, -9)
x6 <- c(-999, 1, 3, 5, 7, 9)
x7 <- double()
x8 <- as.integer(x1)

