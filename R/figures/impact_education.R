#' Name         : impact_education.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Details      : Figure of the impact of the illness on education.
#'                Patients with NA answers are excluded.
#' Files created: - `results/figures/png/impact_education.png`
#'                - `results/figures/pptx/impact_education.pptx`
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

# Subset patients that finished the survey and impact questions and pivot to long
# format and label the answers
df <- pivot_impact_data(data, var = "S1")

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Impact of the psychosis disorder on education (N={unique(df$total)})"
)

# Create the figure --------------------------------------------------------

fig <- plot_impact_data(df, caption = caption)

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/impact_education.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/impact_education.pptx",
  overwrite = TRUE
)
