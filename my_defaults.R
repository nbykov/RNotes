# My defaults for R :)

options(stringsAsFactors = FALSE) # Makes strings as factors default to FALSE
options(repos = c(CRAN = "https://mirrors.dotsrc.org/cran/")) # Default CRAN

# Write this to c:/Program Files/R/R-3.5.1/etc/Rprofile.site
beer <- function(save = "no") { q(save = save) }

# Installing packages
install.packages(c("tidyverse", "psych", "car", "MASS", "faraway"), lib = "C:/Program Files/R/R-3.5.1/library",
  repos = "https://mirrors.dotsrc.org/cran/", dependencies = TRUE, verbose = TRUE)
