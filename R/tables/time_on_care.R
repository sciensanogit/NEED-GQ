#' Name         : time_on_care.R
#' Author       : Alexandre Bohyn
#' Date         : 10 October 2025
#' Purpose      : description
#' Files created:
#'  - `data/tables/time_on_care.rds`
#'  - `output/tables/time_on_care.docx/html` (optional)
#' Edits        :
#'  - 10 October 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(gtsummary)
library(flextable)

# Data --------------------------------------------------------------------------

# Load the full data set
data <- readRDS("data/processed/data_current.rds")

# Subset to EQ-5D-5L utility score only
df <- data |>
  filter(included == 1L) |>
  select(id, CG5)


# Create table -------------------------------------------------------------------

(tbl <- tbl_summary(
  df,
  include = CG5,
  statistic = list(CG5 ~ "{mean} ({sd})"),
  label = list(CG5 ~ "Time spent on care (hours per week)"),
  missing_text = "Missing"
) |>
  add_n() |>
  add_ci(pattern = "{stat} [{ci}]") |>
  remove_abbreviation(abbreviation = "CI = Confidence Interval") |>
  modify_header(all_stat_cols() ~ "**{level}**\nN = {n}") |>
  modify_footnote(all_stat_cols() ~ "Mean (SD) [95% CI]") |>
  as_flex_table())

# Save table --------------------------------------------------------------

# Create a prop section to have landscape orientation in Word
ps <- officer::prop_section(
  page_size = officer::page_size(orient = "landscape")
)

# Save table
tbl |>
  autofit() |>
  save_as_docx(
    path = "results/tables/time_on_care.docx",
    pr_section = ps
  )
