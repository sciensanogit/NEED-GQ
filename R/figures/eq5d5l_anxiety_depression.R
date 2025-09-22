#' Name         : eq5d5l_anxiety_depression.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Create a facetted bar plot of EQ-5D-5L anxiety/depression score before the
#'                onset of first symptoms and today.
#' Files created: - `results/figures/png/eq5d5l_anxiety_depression.png`
#'                - `results/figures/pptx/eq5d5l_anxiety_depression.pptx`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_fr.rds")

# Subset patients that finished the survey and EQ-5D-5L questions and pivot to long
# format and label the time points
df_long <- pivot_eq5d5l_data(data, "H5", "H11")

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Changes in self-reported level of problems with anxiety/depression of the EQ-5D-5L before onset of first symptoms and today (N={n_distinct(df_long$id)})"
)


# Create the Sankey plot ---------------------------------------------------------

fig_sankey <- plot_eq5d5l_sankey(data = df_long, caption = caption)

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/eq5d5l_anxiety_depression_sankey.png",
  plot = fig_sankey,
  width = 5,
  height = 7
)

# Save to powerpoint
create_pptx(
  ggobj = fig_sankey,
  width = 5,
  height = 7,
  path = "results/figures/pptx/eq5d5l_anxiety_depression_sankey.pptx",
  overwrite = TRUE
)
