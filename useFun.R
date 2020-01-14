# Some useful functions
# Nik Tyresen

# ===***===
# Function for easy exiting of R without saving the workspace image 

beer <- function(save = "no") { q(save = save) }

# ===***===
# Function for returning a numbered list of data frame columns
# https://stackoverflow.com/questions/56466715/explore-data-frame-and-provide-numbered-list-of-variables-in-r

dataframecolinf <- function(df) {
  data.frame(
    col_name = colnames(df),
    col_index = 1:ncol(df),
    col_class = sapply(df, class),
    row.names = NULL
  )
}