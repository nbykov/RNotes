# Nik Tyresen
# Function that accumulates results of floating point error

fp_error <- function(n) {
  
  #fp_error <- vector() # Looks like error is fixed
  acc_fp_error <- 0
  n_steps <- 0
  
  repeat{
    x <- 0.1 + 0.1 + 0.1
    y <- x - 0.3 # Analytically, 0.1 + 0.1 + 0.1 - 0.3 = 0
    #fp_error <- c(fp_error, y)
	acc_fp_error <- acc_fp_error + y
    n_steps <- n_steps + 1
    if (n_steps == n) {
      break
    }
   }

  fp_error_output <- list(acc_fp_error, n_steps)#, fp_error)
  names(fp_error_output) <- c("acc_fp_error", "n_steps")#, "fp_error")
  return(fp_error_output)

}

# Try:
# fp_error(1e5)

## END