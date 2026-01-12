#' Name         : treatment_by_diagnosis.R
#' Author       : Alexandre Bohyn
#' Date         : 22 September 2025
#' Purpose      : description
#' Files created:
#'  - `data/tables/treatment_by_diagnosis.rds`
#'  - `output/tables/treatment_by_diagnosis.docx/html` (optional)
#'  - `data/processed/subdata/treatment_by_diagnosis.rds`
#' Edits        :
#'  - 22 September 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(gtsummary)
library(flextable)
library(labelled)

# Load functions
purrr::walk(list.files("R/functions", full.names = TRUE), source)
caption <- "Self-reported treatment per diagnosis."

# Load the data -----------------------------------------------------------

data <- readRDS("data/processed/data_current.rds")

# Subset treatments variables
trt <- data |>
  filter(included == 1L) |>
  select(id, matches("HC3_SQ.+")) |>
  mutate(across(-id, ~ remove_val_labels(.x) %% 2))
trt_long <- trt |>
  pivot_longer(-id, names_to = "treatment", values_to = "value") |>
  mutate(value = if_else(value == 1, 1, 0))

# Subset diagnosis variables
diag <- data |>
  filter(included == 1L) |>
  select(id, starts_with("DSD1_A")) |>
  mutate(across(-id, ~ remove_val_labels(.x) %% 2))
diag_long <- diag |>
  pivot_longer(-id, names_to = "diagnosis", values_to = "value") |>
  mutate(value = if_else(value == 1, 1, 0))

# Create grid of all id, treatments and diagnoses
grid <- expand_grid(
  id = unique(data$id),
  treatment = unique(trt_long$treatment),
  diagnosis = unique(diag_long$diagnosis)
)

# Merge treatment and diagnosis information
df <- grid |>
  left_join(trt_long, by = c("id", "treatment")) |>
  left_join(diag_long, by = c("id", "diagnosis")) |>
  mutate(selected = value.x == 1 & value.y == 1) |>
  filter(selected)

# Get variable labels into a list for the flextable
trt_lbl <- get_labels(trt, -id) |>
  mutate(label = str_remove(label, "\\(.*\\)"))
diag_lbl <- get_labels(diag, -id) |>
  mutate(label = str_remove(label, "\\(.*\\)"))

# Merge labels with counts
df_count_lbl <- df |>
  left_join(trt_lbl, by = c("treatment" = "variable")) |>
  rename(treatment_label = label) |>
  left_join(diag_lbl, by = c("diagnosis" = "variable")) |>
  rename(diagnosis_label = label)

# Save treatment info in a separate sub data set
trt_long |>
  pivot_wider(names_from = treatment, values_from = value, values_fill = 0) |>
  set_variable_labels(
    .labels = as.list(trt_lbl$label) |> setNames(trt_lbl$variable)
  ) |>
  saveRDS("data/processed/subdata/treatment_by_diagnosis.rds")

# Create table -------------------------------------------------------------------

(tbl <- tbl_cross(
  df_count_lbl,
  row = treatment_label,
  col = diagnosis_label,
  percent = "row",
  label = list(treatment_label ~ "Treatment", diagnosis_label ~ "Diagnosis"),
  statistic = "{n} ({p}%)",
  margin = NULL # No total column
) |>
  bold_labels() |>
  add_p(
    test = "fisher.test",
    test.args = list(simulate.p.value = TRUE)
  ) |>
  as_flex_table())

# Save table --------------------------------------------------------------

tbl |>
  set_caption(caption, autonum = officer::run_autonum()) |>
  width(j = 1, width = 5, unit = "cm") |>
  width(j = 2:13, width = 2, unit = "cm") |>
  flextable::save_as_docx(
    path = "results/tables/treatment_by_diagnosis.docx",
    pr_section = officer::prop_section(
      page_size = officer::page_size(orient = "landscape")
    )
  )
