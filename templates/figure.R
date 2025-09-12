#' Name         : {{name}}.R
#' Author       : Alexandre Bohyn
#' Date         : {{date}}
#' Purpose      :
#' Files created: - `results/figures/png/{{name}}.png`
#'                - `results/figures/pptx/{{name}}.pptx`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(ggtext)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_fr.rds")

# Define caption -----------------------------------------------------------------

caption <- glue("Caption holder")

# Create the figure --------------------------------------------------------

fig <- ggplot()

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/{{name}}.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/{{name}}.pptx",
  overwrite = TRUE
)
