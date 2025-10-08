#' Name         : impact_personal_relations.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      :
#' Files created: - `results/figures/png/impact_personal_relations.png`
#'                - `results/figures/pptx/impact_personal_relations.pptx`
#'               - `data/processed/subdata/impact_personal_relations.rds`
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

# Subset and modify the data
df_long <- pivot_impact_data(data, var = "S6")

# Save the intermediate data
df_long |>
  select(id, impact_personal_relations = answer_num) |>
  saveRDS("data/processed/subdata/impact_personal_relations.rds")

# Summarize the number of patients per answer
df <- summarize_impact_data(df_long)

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Impact of the psychosis disorder on personal relations (N={unique(df$total)})"
)

# Create the figure --------------------------------------------------------

fig <- plot_impact_data(df, caption = caption)

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/impact_personal_relations.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/impact_personal_relations.pptx",
  overwrite = TRUE
)
