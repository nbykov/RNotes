# My defaults for R :)

options(stringsAsFactors = FALSE) # Makes strings as factors default to FALSE
options(repos = c(CRAN = "https://mirrors.dotsrc.org/cran/")) # Default CRAN

# Write this to c:/Program Files/R/R-3.6.2/etc/Rprofile.site
beer <- function(save = "no") { q(save = save) }

# Installing packages
install.packages(c("tidyverse", "psych", "car", "MASS", "faraway",
  "devtools", "nortest"),
  lib = "C:/Program Files/R/R-3.6.2/library",
  repos = "https://mirrors.dotsrc.org/cran/", dependencies = TRUE, verbose = TRUE)

library(devtools)
  
devtools::install_github("csgillespie/efficient",
  lib = "C:/Program Files/R/R-3.6.2/library",
  repos = "https://mirrors.dotsrc.org/cran/", dependencies = TRUE, verbose = TRUE)
  
devtools::install_github("hadley/r4ds",
  lib = "C:/Program Files/R/R-3.6.2/library",
  repos = "https://mirrors.dotsrc.org/cran/", dependencies = TRUE, verbose = TRUE)
