#' Name         : eq5d5l_mobility.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Create figure for EQ-5D-5L Mobility dimension before the
#'               onset of first symptoms and today.
#'               Also creates a version as a Sankey diagram.
#' Files created: - `results/figures/png/eq5d5l_mobility.png`
#'                - `results/figures/pptx/eq5d5l_mobility.pptx`
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
df_long <- pivot_eq5d5l_data(data, "H1", "H7")

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Changes in self-reported level of problems with mobility of the EQ-5D-5L before onset of first symptoms and today (N={n_distinct(df_long$id)})"
)

# Create the figure --------------------------------------------------------

fig <- plot_eq5d5l(
  data = df_long,
  category_name = "Mobility level",
  caption = caption
)

# Create the Sankey plot ---------------------------------------------------------

fig_sankey <- plot_eq5d5l_sankey(data = df_long, caption = caption)

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/eq5d5l_mobility.png",
  plot = fig,
  width = 5,
  height = 6,
  dpi = 300
)
ggsave(
  filename = "results/figures/png/eq5d5l_mobility_sankey.png",
  plot = fig_sankey,
  width = 5,
  height = 7,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  width = 5,
  height = 6,
  path = "results/figures/pptx/eq5d5l_mobility.pptx",
  overwrite = TRUE
)
create_pptx(
  ggobj = fig_sankey,
  width = 5,
  height = 7,
  path = "results/figures/pptx/eq5d5l_mobility_sankey.pptx",
  overwrite = TRUE
)
