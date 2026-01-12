#' Name         : eq5d5l_usual_activities.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Create a figure for the EQ-5D-5L usual activities dimension before
#'                and after onset of the first symptoms.
#' Files created: - `results/figures/png/eq5d5l_usual_activities.png`
#'                - `results/figures/pptx/eq5d5l_usual_activities.pptx`
#'               - `data/processed/subdata/eq5d5l_usual_activities.rds`
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

# Subset respondents that finished the survey and EQ-5D-5L questions and pivot to long
# format and label the time points
df_long <- pivot_eq5d5l_data(data, "H3", "H9")

# Save the long data frame for future use
df_long |>
  pivot_wider(id_cols = id, names_from = timepoint, values_from = value_num) |>
  mutate(change = Today - `Before onset of first symptoms`) |>
  select(id, eq5d5l_usual_activities = change) |>
  saveRDS("data/processed/subdata/eq5d5l_usual_activities.rds")

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Changes in self-reported level of problems with usual activities of the EQ-5D-5L before onset of first symptoms and today (N={n_distinct(df_long$id)})"
)

# Create the Sankey plot ---------------------------------------------------------

fig_sankey <- plot_eq5d5l_sankey(data = df_long, caption = caption)

# Create a table ----
tab_sankey <- table_eq5d5l_sankey(data = df_long, caption = caption)
flextable::save_as_docx(
  tab_sankey,
  path = "results/tables/eq5d5l_usual_activities_sankey.docx"
)

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/eq5d5l_usual_activities_sankey.png",
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
  path = "results/figures/pptx/eq5d5l_usual_activities_sankey.pptx",
  overwrite = TRUE
)
