#' Name         : eq5d5l_pain_discomfort.R
#' Author       : Alexandre Bohyn
#' Date         : September 12, 2025
#' Purpose      : Create a bar chart of EQ-5D-5L pain/discomfort dimension before the
#'               onset of first symptoms and today.
#'               Also creates a version as a Sankey diagram.
#' Files created: - `results/figures/png/eq5d5l_pain_discomfort.png`
#'                - `results/figures/pptx/eq5d5l_pain_discomfort.pptx`
#'                - `results/figures/pptx/eq5d5l_pain_discomfort_sankey.png`
#'                - `results/figures/pptx/eq5d5l_pain_discomfort_sankey.pptx`
#' Edits        :

# Packages ----------------------------------------------------------------

library(tidyverse)
library(glue)
library(ggalluvial)

# Load the functions
walk(list.files("R/functions", full.names = TRUE), source)

# Load and modify the data -------------------------------------------------------

# Original data
data <- readRDS("data/processed/data_fr.rds")

# Subset patients that finished the survey and EQ-5D-5L questions
df <- data |>
  filter(lastpage == 16) |>
  select(id, H4, H10) |>
  mutate(across(c(H4, H10), as.integer))

# Pivot to long format and label the time points
df_long <- df |>
  pivot_longer(
    cols = -id,
    names_to = "timepoint",
    values_to = "value"
  ) |>
  filter(value != 6) |>
  mutate(
    timepoint = case_when(
      timepoint == "H4" ~ "Before onset of first symptoms",
      timepoint == "H10" ~ "Today"
    ) |>
      factor(levels = c("Before onset of first symptoms", "Today")),
    value = factor(
      value,
      levels = 1:5,
      labels = c(
        "None",
        "Slight",
        "Moderate",
        "Severe",
        "Extreme"
      )
    )
  )

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Changes in self-reported level of problems with pain/discomfort of the EQ-5D-5L before onset of first symptoms and today (N={nrow(df)})"
)

# Create the figure --------------------------------------------------------

fig <- df_long |>
  ggplot(aes(x = timepoint, fill = value)) +
  geom_bar(position = "fill") +
  labs(
    title = str_wrap(caption, width = 35),
    x = "",
    y = "Proportion of patients",
    fill = "Pain or discomfort level"
  ) +
  see::scale_fill_material() +
  scale_y_continuous(
    labels = scales::percent_format(accuracy = 1),
    breaks = scales::breaks_width(width = 0.2)
  ) +
  theme_kce() +
  theme(
    panel.grid.major.x = element_line(colour = "lightgray"),
    legend.position = "bottom"
  ) +
  guides(
    fill = guide_legend(title.position = "top", title.hjust = 0, nrow = 2)
  )

# Create the Sankey plot ---------------------------------------------------------

df_sankey <- df_long |>
  mutate(timepoint = as.numeric(timepoint)) |>
  pivot_wider(
    names_from = timepoint,
    values_from = value,
    names_prefix = "time_"
  ) |>
  count(time_1, time_2) |>
  filter(!is.na(time_1) & !is.na(time_2))

fig_sankey <- df_long |>
  ggplot(aes(
    x = timepoint,
    stratum = value,
    alluvium = id,
    fill = value,
    label = value
  )) +
  geom_flow(stat = "alluvium", lode.guidance = "frontback") +
  geom_stratum() +
  geom_label(stat = "stratum", size = 3, fill = "white") +
  see::scale_fill_material() +
  theme_void(14) +
  theme(
    axis.text.x = element_text(margin = margin(2, 2, 2, 2)),
    legend.position = "none"
  )

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/eq5d5l_pain_discomfort.png",
  plot = fig,
  width = 5,
  height = 6,
  dpi = 300
)
ggsave(
  filename = "results/figures/png/eq5d5l_pain_discomfort_sankey.png",
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
  path = "results/figures/pptx/eq5d5l_pain_discomfort.pptx",
  overwrite = TRUE
)
create_pptx(
  ggobj = fig_sankey,
  width = 5,
  height = 7,
  path = "results/figures/pptx/eq5d5l_pain_discomfort_sankey.pptx",
  overwrite = TRUE
)
