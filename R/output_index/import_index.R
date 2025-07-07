#' Name         : import_index.R
#' Author       : Alexandre Bohyn
#' Date         : 2025-07-07
#' Purpose      : Import the "output_index.xlsx" file from the `data/` folder
#'                into a `.rds` file to be used to generate the `.R` files listed
#'                in the excel file.
#' Files created: `data/output_index/output_index.R`
#' Edits        :

# Packages ----------------------------------------------------------------

library(here)
library(readxl)

# Import data ------------------------------------------------------------

index <- read_xlsx(
  path = here("data/output_index/output_index.xlsx"),
  sheet = 1,
  col_types = c("numeric", rep("text", 3))
)

# Define the file type as a factor
index$file_type <- factor(index$file_type, levels = c("table", "figure"))

# Save data --------------------------------------------------------------

saveRDS(index, file = here("data/output_index/output_index.rds"))
