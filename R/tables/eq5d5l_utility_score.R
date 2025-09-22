#' Name         : eq5d5l_utility_score.R
#' Author       : Alexandre Bohyn
#' Date         : 19 September 2025
#' Purpose      : description
#' Files created:
#'  - `data/tables/eq5d5l_utility_score.R.rds`
#'  - `output/tables/eq5d5l_utility_score.R.docx/html` (optional)
#' Edits        :
#'  - 19 September 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(gtsummary)
library(flextable)


# Data ---------------------------------------------------------------------------

# Load the full data set
data <- readRDS("data/processed/data_fr.rds")

# Subset to EQ-5D-5L utility score only
df <- data |>
  filter(lastpage == 16) |>
  select(id, H6, H12) |>
  mutate(change = H12 - H6) |>
  pivot_longer(
    cols = c(H6, H12),
    names_to = "timepoint",
    values_to = "health_score"
  ) |>
  mutate(
    timepoint = case_when(
      timepoint == "H6" ~ "Before first symptoms",
      timepoint == "H12" ~ "Today"
    ),
    timepoint = factor(
      timepoint,
      levels = c("Before first symptoms", "Today")
    )
  )


# Create table -------------------------------------------------------------------

(tbl <- tbl_summary(
  df,
  by = timepoint,
  include = health_score,
  statistic = list(health_score ~ "{mean} ({sd})"),
  label = list(health_score ~ "EQ-5D-5L utility score"),
  missing_text = "Missing"
) |>
  add_ci(pattern = "{stat} [{ci}]") |>
  add_p(
    test = list(health_score ~ "t.test"),
    test.args = list(paired = TRUE)
  ) |>
  remove_abbreviation(abbreviation = "CI = Confidence Interval") |>
  modify_header(all_stat_cols() ~ "**{level}**\nN = {n}") |>
  modify_spanning_header(all_stat_cols() ~ "**Time**") |>
  modify_footnote(
    all_stat_cols() ~ "Mean (SD) [95% CI]",
    p.value ~ "Paired t-test"
  ) |>
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
    path = "results/tables/eq5d5l_utility_score.docx",
    pr_section = ps
  )
