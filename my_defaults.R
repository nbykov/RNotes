# My defaults for R :)

# ===***===

# Installing packages
install.packages(c("tidyverse", "psych", "car", "MASS", "faraway",
  "devtools", "nortest", "jtools"), dependencies = TRUE, verbose = TRUE)

# ===***===

# Run this LOCALLY (in the script preamble) for reproducibility,
# when working with datasets with a lot of character vectors
options(stringsAsFactors = FALSE)

# ===***===

# Write this to c:/Program Files/R/R-X.X.X/etc/Rprofile.site
beer <- function(save = "no") { q(save = save) }

local({
  r = getOption("repos")
  r["CRAN"] = "https://mirrors.dotsrc.org/cran/" # AAU Mirror
  options(repos = r)
})

# ===***===

# Edit this in c:/Program Files/R/R-X.X.X/etc/Rconsole

## Style
MDI = no

## Font
# https://stackoverflow.com/questions/14712401/set-font-and-font-size-in-r-console-programmatically)
# https://www.johndcook.com/blog/2008/10/31/changing-the-r-console-fonts/
font = Consolas
points = 14

## Language for messages
language = "en"
