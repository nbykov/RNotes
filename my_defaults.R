# My defaults for R :)

# ===***===

## Installing packages
# Run R with administrator privileges if installing to R shared library
# Set mirror after installing a new version of R

install.packages(c("tidyverse", "psych", "car", "MASS", "faraway",
  "devtools", "nortest", "jtools"), dependencies = TRUE, verbose = TRUE)

# ===***===

## Write this to c:/Program Files/R/R-X.X.X/etc/Rprofile.site

local({
  r = getOption("repos")
  r["CRAN"] = "https://mirrors.dotsrc.org/cran/" # AAU Mirror
  options(repos = r)
})

# ===***===

## Write this to c:/Users/%USERNAME%/Documents/.Rprofile

beer <- function(save = "no") { q(save = save) }

# ===***===

## Edit this in c:/Program Files/R/R-X.X.X/etc/Rconsole

## Style
MDI = no

## Font
# https://stackoverflow.com/questions/14712401/set-font-and-font-size-in-r-console-programmatically)
# https://www.johndcook.com/blog/2008/10/31/changing-the-r-console-fonts/
font = TT Consolas
points = 14

# Dimensions (in characters) of the console.
rows = 40
columns = 100

# Dimensions (in characters) of the internal pager.
pgrows = 40
pgcolumns = 100

## Language for messages
language = "en"

# ===***===

## stringsAsFactors
# Run this LOCALLY (in the script preamble) for reproducibility,
# when working with datasets with a lot of character vectors
options(stringsAsFactors = FALSE)

# ===***===
