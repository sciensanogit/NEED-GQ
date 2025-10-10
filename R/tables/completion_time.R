#' Name         : completion_time.R
#' Author       : Alexandre Bohyn
#' Date         : 10 October 2025
#' Purpose      : description
#' Files created:
#'  - `data/tables/completion_time.rds`
#'  - `output/tables/completion_time.docx/html` (optional)
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
  select(id, start = startdate, end = datestamp) |>
  mutate(
    completion_time = as.numeric(difftime(end, start, units = "hours")),
  )

# Create table -------------------------------------------------------------------

(tbl <- tbl_summary(
  df,
  include = completion_time,
  type = list(completion_time ~ "continuous2"),
  statistic = list(
    completion_time ~
      c("{mean} ({sd})", "{median} ({p25}, {p75})", "{min}, {max}")
  ),
  label = list(completion_time ~ "Time to complete the survey (hours)"),
  missing_text = "Missing"
) |>
  add_n() |>
  # add_ci(pattern = "{stat} [{ci}]") |>
  add_stat_label(location = "column") |>
  modify_header(all_stat_cols() ~ "**{level}**\nN = {n}") |>
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
    path = "results/tables/completion_time.docx",
    pr_section = ps
  )
