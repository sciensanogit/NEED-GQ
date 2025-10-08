#' Name         : clinical_features_psychotic.R
#' Author       : Alexandre Bohyn
#' Date         : 22 September 2025
#' Purpose      : description
#' Files created:
#'  - `data/tables/clinical_features_psychotic.R.rds`
#'  - `output/tables/clinical_features_psychotic.R.docx/html` (optional)
#' Edits        :
#'  - 22 September 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(gtsummary)
library(flextable)

# Load functions ----------------------------------------------------------

purrr::walk(list.files("R/functions", full.names = TRUE), source)
caption <- "Clinical features of psychotic disorders"

# Data ---------------------------------------------------------------------------

data <- read_rds("data/processed/data_current.rds")

# Subset data and patients of interest
df <- data |>
  filter(included == 1L) |>
  select(id, matches("HC13_SQ.+")) |>
  mutate(across(-id, ~ labelled::remove_val_labels(.x) - 1))

# Get variable labels into a list for the flextable
labels <- get_labels(df, -id)
labels$label <- stringr::str_remove(labels$label, " \\(.*\\)")
lbl_list <- as.list(labels$label) |> setNames(labels$variable)


# Create table -------------------------------------------------------------------

tbl <- tbl_summary(
  df,
  include = -id,
  label = lbl_list,
  missing_text = "Missing",
  type = everything() ~ "dichotomous",
  value = everything() ~ "1"
) |>
  as_flex_table()

# Save table --------------------------------------------------------------

tbl |>
  set_caption(caption, autonum = officer::run_autonum()) |>
  width(j = 1, width = 10, unit = "cm") |>
  width(j = 2, width = 3, unit = "cm") |>
  save_as_docx(path = "results/tables/clinical_features_psychotic.docx")
