#' Name         : impact_sexual_reproductive_health.R
#' Author       : Alexandre Bohyn
#' Date         : September 15, 2025
#' Purpose      : Create a facetted histogram to show the impact of the
#'               psychotic troubles on sexual and reproductive health.
#'               Answer NA and "I don't know" are excluded.
#'              (French version)
#' Files created: - `results/figures/png/impact_sexual_reproductive_health.png`
#'                - `results/figures/pptx/impact_sexual_reproductive_health.pptx`
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
  select(id, H14, H15)

# Pivot to long, filter unwanted answers and label the variables
df_long <- df |>
  mutate(across(-id, remove_val_labels)) |>
  pivot_longer(
    cols = c(H14, H15),
    names_to = "question",
    values_to = "answer"
  ) |>
  filter(!answer %in% c(6, 7) & !is.na(answer)) |>
  mutate(
    question = recode(
      question,
      H14 = "Sexual life",
      H15 = "Reproductive life"
    ),
    answer = factor(
      answer,
      levels = c(1:5, 8),
      labels = c(
        "Not at all",
        "Slightly",
        "Moderately",
        "A lot",
        "Extremely",
        "I don't want to answer"
      )
    )
  )

# Make into a count table
df_count <- df_long |>
  count(question, answer) |>
  group_by(question) |>
  add_count(name = "total", wt = n) |>
  mutate(
    percentage = n / sum(n) * 100,
    perc_label = scales::percent(percentage / 100, accuracy = 1),
    label = glue("{n}\n({perc_label})"),
    question = glue::glue("{question} (N = {total})")
  ) |>
  ungroup()

# Define caption -----------------------------------------------------------------

caption <- glue(
  "Impact of psychotic disorder on the sexual and reproductive health"
)

# Create the figure --------------------------------------------------------

fig <- df_count |>
  ggplot(aes(x = answer, y = n, fill = answer)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = label), vjust = -0.5, size = 5) +
  scale_y_continuous(expand = expansion(mult = c(0.05, 0.45))) +
  facet_wrap(~question) +
  labs(
    title = caption,
    x = "",
    y = "Number of patients"
  ) +
  theme_kce(font_size = 16) +
  see::scale_fill_material() +
  theme(
    legend.position = "none",
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid.major.y = element_line(size = 0.1, color = "grey80")
  )

# Export it ---------------------------------------------------------------

# Save to png
ggsave(
  filename = "results/figures/png/impact_sexual_reproductive_health.png",
  plot = fig,
  width = 8,
  height = 6,
  dpi = 300
)

# Save to powerpoint
create_pptx(
  ggobj = fig,
  path = "results/figures/pptx/impact_sexual_reproductive_health.pptx",
  overwrite = TRUE
)
