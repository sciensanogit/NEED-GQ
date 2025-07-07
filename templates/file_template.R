#' Name         : {{name}}.R
#' Author       : Alexandre Bohyn
#' Date         : 2025-07-07
#' Purpose      : Generate the {{type}} \"{{name}}\"
#' Files created: `data/{{type}}s/{{name}}.R`
#' Edits        :

# File information -----------------------------------------------------

info <- get_info({{ id }})

# Packages ----------------------------------------------------------------

library(here)


# Load data --------------------------------------------------------------

# Save file --------------------------------------------------------------

path <- info$path
