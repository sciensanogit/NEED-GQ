#' Name         : eq5d5l_self_care.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Create a figure for the EQ-5D-5L self-care dimension before and
#'                after onset of the first symptoms.
#' Files created: - `results/figures/png/eq5d5l_self_care.png`
#'               - `results/figures/pptx/eq5d5l_self_care.pptx`
#'               - `data/processed/subdata/eq5d5l_self_care.rds`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_current.rds")

# Subset patients that finished the survey and EQ-5D-5L questions and pivot to long
# format and label the time points
df_long <- pivot_eq5d5l_data(data, "H2", "H8")

# Save the long data frame for future use
df_long |>
  filter(timepoint == "Today") |>
  select(id, eq5_self_care = value_num) |>
  saveRDS("data/processed/subdata/eq5d5l_self_care.rds")

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Changes in self-reported level of problems with self-care of the EQ-5D-5L before onset of first symptoms and today (N={n_distinct(df_long$id)})"
)

# Create the Sankey plot ---------------------------------------------------------

fig_sankey <- plot_eq5d5l_sankey(data = df_long, caption = caption)

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/eq5d5l_self_care_sankey.png",
  plot = fig_sankey,
  width = 5,
  height = 7,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig_sankey,
  width = 5,
  height = 7,
  path = "results/figures/pptx/eq5d5l_self_care_sankey.pptx",
  overwrite = TRUE
)
