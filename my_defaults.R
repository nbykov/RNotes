# My defaults for R :)

# ===***===

# Run this LOCALLY for reproducibility, when working with datasets with
# a lot of character vectors
options(stringsAsFactors = FALSE)

# Write this to c:/Program Files/R/R-X.X.X/etc/Rprofile.site
beer <- function(save = "no") { q(save = save) }

local({
  r = getOption("repos")
  r["CRAN"] = "https://mirrors.dotsrc.org/cran/" # AAU Mirror
  options(repos = r)
})

# ===***===

# Installing packages
install.packages(c("tidyverse", "psych", "car", "MASS", "faraway",
  "devtools", "nortest"), dependencies = TRUE, verbose = TRUE)
