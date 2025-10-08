#' Name         : demographics_survey.R
#' Author       : Alexandre Bohyn
#' Date         : 19 September 2025
#' Purpose      : description
#' Files created:
#'  - `output/tables/demographics_survey.R.docx`
#' Edits        :
#'  - 19 September 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(lubridate)
library(gtsummary)
library(flextable)

# Load the data ------------------------------------------------------------------

# Load the full data set
data <- readRDS("data/processed/data_current.rds")

# Subset to demographics variables only
df <- data |>
  filter(included == 1L) |>
  select(
    id,
    startlanguage,
    D1,
    D2,
    D3,
    D4,
    D5,
    D6,
    D7,
    D8,
    D9,
    D10,
    D11,
    D12
  ) |>
  mutate(
    across(c(-id, -startlanguage), labelled::to_factor),
    startlanguage = factor(
      startlanguage,
      levels = c("fr", "nl"),
      labels = c("French", "Dutch")
    ),
    age = interval(as.Date(D3, format = "%Y"), today()) / years(1),
    age_group = cut(
      age,
      breaks = c(-Inf, 24, 44, 64, 74, Inf),
      right = TRUE,
      labels = c("18-24", "25-44", "45-64", "65-74", "75+")
    )
  ) |>
  labelled::set_variable_labels(
    startlanguage = "Survey language",
    age_group = "Age group (in years)",
  )

# Create table ------------------------------------------------------------

tbl <- tbl_summary(
  data = df,
  include = c(
    D1, # Respondent
    D2, # Gender
    startlanguage,
    D4, # Province
    age_group,
    D10, # Paid job since first symptoms
    D9, # Job before diagnosis
    D11, # Job today,
    D5, # Education
    D6, # Living situation
    D7, # Country of birth
    D12 # Ability to make ends meet monthly
  ),
  missing_text = "Missing"
) |>
  bold_labels() |>
  as_flex_table()

# Export table to word ----------------------------------------------------

tbl |>
  width(j = 1, width = 10, unit = "cm") |>
  width(j = 2, width = 3, unit = "cm") |>
  save_as_docx(path = "results/tables/demographics_survey.docx")
