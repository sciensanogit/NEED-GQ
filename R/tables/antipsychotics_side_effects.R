#' Name         : antipsychotics_side_effects.R
#' Author       : Alexandre Bohyn
#' Date         : 22 September 2025
#' Purpose      : description
#' Files created:
#'  - `data/tables/antipsychotics_side_effects.R.rds`
#'  - `output/tables/antipsychotics_side_effects.R.docx/html` (optional)
#' Edits        :
#'  - 22 September 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(gtsummary)
library(flextable)

# Load functions ----------------------------------------------------------

purrr::walk(list.files("R/functions", full.names = TRUE), source)
caption <- "List of antipsychotics and their side effects (non-exhaustive)"

# Data ---------------------------------------------------------------------------

# Read full data
data <- read_rds("data/processed/data_fr.rds")

# Subset drug information
drug <- data |>
  filter(lastpage == 16) |>
  select(id, matches("HC3_SQ.+"))
drug_long <- drug |>
  pivot_longer(-id, names_to = "drug", values_to = "value")

# Subset side effects information
side_effects <- data |>
  filter(lastpage == 16) |>
  select(id, matches("HC4_SQ.+"))
side_effects_long <- side_effects |>
  pivot_longer(-id, names_to = "side_effect", values_to = "value")

# Create grid of all id, drugs and side effects
grid <- expand_grid(
  id = unique(data$id),
  drug = unique(drug_long$drug),
  side_effect = unique(side_effects_long$side_effect)
)

# Merge drug and side effects information
df <- grid |>
  left_join(side_effects_long, by = c("id", "side_effect")) |>
  left_join(drug_long, by = c("id", "drug")) |>
  mutate(selected = value.x == 1 & value.y == 1) |>
  filter(selected)

# Count the number of side effects per drug
df_count <- df |>
  count(drug, side_effect)

# Get variable labels into a list for the flextable
drug_lbl <- get_labels(drug, -id)
drug_lbl$label <- stringr::str_remove(drug_lbl$label, " \\(.*\\)")
side_effect_lbl <- get_labels(side_effects, -id)
side_effect_lbl$label <- stringr::str_remove(side_effect_lbl$label, " \\(.*\\)")

# Merge labels with counts
df_count_lbl <- df_count |>
  left_join(drug_lbl, by = c("drug" = "variable")) |>
  rename(drug_label = label) |>
  left_join(side_effect_lbl, by = c("side_effect" = "variable")) |>
  rename(side_effect_label = label)

# Create table -------------------------------------------------------------------

(tbl <- tbl_cross(
  df_count_lbl,
  col = drug_label,
  row = side_effect_label,
  label = list(
    drug_label = "Medication",
    side_effect_label = "Side Effect"
  ),
  margin = NULL # No total column
) |>
  bold_labels() |>
  modify_table_body(
    ~ .x |>
      dplyr::mutate(
        across(
          starts_with("stat_"),
          ~ case_match(
            .x,
            "1" ~ "X",
            "0" ~ "",
            .default = NA_character_
          )
        )
      )
  ) |>
  as_flex_table())

# Save table --------------------------------------------------------------

tbl |>
  set_caption(caption) |>
  width(j = 1, width = 5, unit = "cm") |>
  width(j = 2:12, width = 2, unit = "cm") |>
  flextable::save_as_docx(
    path = "results/tables/antipsychotics_side_effects.docx",
    pr_section = officer::prop_section(
      page_size = officer::page_size(orient = "landscape")
    )
  )
