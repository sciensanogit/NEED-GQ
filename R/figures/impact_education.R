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

# Subset and modify the data
df <- data |>
  filter(lastpage == 16) |>
  select(id, answer = S1) |>
  filter(!is.na(answer) & answer != 7) |> # Exclude NA and "Not applicable"
  mutate(answer = to_factor(answer))

# Make into a count table
df_count <- df |>
  count(answer) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})")
  )

# Define caption -----------------------------------------------------------------

caption <- glue("Impact of the psychosis disorder on education (N={nrow(df)}).")

# Create the figure --------------------------------------------------------

fig <- ggplot(df_count, aes(x = answer, y = percentage, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  labs(
    title = str_wrap(caption, 70),
    x = NULL,
    y = "Number of patients"
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.3))) +
  see::scale_fill_material(name = NULL) +
  theme_kce(font_size = 14) +
  theme(
    legend.position = "none",
    panel.grid.major.y = element_line(size = 0.1, color = "grey80")
  )

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
