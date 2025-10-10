#' Name         : Health_impact_caregivers.R
#' Author       : Alexandre Bohyn
#' Date         : 10 October 2025
#' Purpose      : description
#' Files created: `output/figures/Health_impact_caregivers.png/pdf`
#' Edits        :
#'  - 10 October 2025: Created file.

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(labelled)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_current.rds")

# Subset and modify the data
df_long <- pivot_impact_data(data, var = "CG6")

# Summarize the number of respondents per answer
df <- summarize_impact_data(df_long)

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Impact of the caregiver role on health (N={unique(df$total)})"
)

# Create the figure --------------------------------------------------------

fig <- plot_impact_data(df, caption = caption)

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/Health_impact_caregivers.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/Health_impact_caregivers.pptx",
  overwrite = TRUE
)
